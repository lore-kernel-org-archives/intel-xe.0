Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D598C02181
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 17:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E36910E12A;
	Fri, 24 Jan 2025 17:52:08 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132E110E12A;
 Fri, 24 Jan 2025 17:52:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7416527680803665878=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_PSR_DSB_support_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Jan 2025 17:52:07 -0000
Message-ID: <173774112705.4124501.13732218306306968864@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250124113906.850488-1-jouni.hogander@intel.com>
In-Reply-To: <20250124113906.850488-1-jouni.hogander@intel.com>
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

--===============7416527680803665878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PSR DSB support (rev5)
URL   : https://patchwork.freedesktop.org/series/142521/
State : failure

== Summary ==

CI Bug Log - changes from xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1_full -> xe-pw-142521v5_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142521v5_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142521v5_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142521v5_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-linear:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-linear.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [PASS][2] -> [DMESG-WARN][3] +3 other tests dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-adlp-2/igt@kms_fbcon_fbt@fbc-suspend.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][4] +1 other test dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html

  
Known issues
------------

  Here are the changes found in xe-pw-142521v5_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getstats:
    - shard-dg2-set2:     [PASS][5] -> [SKIP][6] ([Intel XE#2423]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@core_getstats.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@core_getstats.html

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [PASS][7] -> [FAIL][8] ([Intel XE#3440])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@core_getversion@all-cards.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@core_getversion@all-cards.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][9] -> [FAIL][10] ([Intel XE#3249])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@core_setmaster@master-drop-set-root.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [PASS][11] -> [SKIP][12] ([Intel XE#3453])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@core_setmaster@master-drop-set-shared-fd.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@unaligned-read:
    - shard-dg2-set2:     [PASS][13] -> [SKIP][14] ([Intel XE#2134])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@fbdev@unaligned-read.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@fbdev@unaligned-read.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#3767]) +15 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][16] -> [SKIP][17] ([Intel XE#2423] / [i915#2575]) +144 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-435/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1407])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2327]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#316])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#1124]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1124])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1124]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#367])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2314] / [Intel XE#2894])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#367])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#367]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#367])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#2136] / [Intel XE#2351])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][32] -> [SKIP][33] ([Intel XE#2136] / [Intel XE#2351]) +21 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#787]) +76 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#2887]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2887]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][39] ([Intel XE#1033] / [Intel XE#2625])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#3442])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#787]) +8 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][42] ([Intel XE#1727] / [Intel XE#3113])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][43] ([Intel XE#3124] / [Intel XE#4010])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#306])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2252]) +5 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@hdmi-crc-planes-random:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#373]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_chamelium_frames@hdmi-crc-planes-random.html
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#373]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_chamelium_frames@hdmi-crc-planes-random.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#373]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#3278])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#307])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#307])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#2321])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2321]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2320])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#308])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1424]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#308])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#309]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][59] -> [DMESG-WARN][60] ([Intel XE#877])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#309]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2244])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#776])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#776])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#703])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1421]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-dg2-set2:     [PASS][67] -> [INCOMPLETE][68] ([Intel XE#2049]) +1 other test incomplete
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-434/igt@kms_flip@2x-blocking-wf_vblank.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-463/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][69] ([Intel XE#1033]) +1 other test dmesg-warn
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-8/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#310])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][71] -> [FAIL][72] ([Intel XE#3321])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][73] -> [FAIL][74] ([Intel XE#301]) +4 other tests fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][75] -> [FAIL][76] ([Intel XE#301]) +5 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][77] -> [FAIL][78] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#455]) +6 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1401] / [Intel XE#1745])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1401])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2293]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#455]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][85] -> [DMESG-FAIL][86] ([Intel XE#1033])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2311]) +11 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#651]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#651]) +6 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#651]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#4141]) +8 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [PASS][92] -> [SKIP][93] ([Intel XE#2136]) +41 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2352])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#656]) +8 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2313]) +10 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#653]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#2136]) +5 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#656]) +6 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#653]) +6 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#1470])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-3/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1503]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-3/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-bmg:          [PASS][103] -> [DMESG-WARN][104] ([Intel XE#1033]) +13 other tests dmesg-warn
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-8/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2763]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#870])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][107] -> [SKIP][108] ([Intel XE#2446]) +5 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1439] / [Intel XE#3141])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#2893]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#1489]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#1489]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1489]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@pr-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_psr@pr-basic.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#3414] / [Intel XE#3904])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#3414] / [Intel XE#3904])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#3414])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2413])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1435])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2168])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_vrr@cmrr.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#756])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#756])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1123])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_eudebug@basic-client-th:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#2905]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@xe_eudebug@basic-client-th.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#2905]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-3/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2905]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@xe_eudebug_online@stopped-thread.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#2905]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_evict@evict-beng-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#688])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@xe_evict@evict-beng-large-multi-vm.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#261] / [Intel XE#688])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [PASS][132] -> [SKIP][133] ([Intel XE#1130]) +245 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@xe_exec_balancer@once-parallel-rebind.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1392]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2322]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][136] -> [SKIP][137] ([Intel XE#1392]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#1392]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#288]) +6 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#288]) +5 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#1130]) +6 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html

  * igt@xe_exec_threads@threads-hang-fd-userptr:
    - shard-dg2-set2:     [PASS][142] -> [DMESG-WARN][143] ([Intel XE#1033])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2229])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#1192])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169]) -> ([PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [SKIP][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195]) ([Intel XE#2457])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-1/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-5/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-2/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-5/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-3/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-3/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-3/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-6/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-8/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-8/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-4/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-8/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-1/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-2/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-2/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-8/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-5/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-1/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-7/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-7/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-7/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-4/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-7/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-4/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-5/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-3/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-4/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-4/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-8/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-8/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-8/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-5/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-5/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-5/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-4/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-4/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-8/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-3/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-1/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-1/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-1/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-1/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-3/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220]) -> ([PASS][221], [SKIP][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246]) ([Intel XE#378])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-435/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-436/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-436/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-434/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-434/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-435/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-435/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-435/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-434/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-436/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-434/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-434/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-436/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-433/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-433/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-433/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-436/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-463/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-463/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-436/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-432/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-432/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-432/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-463/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-463/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-434/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_module_load@load.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [PASS][247] -> [FAIL][248] ([Intel XE#3546])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@xe_module_load@reload.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_module_load@reload.html

  * igt@xe_oa@non-system-wide-paranoid:
    - shard-adlp:         NOTRUN -> [SKIP][249] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@xe_oa@non-system-wide-paranoid.html

  * igt@xe_oa@stress-open-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][250] ([Intel XE#2541] / [Intel XE#3573])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@xe_oa@stress-open-close.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][251] ([Intel XE#1173])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][252] ([Intel XE#1358])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@xe_pm@d3hot-basic-exec.html

  * igt@xe_pm@s3-basic:
    - shard-dg2-set2:     [PASS][253] -> [ABORT][254] ([Intel XE#1033] / [Intel XE#1358] / [Intel XE#1794])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@xe_pm@s3-basic.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-432/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][255] -> [ABORT][256] ([Intel XE#1358] / [Intel XE#1794])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-436/igt@xe_pm@s3-d3hot-basic-exec.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][257] -> [ABORT][258] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-adlp-4/igt@xe_pm@s4-basic-exec.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][259] ([Intel XE#2284] / [Intel XE#366])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          NOTRUN -> [SKIP][260] ([Intel XE#944])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@xe_query@multigpu-query-gt-list.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][261] ([Intel XE#944])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-topology:
    - shard-adlp:         NOTRUN -> [SKIP][262] ([Intel XE#944])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@xe_query@multigpu-query-topology.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4:
    - shard-bmg:          [INCOMPLETE][263] -> [PASS][264]
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4.html

  * igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][265] ([Intel XE#1033]) -> [PASS][266] +1 other test pass
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-adlp-8/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-8/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][267] ([Intel XE#3862]) -> [PASS][268] +1 other test pass
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][269] ([Intel XE#2692] / [Intel XE#4010]) -> [PASS][270]
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][271] ([Intel XE#877]) -> [PASS][272] +1 other test pass
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-6/igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-8/igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][273] ([Intel XE#3321]) -> [PASS][274] +5 other tests pass
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [DMESG-WARN][275] ([Intel XE#2955]) -> [PASS][276]
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][277] ([Intel XE#1033]) -> [PASS][278] +17 other tests pass
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-434/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-436/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp4:
    - shard-dg2-set2:     [FAIL][279] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][280]
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
    - shard-adlp:         [DMESG-FAIL][281] ([Intel XE#1033]) -> [PASS][282]
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][283] ([Intel XE#616]) -> [PASS][284] +1 other test pass
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-lnl:          [INCOMPLETE][285] -> [PASS][286] +1 other test pass
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-lnl-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][287] ([Intel XE#899]) -> [PASS][288] +1 other test pass
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-d-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][289] ([Intel XE#1033]) -> [PASS][290] +30 other tests pass
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-3/igt@kms_vblank@ts-continuation-idle-hang@pipe-d-hdmi-a-3.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-4/igt@kms_vblank@ts-continuation-idle-hang@pipe-d-hdmi-a-3.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-bmg:          [DMESG-WARN][291] ([Intel XE#1033] / [Intel XE#1473]) -> [PASS][292]
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-4/igt@xe_evict@evict-large-multi-vm.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-4/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#1392]) -> [PASS][294] +1 other test pass
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][295] ([Intel XE#1192]) -> [PASS][296]
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-2/igt@xe_live_ktest@xe_bo.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-adlp:         [DMESG-WARN][297] ([Intel XE#2953]) -> [PASS][298]
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-4/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-dg2-set2:     [ABORT][299] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][300]
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-basic-exec:
    - shard-adlp:         [DMESG-WARN][301] ([Intel XE#569]) -> [PASS][302]
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-adlp-3/igt@xe_pm@s3-basic-exec.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-8/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [ABORT][303] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][304]
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [ABORT][305] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][306]
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-3/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [ABORT][307] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][308]
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@xe_pm@s4-mocs.html

  * igt@xe_vm@mixed-misaligned-binds-3145728:
    - shard-adlp:         [DMESG-WARN][309] -> [PASS][310] +2 other tests pass
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-adlp-3/igt@xe_vm@mixed-misaligned-binds-3145728.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-8/igt@xe_vm@mixed-misaligned-binds-3145728.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#873]) -> [SKIP][312] ([Intel XE#2423] / [i915#2575])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#316]) -> [SKIP][314] ([Intel XE#2136]) +2 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#316]) -> [SKIP][316] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#619]) -> [SKIP][318] ([Intel XE#2136] / [Intel XE#2351])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#610]) -> [SKIP][320] ([Intel XE#2136]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#1124]) -> [SKIP][322] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#1124]) -> [SKIP][324] ([Intel XE#2136]) +10 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#607]) -> [SKIP][326] ([Intel XE#2136])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#2191]) -> [SKIP][328] ([Intel XE#2423] / [i915#2575])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#367]) -> [SKIP][330] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][332] ([Intel XE#2136]) +15 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][334] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [DMESG-WARN][335] ([Intel XE#1033]) -> [ABORT][336] ([Intel XE#1033] / [Intel XE#2625])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][337] ([Intel XE#2692] / [Intel XE#4010]) -> [INCOMPLETE][338] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#2907]) -> [SKIP][340] ([Intel XE#2136]) +2 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#306]) -> [SKIP][342] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#373]) -> [SKIP][344] ([Intel XE#2423] / [i915#2575]) +17 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][345] ([i915#2575]) -> [SKIP][346] ([Intel XE#2423] / [i915#2575]) +31 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          [INCOMPLETE][347] -> [FAIL][348] ([Intel XE#1178]) +1 other test fail
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-1/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-3/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][349] -> [INCOMPLETE][350] ([Intel XE#4132])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-433/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [FAIL][351] ([Intel XE#1178]) -> [SKIP][352] ([Intel XE#2423] / [i915#2575])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@kms_content_protection@srm.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][353] ([Intel XE#1188]) -> [SKIP][354] ([Intel XE#2423] / [i915#2575])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_content_protection@uevent.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#308]) -> [SKIP][356] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#323]) -> [SKIP][358] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#455]) -> [SKIP][360] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#455]) -> [SKIP][362] ([Intel XE#2136]) +5 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-bmg:          [SKIP][363] ([Intel XE#2316]) -> [DMESG-WARN][364] ([Intel XE#1033]) +1 other test dmesg-warn
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-8/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          [INCOMPLETE][365] -> [INCOMPLETE][366] ([Intel XE#1504]) +1 other test incomplete
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-lnl-7/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][368] ([Intel XE#2136]) +29 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][370] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#651]) -> [SKIP][372] ([Intel XE#2136]) +33 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][373] ([Intel XE#2312]) -> [SKIP][374] ([Intel XE#2311]) +3 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#651]) -> [SKIP][376] ([Intel XE#2136] / [Intel XE#2351]) +18 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#658]) -> [SKIP][378] ([Intel XE#2136] / [Intel XE#2351])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][379] ([Intel XE#2312]) -> [SKIP][380] ([Intel XE#2313]) +3 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#653]) -> [SKIP][382] ([Intel XE#2136] / [Intel XE#2351]) +9 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#653]) -> [SKIP][384] ([Intel XE#2136]) +34 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#605]) -> [SKIP][386] ([Intel XE#2423] / [i915#2575])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][387] ([Intel XE#3544]) -> [SKIP][388] ([Intel XE#3374] / [Intel XE#3544])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#2927]) -> [SKIP][390] ([Intel XE#2136])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#356]) -> [SKIP][392] ([Intel XE#2423] / [i915#2575])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][394] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#2938]) -> [SKIP][396] ([Intel XE#2136])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#870]) -> [SKIP][398] ([Intel XE#2136])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@kms_pm_backlight@fade.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#3309]) -> [SKIP][400] ([Intel XE#2136])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_pm_dc@dc5-retention-flops.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#908]) -> [SKIP][402] ([Intel XE#2136])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#1489]) -> [SKIP][404] ([Intel XE#2136]) +15 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][406] ([Intel XE#2136]) +15 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][408] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@kms_psr@psr-dpms.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#1127]) -> [SKIP][410] ([Intel XE#2423] / [i915#2575])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#3414]) -> [SKIP][412] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][413] ([Intel XE#1729]) -> [SKIP][414] ([Intel XE#2423] / [i915#2575])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#455]) -> [SKIP][416] ([Intel XE#2423] / [i915#2575]) +12 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_vrr@flip-dpms.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#756]) -> [SKIP][418] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#1126]) -> [SKIP][420] ([Intel XE#1130])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#2905]) -> [SKIP][422] ([Intel XE#1130]) +20 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@xe_eudebug@basic-close.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_eudebug@basic-close.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#1392]) -> [SKIP][424] ([Intel XE#1130]) +4 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#288]) -> [SKIP][426] ([Intel XE#1130]) +38 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#2360]) -> [SKIP][428] ([Intel XE#1130]) +2 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - shard-dg2-set2:     [DMESG-WARN][429] ([Intel XE#3876]) -> [SKIP][430] ([Intel XE#1130])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_exec_threads@threads-hang-rebind.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_exec_threads@threads-hang-rebind.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#512]) -> [SKIP][432] ([Intel XE#1130])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-435/igt@xe_mmap@small-bar.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_mmap@small-bar.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][434] ([Intel XE#1130]) +10 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-435/igt@xe_oa@syncs-userptr-wait-cfg.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][436] ([Intel XE#1130])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#1061]) -> [FAIL][438] ([Intel XE#1173])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_peer2peer@write.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][440] ([Intel XE#1130]) +2 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-dg2-set2:     [ABORT][441] ([Intel XE#1358]) -> [SKIP][442] ([Intel XE#1130])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_pm@s2idle-basic-exec.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#579]) -> [SKIP][444] ([Intel XE#1130])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-dg2-set2:     [ABORT][445] -> [SKIP][446] ([Intel XE#1130])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_pm_residency@gt-c6-freeze.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#944]) -> [SKIP][448] ([Intel XE#1130]) +3 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_query@multigpu-query-invalid-extension.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#4130]) -> [SKIP][450] ([Intel XE#1130]) +2 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_vm@bind-array-enobufs:
    - shard-dg2-set2:     [DMESG-FAIL][451] ([Intel XE#3876]) -> [SKIP][452] ([Intel XE#1130])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@xe_vm@bind-array-enobufs.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_vm@bind-array-enobufs.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1 -> xe-pw-142521v5

  IGT_8207: 9f36f9f9e8825a67b762630c2b31628ddcda5c10 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1: a6eede66f589c0287f2c6657fbf39b311d4638a1
  xe-pw-142521v5: 142521v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/index.html

--===============7416527680803665878==
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
<tr><td><b>Series:</b></td><td>PSR DSB support (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142521/">https://patchwork.freedesktop.org/series/142521/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142521v5/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142521v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2547-a6eede66f589c0287f2c6657fbf39b311=
d4638a1_full -&gt; xe-pw-142521v5_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142521v5_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-142521v5_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1425=
21v5_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-linear:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-4/igt@kms_async_flips@async-flip-wi=
th-page-flip-events@pipe-d-dp-2-linear.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-adlp-2/igt@kms_fbc=
on_fbt@fbc-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-142521v5/shard-adlp-4/igt@kms_fbcon_fbt@fbc-suspend=
.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-432/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-dp-2.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142521v5_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getstats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@core_g=
etstats.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-142521v5/shard-dg2-466/igt@core_getstats.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#24=
23</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@core_g=
etversion@all-cards.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@core_getversion@all-car=
ds.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3440">Intel XE#3440</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@core_s=
etmaster@master-drop-set-root.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@core_setmaste=
r@master-drop-set-root.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@core_s=
etmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@core_set=
master@master-drop-set-shared-fd.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@fbdev@=
unaligned-read.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@fbdev@unaligned-read.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/213=
4">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-=
a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_async_flips@async-flip-=
with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#37=
67</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-435/igt@kms_at=
omic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-=
dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>) +144 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_big_fb@4-tiled-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_big_fb@y-tiled-32bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_big_fb@yf-tiled-16bpp-ro=
tate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-=
stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_bw@connected-linear-tili=
ng-1-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_bw@connected-linear-til=
ing-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_bw@connected-linear-tilin=
g-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_bw@linear-tiling-2-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@kms_bw@linear-tiling-3-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_bw@linear-tiling-3-disp=
lays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-=
tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-t=
iled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_ccs@ccs-on-another-bo-y-t=
iled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a=
-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_ccs@crc-primary-rotation=
-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#78=
7</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-=
180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-432/igt@kms_ccs@crc-primary-suspend=
-4-tiled-dg2-mc-ccs@pipe-d-dp-2.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-y=
f-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-b-dp-4.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4=
010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_chamelium_color@ctm-negat=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-re=
solution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-planes-random:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_chamelium_frames@hdmi-cr=
c-planes-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_chamelium_frames@hdmi-crc=
-planes-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_content_protection@atomic=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_content_protection@dp-ms=
t-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_content_protection@dp-mst=
-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_cursor_crc@cursor-offscre=
en-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_cursor_crc@cursor-offscre=
en-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@kms_cursor_crc@cursor-onscree=
n-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_cursor_crc@cursor-rapid-=
movement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding=
-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_cursor_crc@cursor-slidi=
ng-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-2/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/sh=
ard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying=
-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs=
-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_dsc@dsc-with-bpc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244=
">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/776">Intel XE#776</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_feature_discovery@displa=
y-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_flip@2x-absolute-wf_vblan=
k-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-434/igt@kms_fl=
ip@2x-blocking-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-463/igt@kms_flip@2x-blocki=
ng-wf_vblank.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test incomplete</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-8/igt@kms_flip@2x-dpms-vs-vblank-ra=
ce-interruptible@cd-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other=
 test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms-off=
-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-1/igt@kms=
_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-435/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-4=
34/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Int=
el XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-lnl-6/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-7/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-1/igt@kms_flip@flip-=
vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32b=
pp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel X=
E#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel =
XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64=
bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-adlp-2/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp=
-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs=
-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_frontbuffer_tracking@dr=
rs-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_frontbuffer_tracking@drr=
s-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-4=
66/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">In=
tel XE#2136</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
psr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_frontbuffer_tracking@fb=
cpsr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-3/igt@kms_hdmi_inject@inject-4k.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1470">Intel XE#1470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-3/igt@kms_hdr@static-toggle-dpms.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1503">Intel XE#1503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-6/igt@kms_plan=
e_scaling@plane-upscale-20x20-with-modifiers.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-8/ig=
t@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Inte=
l XE#1033</a>) +13 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_plane_scaling@planes-down=
scale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_pm_backlight@fade-with-d=
pms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_pm=
_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_pm_rpm=
@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2893">Intel XE#2893</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-=
plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_psr2_sf@psr2-overlay-pla=
ne-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-blt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@kms_psr@pr-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">=
Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_psr@pr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_rotation_crc@primary-4-ti=
led-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_rotation_crc@primary-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_scaling_modes@scaling-mod=
e-full.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_setmode@basic-clone-singl=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@kms_vrr@cmrr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_writeback@writeback-fb-id=
-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@kms_writeback@writeback-inval=
id-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@xe_copy_basic@mem-copy-line=
ar-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client-th:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@xe_eudebug@basic-client-th.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-3/igt@xe_eudebug_online@single-step=
-one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@xe_eudebug_online@stopped-thr=
ead.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@xe_eudebug_online@stopped-t=
hread.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@xe_evict@evict-beng-large-mul=
ti-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@xe_evict@evict-large-multi-v=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@xe_exe=
c_balancer@once-parallel-rebind.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_exec_bal=
ancer@once-parallel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +245 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-432/igt@xe=
_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@xe_exec_fault_mode@many-bind=
execqueue-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@xe_exec_fault_mode@many-bin=
dexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_exec_fault_mode@once-bin=
dexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@xe_exe=
c_threads@threads-hang-fd-userptr.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-433/igt@xe_exec_t=
hreads@threads-hang-fd-userptr.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_mi=
grate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@xe_live_ktest@xe_dma_buf.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/sha=
rd-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1=
/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d46=
38a1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b31=
1d4638a1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf3=
9b311d4638a1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657=
fbf39b311d4638a1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c=
6657fbf39b311d4638a1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c028=
7f2c6657fbf39b311d4638a1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589=
c0287f2c6657fbf39b311d4638a1/shard-bmg-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66=
f589c0287f2c6657fbf39b311d4638a1/shard-bmg-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6ee=
de66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-=
a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-7/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-=
bmg-4/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-5/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-142521v5/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142521v5/shard-bmg-4/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-142521v5/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142521v5/shard-bmg-8/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5=
/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-142521v5/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142521v5/shard-bmg-4/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-142521v5/shard-bmg-2/igt@xe_module_load@load.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142521v5/shard-bmg-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-7/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-142521v5/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142521v5/shard-bmg-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-3/igt@xe_module_loa=
d@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2457">Intel XE#2457</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-435/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-4=
66/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard=
-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1=
/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d=
4638a1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf3=
9b311d4638a1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6=
657fbf39b311d4638a1/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c02=
87f2c6657fbf39b311d4638a1/shard-dg2-433/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f=
589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6e=
ede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-25=
47-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-436/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-436=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-d=
g2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/s=
hard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b311d46=
38a1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657fbf39b=
311d4638a1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f2c6657=
fbf39b311d4638a1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589c0287f=
2c6657fbf39b311d4638a1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede66f589=
c0287f2c6657fbf39b311d4638a1/shard-dg2-434/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-a6eede=
66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-436/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2547-=
a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/sh=
ard-dg2-435/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-142521v5/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-4=
34/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-436/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42521v5/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-142521v5/shard-dg2-433/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/s=
hard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-433/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-142521v5/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-=
463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-463/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142521v5/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-432/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-142521v5/shard-dg2-432/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/=
shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-432/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142521v5/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2=
-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-434/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-142521v5/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5=
/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@xe_mod=
ule_load@reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_module_load@reload.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@xe_oa@non-system-wide-parano=
id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@xe_oa@stress-open-close.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@xe_pm@d3hot-basic-exec.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@xe_pm@=
s3-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142521v5/shard-dg2-432/igt@xe_pm@s3-basic.html">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE=
#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-436/igt@xe_pm@=
s3-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-ex=
ec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-adlp-4/igt@xe_pm@s=
4-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-142521v5/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">=
Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1607">Intel XE#1607</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@xe_pm@s4-d3cold-basic-exec.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-bmg-2/igt@xe_query@multigpu-query-gt-li=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@xe_query@multigpu-query-gt-=
list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/igt@xe_query@multigpu-query-topo=
logy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-3/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4.html">INCOMPLETE</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/=
shard-bmg-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-=
2-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-adlp-8/igt@kms_asy=
nc_flips@invalid-async-flip@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1425=
21v5/shard-adlp-8/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-3/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard=
-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692">Intel X=
E#2692</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4010">Intel XE#4010</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-142521v5/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs-cc@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-6/igt@kms_colo=
r@ctm-0-50@pipe-c-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-8/ig=
t@kms_color@ctm-0-50@pipe-c-hdmi-a-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard=
-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a>=
 +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-b=
mg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-434/igt@kms_fl=
ip@flip-vs-dpms-off-vs-modeset-interruptible.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1425=
21v5/shard-dg2-436/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.h=
tml">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank@d-dp4.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/sha=
rd-dg2-436/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-adlp-2/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE=
#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-142521v5/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a=
-1-x-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@kms_pl=
ane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-=
dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-=
1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-lnl-7/igt@kms_psr2=
_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1.html">INCOMPL=
ETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2521v5/shard-lnl-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-excee=
d-sf@pipe-b-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-lnl-2/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl=
-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-3/igt@kms_vbla=
nk@ts-continuation-idle-hang@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1425=
21v5/shard-bmg-4/igt@kms_vblank@ts-continuation-idle-hang@pipe-d-hdmi-a-3.h=
tml">PASS</a> +30 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-4/igt@xe_evict=
@evict-large-multi-vm.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard=
-bmg-4/igt@xe_evict@evict-large-multi-vm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel X=
E#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-142521v5/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-basic-defer-bind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-2/igt@xe_live_=
ktest@xe_bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-1/igt@xe_live_ktest@xe_bo=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-adlp-2/igt@xe_pm@s=
2idle-d3hot-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-4/igt@x=
e_pm@s2idle-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_pm@=
s2idle-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2=
-435/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-adlp-3/igt@xe_pm@s=
3-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-8/igt@xe_pm@s3-basi=
c-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-adlp-9/igt@xe_pm@s=
4-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-2/=
igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-lnl-2/igt@xe_pm@s4=
-exec-after.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-3/igt@xe_p=
m@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-lnl-2/igt@xe_pm@s4=
-mocs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@xe_pm@s4-m=
ocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@mixed-misaligned-binds-3145728:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-adlp-3/igt@xe_vm@m=
ixed-misaligned-binds-3145728.html">DMESG-WARN</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-adlp-8/igt@xe_vm@mi=
xed-misaligned-binds-3145728.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_as=
ync_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@km=
s_async_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-435/igt@kms_bi=
g_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@km=
s_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_bi=
g_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@km=
s_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_bi=
g_fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_big_fb@y=
-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-435/igt@kms_bi=
g_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/=
igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5=
/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/=
igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg=
2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_bw=
@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/=
shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@kms_bw=
@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-46=
6/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@kms_cc=
s@bad-rotation-90-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521=
v5/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"=
>Intel XE#2136</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_cc=
s@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14252=
1v5/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-436/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/=
shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"=
>Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2692">Intel XE#2692</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel=
 XE#4010</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-142521v5/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-c=
c.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466=
/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@kms_ch=
amelium_color@ctm-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_cham=
elium_color@ctm-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@kms_ch=
amelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-=
466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_ch=
amelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-463/igt@kms_chame=
lium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +31 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-1/igt@kms_cont=
ent_protection@atomic-dpms@pipe-a-dp-2.html">INCOMPLETE</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-3/ig=
t@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a=
>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@kms_co=
ntent_protection@atomic-dpms@pipe-a-dp-4.html">INCOMPLETE</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-433/=
igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Intel XE=
#4132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@kms_co=
ntent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_co=
ntent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_c=
ontent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-435/igt@kms_cu=
rsor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/=
igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915=
#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/323">Intel XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"=
>i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_ds=
c@dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_dsc@=
dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_ds=
c@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/=
igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-6/igt@kms_flip=
@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg=
-8/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel =
XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-lnl-7/igt@kms_flip=
@bo-too-big-interruptible@a-edp1.html">INCOMPLETE</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-lnl-4/igt@kms_fl=
ip@bo-too-big-interruptible@a-edp1.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) +1 ot=
her test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel=
 XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2231">Intel XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-142521v5/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp=
-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +29 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231"=
>Intel XE#2231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142521v5/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primsc=
rn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/=
igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2521v5/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#6=
51</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2521v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb=
-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +18 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466=
/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Inte=
l XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1425=
21v5/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42521v5/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +9 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt=
@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +34 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_ge=
tfb@getfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_getfb@=
getfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-bmg-6/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-bmg-8/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_jo=
iner@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_j=
oiner@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_mu=
ltipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg=
2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE=
#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-435/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-fa=
ctor-0-25-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_pm=
_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/=
igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@kms_pm=
_backlight@fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_pm_backligh=
t@fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_pm=
_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_p=
m_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-435/igt@kms_pm=
_dc@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_pm_dc@deep-pk=
gc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_ps=
r2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel=
 XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-142521v5/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-conti=
nuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@kms_ps=
r@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard=
-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@kms_ps=
r@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_ps=
r@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +6 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg=
2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-d=
g2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE=
#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_ti=
led_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/=
igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@kms_vr=
r@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_vrr@flip-dpms.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2575">i915#2575</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@kms_wr=
iteback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@kms_wri=
teback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_cop=
y_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt=
@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@xe_eud=
ebug@basic-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_eudebug@b=
asic-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1130">Intel XE#1130</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-=
dg2-466/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel =
XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_exe=
c_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#=
288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42521v5/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-re=
bind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1130">Intel XE#1130</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@xe_exe=
c_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/=
shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_exe=
c_threads@threads-hang-rebind.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-4=
66/igt@xe_exec_threads@threads-hang-rebind.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-435/igt@xe_mma=
p@small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/512">Intel XE#512</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_mmap@small-bar.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-435/igt@xe_oa@=
syncs-userptr-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-=
466/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +10 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-463/igt@xe_pat=
@pat-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@=
xe_pat@pat-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_pee=
r2peer@write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-435/igt@xe_peer2peer@wri=
te.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@xe_pm@=
d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@=
xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_pm@=
s2idle-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_pm@s2id=
le-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-466/igt@xe_pm@=
vram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_pm@vra=
m-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_pm_=
residency@gt-c6-freeze.html">ABORT</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_pm_residency@gt-=
c6-freeze.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_que=
ry@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466=
/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-432/igt@xe_sri=
ov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE=
#4130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-142521v5/shard-dg2-466/igt@xe_sriov_auto_provisioning@resources-released-o=
n-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-enobufs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1/shard-dg2-433/igt@xe_vm@=
bind-array-enobufs.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142521v5/shard-dg2-466/igt@xe_v=
m@bind-array-enobufs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1 -&gt; xe-pw-142=
521v5</li>
</ul>
<p>IGT_8207: 9f36f9f9e8825a67b762630c2b31628ddcda5c10 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2547-a6eede66f589c0287f2c6657fbf39b311d4638a1: a6eede66f589c0287f2c665=
7fbf39b311d4638a1<br />
  xe-pw-142521v5: 142521v5</p>

</body>
</html>

--===============7416527680803665878==--
