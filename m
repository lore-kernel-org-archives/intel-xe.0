Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5756C2D0CD
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 16:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9869410E03F;
	Mon, 19 May 2025 16:07:39 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2A510E373;
 Mon, 19 May 2025 16:07:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2931614394927805668=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Introduce_drm_sharpness_pr?=
 =?utf-8?q?operty_=28rev15=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 May 2025 16:07:37 -0000
Message-ID: <174767085776.12.6656297397992196937@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250519122644.3685679-1-nemesa.garg@intel.com>
In-Reply-To: <20250519122644.3685679-1-nemesa.garg@intel.com>
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

--===============2931614394927805668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce drm sharpness property (rev15)
URL   : https://patchwork.freedesktop.org/series/139954/
State : failure

== Summary ==

CI Bug Log - changes from xe-3108-36da6a9300fc8686d01b5450723200dafd89526f_FULL -> xe-pw-139954v15_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139954v15_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139954v15_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139954v15_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  
Known issues
------------

  Here are the changes found in xe-pw-139954v15_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [PASS][2] -> [DMESG-WARN][3] ([Intel XE#4543]) +6 other tests dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#3767]) +7 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#873])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2370])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#4208]) +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2327]) +5 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#316]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#316]) +4 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1407]) +6 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +4 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#610])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#2351] / [Intel XE#4208])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2328])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#619])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1467]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +18 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1124]) +7 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2314] / [Intel XE#2894]) +4 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#2314] / [Intel XE#2894])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#2191])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-4/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2191])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#2191]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#367]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#367])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#367])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#787]) +209 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2887]) +28 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-9/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#455] / [Intel XE#787]) +41 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2887]) +6 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#787]) +11 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2652] / [Intel XE#787]) +17 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#3432]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#3432])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2724]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#306])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2325]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2252]) +19 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#373]) +7 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#373]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#373]) +9 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2341]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2390]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#307]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][48] ([Intel XE#1178])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][49] ([Intel XE#1178]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#308]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2320]) +8 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2321]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#308])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-2/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#2321])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1424]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2286]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][57] -> [DMESG-WARN][58] ([Intel XE#3428])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2291])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [PASS][60] -> [SKIP][61] ([Intel XE#2291]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#309]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          NOTRUN -> [FAIL][63] ([Intel XE#4633])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#1508])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#4210])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#1340]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#4494])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#4354])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#4354])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-6/igt@kms_dp_link_training@uhbr-mst.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#4356])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2244])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#2244])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#776])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#1137])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1135])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-1/igt@kms_feature_discovery@psr1.html
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2374])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_feature_discovery@psr1.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1135])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-433/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#310]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-8/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2316]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][80] ([Intel XE#301]) +3 other tests fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          [PASS][81] -> [SKIP][82] ([Intel XE#2316])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1421]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-6/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][84] -> [SKIP][85] ([Intel XE#4208] / [i915#2575]) +18 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-433/igt@kms_flip@busy-flip.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [PASS][86] -> [FAIL][87] ([Intel XE#3321])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][88] -> [FAIL][89] ([Intel XE#301]) +2 other tests fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][90] ([Intel XE#3321])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-adlp:         [PASS][91] -> [DMESG-WARN][92] ([Intel XE#4173])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-adlp-8/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-8/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-lnl:          [PASS][93] -> [FAIL][94] ([Intel XE#3149] / [Intel XE#886])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1:
    - shard-lnl:          [PASS][95] -> [FAIL][96] ([Intel XE#886]) +2 other tests fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#1401] / [Intel XE#1745])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1401])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#455]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2293] / [Intel XE#2380]) +7 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2380]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [PASS][102] -> [DMESG-FAIL][103] ([Intel XE#4543]) +6 other tests dmesg-fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#455]) +6 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2293]) +7 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2311]) +49 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#651]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2312]) +17 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#4141]) +16 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][110] ([Intel XE#4543])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][111] -> [SKIP][112] ([Intel XE#2351] / [Intel XE#4208])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#651]) +10 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#651]) +25 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#656]) +8 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2350])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#653]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#653]) +21 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2313]) +51 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#656]) +23 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][121] ([Intel XE#3428]) +1 other test dmesg-warn
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][122] -> [SKIP][123] ([Intel XE#1503])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#1503])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#346]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#4298])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2927])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][128] -> [SKIP][129] ([Intel XE#3012])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#2925])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2486])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][132] ([Intel XE#616]) +2 other tests fail
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2393])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#5021])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][135] ([Intel XE#4658]) +3 other tests fail
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-1/igt@kms_plane_multiple@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#5020])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     NOTRUN -> [ABORT][137] ([Intel XE#4760]) +1 other test abort
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][138] ([Intel XE#4212])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2763]) +24 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#2763]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#870]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][142] -> [FAIL][143] ([Intel XE#718])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#2007])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-1/igt@kms_pm_dc@deep-pkgc.html
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2505])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_pm_dc@deep-pkgc.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#908])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
    - shard-lnl:          NOTRUN -> [FAIL][147] ([Intel XE#2029])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#2893] / [Intel XE#4608]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#1489])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#4608]) +6 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#1489]) +4 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#2893]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#1489]) +17 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#1128])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-adlp:         NOTRUN -> [SKIP][156] ([Intel XE#1122])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#1122])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#2387]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-primary-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#4609]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-4/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-6/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#1406]) +4 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-4/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#2850] / [Intel XE#929]) +14 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#2234])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#2234] / [Intel XE#2850]) +26 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#2414]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#2939])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#3414])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@kms_rotation_crc@bad-tiling.html
    - shard-adlp:         NOTRUN -> [SKIP][168] ([Intel XE#3414])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-4/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
    - shard-adlp:         NOTRUN -> [SKIP][170] ([Intel XE#1127])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [FAIL][171] ([Intel XE#4689])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-8/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#2330])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][174] -> [FAIL][175] ([Intel XE#2883]) +2 other tests fail
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#1435])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-5/igt@kms_setmode@invalid-clone-single-crtc.html
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#1435])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][178] -> [SKIP][179] ([Intel XE#1435])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#2426])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#2450])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#2168])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#1499]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-7/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@lobf:
    - shard-adlp:         NOTRUN -> [SKIP][184] ([Intel XE#2168])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-4/igt@kms_vrr@lobf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][185] ([Intel XE#2168])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#1499]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-5/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          NOTRUN -> [SKIP][188] ([Intel XE#756])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#1091] / [Intel XE#2849])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-lnl:          NOTRUN -> [SKIP][190] ([Intel XE#1091] / [Intel XE#2849])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_ccs@suspend-resume:
    - shard-adlp:         NOTRUN -> [SKIP][191] ([Intel XE#455] / [Intel XE#488])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-4/igt@xe_ccs@suspend-resume.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][192] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#1126])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eu_stall@invalid-sampling-rate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][194] ([Intel XE#4497])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_eu_stall@invalid-sampling-rate.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][195] ([Intel XE#4837]) +10 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@xe_eudebug_online@preempt-breakpoint.html
    - shard-lnl:          NOTRUN -> [SKIP][196] ([Intel XE#4837]) +5 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-8/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_eudebug_online@set-breakpoint:
    - shard-adlp:         NOTRUN -> [SKIP][197] ([Intel XE#4837]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-3/igt@xe_eudebug_online@set-breakpoint.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          NOTRUN -> [SKIP][198] ([Intel XE#4837]) +27 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-adlp:         NOTRUN -> [SKIP][199] ([Intel XE#688])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-simple.html
    - shard-lnl:          NOTRUN -> [SKIP][200] ([Intel XE#688]) +2 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_balancer@once-parallel-userptr:
    - shard-dg2-set2:     [PASS][201] -> [SKIP][202] ([Intel XE#4208]) +30 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-432/igt@xe_exec_balancer@once-parallel-userptr.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_exec_balancer@once-parallel-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][203] ([Intel XE#2322]) +14 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][204] ([Intel XE#1392]) +6 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
    - shard-adlp:         NOTRUN -> [SKIP][205] ([Intel XE#1392])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-3/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [PASS][206] -> [SKIP][207] ([Intel XE#1392]) +10 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][208] ([Intel XE#288]) +19 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][209] ([Intel XE#288]) +3 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-3/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][210] ([Intel XE#4943]) +41 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-large-malloc-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][211] ([Intel XE#4915]) +151 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html

  * igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][212] ([Intel XE#4943]) +14 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-4/igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@processes-evict-malloc:
    - shard-adlp:         NOTRUN -> [SKIP][213] ([Intel XE#4915]) +31 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-6/igt@xe_exec_system_allocator@processes-evict-malloc.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     NOTRUN -> [SKIP][214] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][215] ([Intel XE#2229])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][216] ([Intel XE#2457])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@xe_module_load@force-load.html

  * igt@xe_oa@buffer-fill@rcs-0:
    - shard-lnl:          NOTRUN -> [FAIL][217] ([Intel XE#4565]) +1 other test fail
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-7/igt@xe_oa@buffer-fill@rcs-0.html

  * igt@xe_oa@non-system-wide-paranoid:
    - shard-adlp:         NOTRUN -> [SKIP][218] ([Intel XE#2541] / [Intel XE#3573])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-8/igt@xe_oa@non-system-wide-paranoid.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][219] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][220] ([Intel XE#977])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][221] ([Intel XE#977])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-7/igt@xe_pat@pat-index-xelp.html
    - shard-bmg:          NOTRUN -> [SKIP][222] ([Intel XE#2245])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@xe_pat@pat-index-xelp.html

  * igt@xe_peer2peer@read:
    - shard-adlp:         NOTRUN -> [SKIP][223] ([Intel XE#1061])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-8/igt@xe_peer2peer@read.html
    - shard-bmg:          NOTRUN -> [SKIP][224] ([Intel XE#2427])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@xe_peer2peer@read.html
    - shard-lnl:          NOTRUN -> [SKIP][225] ([Intel XE#1061])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][226] ([Intel XE#1173]) +1 other test fail
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-433/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][227] ([Intel XE#2284]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@xe_pm@s3-d3cold-basic-exec.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][228] ([Intel XE#2284] / [Intel XE#366])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-433/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [PASS][229] -> [ABORT][230] ([Intel XE#1794])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][231] -> [ABORT][232] ([Intel XE#1794])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-3/igt@xe_pm@s4-multiple-execs.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-lnl:          NOTRUN -> [SKIP][233] ([Intel XE#579])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-lnl:          NOTRUN -> [SKIP][234] ([Intel XE#584]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          NOTRUN -> [SKIP][235] ([Intel XE#4650])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][236] ([Intel XE#4733])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-433/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][237] ([Intel XE#4733]) +3 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][238] ([Intel XE#944]) +6 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     NOTRUN -> [SKIP][239] ([Intel XE#944]) +2 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@xe_query@multigpu-query-topology.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-lnl:          NOTRUN -> [SKIP][240] ([Intel XE#944]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
    - shard-adlp:         NOTRUN -> [SKIP][241] ([Intel XE#944])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-2/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][242] ([Intel XE#4814])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-433/igt@xe_render_copy@render-stress-4-copies.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-bmg:          NOTRUN -> [SKIP][243] ([Intel XE#4130]) +2 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][244] ([Intel XE#4130]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          NOTRUN -> [SKIP][245] ([Intel XE#3342])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-bmg:          NOTRUN -> [SKIP][246] ([Intel XE#4351])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Possible fixes ####

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][247] ([Intel XE#3884]) -> [PASS][248] +1 other test pass
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-adlp-1/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-1/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-adlp:         [DMESG-WARN][249] ([Intel XE#4173]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][251] ([Intel XE#4543]) -> [PASS][252] +13 other tests pass
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][253] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][254]
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_color@gamma@pipe-a-dp-2:
    - shard-bmg:          [SKIP][255] ([Intel XE#4889] / [Intel XE#5042]) -> [PASS][256]
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-6/igt@kms_color@gamma@pipe-a-dp-2.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_color@gamma@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-64x64:
    - shard-bmg:          [DMESG-FAIL][257] ([Intel XE#3428]) -> [PASS][258] +2 other tests pass
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-6/igt@kms_cursor_crc@cursor-random-64x64.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_cursor_crc@cursor-random-64x64.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][259] ([Intel XE#2291]) -> [PASS][260] +4 other tests pass
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][261] ([Intel XE#4294]) -> [PASS][262]
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [FAIL][263] ([Intel XE#5066]) -> [PASS][264]
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-adlp-4/igt@kms_fbcon_fbt@fbc-suspend.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][265] ([Intel XE#2049]) -> [PASS][266] +1 other test pass
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][267] ([Intel XE#2316]) -> [PASS][268] +3 other tests pass
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:
    - shard-dg2-set2:     [FAIL][269] ([Intel XE#301]) -> [PASS][270] +4 other tests pass
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp2:
    - shard-dg2-set2:     [FAIL][271] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][272]
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][273] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][274]
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [FAIL][275] ([Intel XE#886]) -> [PASS][276] +1 other test pass
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [SKIP][277] ([Intel XE#1503]) -> [PASS][278]
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [SKIP][279] ([Intel XE#4596]) -> [PASS][280]
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][281] ([Intel XE#718]) -> [PASS][282]
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          [SKIP][283] ([Intel XE#4692]) -> [PASS][284]
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [FAIL][285] ([Intel XE#4227]) -> [PASS][286] +1 other test pass
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-7/igt@kms_vrr@flipline.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@kms_vrr@flipline.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [INCOMPLETE][287] ([Intel XE#4842]) -> [PASS][288]
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#1392]) -> [PASS][290] +7 other tests pass
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_system_allocator@many-large-execqueues-new-race:
    - shard-bmg:          [DMESG-WARN][291] ([Intel XE#3428]) -> [PASS][292] +8 other tests pass
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-6/igt@xe_exec_system_allocator@many-large-execqueues-new-race.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@xe_exec_system_allocator@many-large-execqueues-new-race.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [SKIP][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318]) ([Intel XE#378]) -> ([PASS][319], [PASS][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335], [PASS][336], [PASS][337], [PASS][338], [PASS][339], [PASS][340], [PASS][341], [PASS][342], [PASS][343])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-8/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-2/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-2/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-3/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-3/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-5/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-3/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-4/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-4/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-4/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-8/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-8/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-6/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-2/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-1/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-1/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-5/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-5/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-5/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-7/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-1/igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-6/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-6/igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-6/igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-7/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-7/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-6/igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-1/igt@xe_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-6/igt@xe_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@xe_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-7/igt@xe_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@xe_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-8/igt@xe_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-8/igt@xe_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@xe_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-5/igt@xe_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-8/igt@xe_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@xe_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-8/igt@xe_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@xe_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@xe_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-7/igt@xe_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-7/igt@xe_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-6/igt@xe_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-1/igt@xe_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-1/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-5/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-5/igt@xe_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-4/igt@xe_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-4/igt@xe_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-4/igt@xe_module_load@load.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-bmg:          [TIMEOUT][344] -> [PASS][345]
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-6/igt@xe_pm@d3hot-multiple-execs.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][346] ([Intel XE#1794]) -> [PASS][347] +1 other test pass
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#316]) -> [SKIP][349] ([Intel XE#2351] / [Intel XE#4208])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         [DMESG-FAIL][350] ([Intel XE#4543]) -> [DMESG-WARN][351] ([Intel XE#4173])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#2191]) -> [SKIP][353] ([Intel XE#4208] / [i915#2575])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][355] ([Intel XE#2351] / [Intel XE#4208])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#373]) -> [SKIP][357] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][358] ([Intel XE#2341]) -> [FAIL][359] ([Intel XE#1178])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][360] ([Intel XE#1188]) -> [SKIP][361] ([Intel XE#2341])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-3/igt@kms_content_protection@uevent.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#455]) -> [SKIP][363] ([Intel XE#4208] / [i915#2575])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-max-size.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          [SKIP][364] ([Intel XE#2320] / [Intel XE#5042]) -> [SKIP][365] ([Intel XE#2320])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#455]) -> [SKIP][367] ([Intel XE#4208]) +2 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-433/igt@kms_dsc@dsc-with-bpc.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][368] ([Intel XE#3321]) -> [SKIP][369] ([Intel XE#2316]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [DMESG-WARN][370] ([Intel XE#3428]) -> [SKIP][371] ([Intel XE#2316])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#455]) -> [SKIP][373] ([Intel XE#2351] / [Intel XE#4208])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#651]) -> [SKIP][375] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][376] ([Intel XE#4141] / [Intel XE#5042]) -> [SKIP][377] ([Intel XE#4141])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][378] ([Intel XE#4141]) -> [SKIP][379] ([Intel XE#2312]) +3 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][380] ([Intel XE#2312]) -> [SKIP][381] ([Intel XE#4141]) +5 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#651]) -> [SKIP][383] ([Intel XE#4208]) +1 other test skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][384] ([Intel XE#2312]) -> [SKIP][385] ([Intel XE#2311]) +10 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][386] ([Intel XE#2311]) -> [SKIP][387] ([Intel XE#2312]) +8 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][388] ([Intel XE#2312] / [Intel XE#5042]) -> [SKIP][389] ([Intel XE#2313])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][390] ([Intel XE#2312]) -> [SKIP][391] ([Intel XE#2313]) +13 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#653]) -> [SKIP][393] ([Intel XE#4208]) +4 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][394] ([Intel XE#2313]) -> [SKIP][395] ([Intel XE#2312]) +9 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][397] ([Intel XE#4208] / [i915#2575])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#1489]) -> [SKIP][399] ([Intel XE#4208])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][400] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][401] ([Intel XE#4208])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-464/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#3414]) -> [SKIP][403] ([Intel XE#4208] / [i915#2575])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#4837]) -> [SKIP][405] ([Intel XE#4208]) +2 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-extended-discovery.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-imm:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#288]) -> [SKIP][407] ([Intel XE#4208]) +3 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-userptr-imm.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-userptr-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#2360]) -> [SKIP][409] ([Intel XE#4208])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-mlock:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#4915]) -> [SKIP][411] ([Intel XE#4208]) +27 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-432/igt@xe_exec_system_allocator@threads-many-large-mmap-mlock.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_exec_system_allocator@threads-many-large-mmap-mlock.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][412] ([Intel XE#255]) -> [SKIP][413] ([Intel XE#4208])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-464/igt@xe_huc_copy@huc_copy.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_huc_copy@huc_copy.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][415] ([Intel XE#4208])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-435/igt@xe_oa@non-privileged-map-oa-buffer.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][416] ([Intel XE#4819]) -> [SKIP][417] ([Intel XE#4208])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-432/igt@xe_pmu@gt-frequency.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_pmu@gt-frequency.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-dg2-set2:     [SKIP][418] ([Intel XE#944]) -> [SKIP][419] ([Intel XE#4208])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-433/igt@xe_query@multigpu-query-invalid-query.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_query@multigpu-query-invalid-query.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
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
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
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
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4565
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4658
  [Intel XE#4689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4889
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042
  [Intel XE#5066]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5066
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8366 -> IGT_8367
  * Linux: xe-3108-36da6a9300fc8686d01b5450723200dafd89526f -> xe-pw-139954v15

  IGT_8366: 8366
  IGT_8367: 8367
  xe-3108-36da6a9300fc8686d01b5450723200dafd89526f: 36da6a9300fc8686d01b5450723200dafd89526f
  xe-pw-139954v15: 139954v15

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/index.html

--===============2931614394927805668==
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
<tr><td><b>Series:</b></td><td>Introduce drm sharpness property (rev15)</td=
></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/139954/">https://patchwork.freedesktop.org/series/139954/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-139954v15/index.html">https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-139954v15/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3108-36da6a9300fc8686d01b5450723200daf=
d89526f_FULL -&gt; xe-pw-139954v15_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139954v15_FULL absolutely need=
 to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-139954v15_FULL, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1399=
54v15_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@xe_fault_injection@vm-bind-f=
ail-vm_bind_ioctl_ops_create.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139954v15_FULL that come from known =
issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a=
-1-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-adlp-8/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v15/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events-til=
ed@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +6 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a=
-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@kms_async_flips@async-flip=
-with-page-flip-events-tiled@pipe-d-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#37=
67</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_async_flips@invalid-asyn=
c-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-8/igt@kms_atomic_transition@plane-=
all-modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_big_fb@linear-16bpp-ro=
tate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-4/igt@kms_big_fb@x-tiled-8bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1407">Intel XE#1407</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@kms_big_fb@y-tiled-16bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-=
rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2328">Intel XE#2328</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/619">Intel XE#619</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1467">Intel XE#1467</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +18 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw=
-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_bw@connected-linear-tili=
ng-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-1/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/i=
gt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#=
2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-4/igt@kms_bw@connected-linear-til=
ing-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@kms_bw@connected-linear-tili=
ng-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_bw@connected-linear-ti=
ling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_bw@linear-tiling-1-displ=
ays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@kms_bw@linear-tiling-1-dis=
plays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@kms_bw@linear-tiling-3-displ=
ays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-t=
iled-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +209 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-t=
iled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-9/igt@kms_ccs@ccs-on-another-bo-4=
-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_ccs@crc-primary-basic-=
yf-tiled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-8/igt@kms_ccs@crc-primary-rotation=
-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a=
-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-1/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-=
4-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-=
4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-=
y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_cdclk@mode-transition-al=
l-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2724">Intel XE#2724</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@kms_chamelium_color@ctm-nega=
tive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-7/igt@kms_chamelium_color@ctm-red-=
to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2325">Intel XE#2325</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-c=
hange-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +19 other tests skip</l=
i>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@kms_chamelium_edid@dp-edid-c=
hange-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-3/igt@kms_chamelium_edid@dp-edid-=
resolution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_content_protection@conte=
nt-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2341">Intel XE#2341</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@kms_content_protection@dp-ms=
t-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2390">Intel XE#2390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_content_protection@dp-=
mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-7/igt@kms_content_protection@lic-t=
ype-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-433/igt@kms_content_protection@srm=
@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@kms_cursor_crc@cursor-onsc=
reen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_cursor_crc@cursor-random=
-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_cursor_crc@cursor-random=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-2/igt@kms_cursor_crc@cursor-rando=
m-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-5/igt@kms_cursor_crc@cursor-random=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@kms_cursor_crc@cursor-slidin=
g-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_cursor_legacy@basic-busy=
-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-2/igt@kms_curs=
or_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/sha=
rd-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-si=
ze.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs=
-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-8/igt@kms_curs=
or_legacy@cursora-vs-flipb-varying-size.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_=
cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs=
-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cu=
rsor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_dirtyfb@drrs-dirtyfb-ioc=
tl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioct=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4210">Intel XE#4210</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-=
6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1340">Intel XE#1340</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-pane=
l-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4494">Intel XE#4494</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_dp_link_training@non-uhb=
r-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-6/igt@kms_dp_link_training@uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4354">Intel XE#4354</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_dp_link_training@uhbr-=
mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-7/igt@kms_dsc@dsc-fractional-bpp-w=
ith-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@kms_feature_discovery@dp-m=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-1/igt@kms_feature_discovery@psr1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1135">Intel XE#1135</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_feature_discovery@psr1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2374">Intel XE#2374</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-433/igt@kms_feature_discovery@psr1=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-8/igt@kms_flip@2x-dpms-vs-vblank-=
race-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-=
nop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@kms_flip@2x-flip-vs-expire=
d-vblank@ad-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_flip@2x-f=
lip-vs-rmfb-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-6/igt@kms_flip@2x-flip-vs-suspend.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1421">Intel XE#1421</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-433/igt@kms_fl=
ip@busy-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_flip@busy-flip.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2575">i915#2575</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-4/igt@kms_flip=
@flip-vs-expired-vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-7/igt@kms_flip@flip-vs-exp=
ired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-464/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-=
464/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">In=
tel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-7/igt@kms_flip@flip-vs-expired-vbl=
ank@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend@a-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-8/igt@kms_flip@flip-v=
s-suspend@a-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-4/igt@kms_flip=
@wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@kms_flip@w=
f_vblank-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-4/igt@kms_flip=
@wf_vblank-ts-check-interruptible@c-edp1.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@kms=
_flip@wf_vblank-ts-check-interruptible@c-edp1.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2=
 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32b=
pp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel=
 XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32b=
pp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401"=
>Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32=
bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">I=
ntel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32b=
pp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel X=
E#2380</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64b=
pp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-adlp-6/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/sha=
rd-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscali=
ng.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4543">Intel XE#4543</a>) +6 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@kms_flip_scaled_crc@flip-6=
4bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Int=
el XE#2293</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_frontbuffer_tracking@drr=
s-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +49 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-1/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +17 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc=
-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +16 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-6/igt@kms_frontbuffer_tracking@fb=
c-1p-primscrn-pri-shrfb-draw-mmap-wc.html">DMESG-FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-=
464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">I=
ntel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@kms_frontbuffer_tracking@f=
bcdrrs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/651">Intel XE#651</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-1/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_frontbuffer_tracking@pla=
ne-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-1/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_frontbuffer_tracking@p=
sr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +21 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_frontbuffer_tracking@psr=
-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +51 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@kms_frontbuffer_tracking@psr=
-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +23 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_hdr@bpc-switch-suspend@p=
ipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) +1 other test dmesg-warn<=
/li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-7/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">In=
tel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@kms_hdr@static-swap.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503=
">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@kms_joiner@basic-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/346">Intel XE#346</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_joiner@basic-max-non-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_joiner@basic-ultra-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-8/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_joiner@switch-modeset-=
ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_panel_fitting@legacy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_plane_cursor@primary@p=
ipe-a-hdmi-a-2-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_plane_multiple@2x-tiling=
-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-1/igt@kms_plane_multiple@tiling-x@=
pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4658">Intel XE#4658</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_plane_multiple@tiling-yf=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_plane_scaling@intel-ma=
x-src-size.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4760">Intel XE#4760</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_plane_scaling@intel-ma=
x-src-size@pipe-a-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_plane_scaling@planes-uni=
ty-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +24 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-1/igt@kms_plane_scaling@planes-ups=
cale-factor-0-25-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_pm_backlight@fade-with-d=
pms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/870">Intel XE#870</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-2/igt@kms_pm_d=
c@dc5-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel=
 XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-1/igt@kms_pm_dc@deep-pkgc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/200=
7">Intel XE#2007</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_pm_dc@deep-pkgc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505=
">Intel XE#2505</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/90=
8">Intel XE#908</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029=
">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stre=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-=
plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-9/igt@kms_psr2_sf@fbc-psr2-overla=
y-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay=
-primary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-prima=
ry-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@kms_psr2_sf@pr-plane-move-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-pla=
ne-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +17 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-1/igt@kms_psr2_su@frontbuffer-xrgb=
8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1128">Intel XE#1128</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-6/igt@kms_psr2_su@frontbuffer-xrg=
b8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1122">Intel XE#1122</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_psr2_su@frontbuffer-xr=
gb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2387">Intel XE#2387</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-4/igt@kms_psr@fbc-psr2-primary-blt=
@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4609">Intel XE#4609</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-6/igt@kms_psr@pr-cursor-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-4/igt@kms_psr@pr-no-drrs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
>Intel XE#1406</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_psr@psr-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"=
>Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/929">Intel XE#929</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@kms_psr@psr2-primary-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@kms_psr@psr2-sprite-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2850">Intel XE#2850</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-7/igt@kms_psr_stress_test@flip-pri=
mary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-433/igt@kms_psr_stress_test@invali=
date-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@kms_rotation_crc@bad-tilin=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3414">Intel XE#3414</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-4/igt@kms_rotation_crc@bad-tiling=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-5/igt@kms_rotation_crc@primary-4-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +2 other tests =
skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-6/igt@kms_rotation_crc@primary-4-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-8/igt@kms_rotation_crc@primary-x-t=
iled-reflect-x-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4689">Intel XE#4689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@kms_rotation_crc@primary-y-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_rotation_crc@sprite-rota=
tion-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-1/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-8/igt@kms_setmode@basic@pip=
e-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-5/igt@kms_setmode@invalid-clone-si=
ngle-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1435">Intel XE#1435</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_setmode@invalid-clone-si=
ngle-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-7/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-6/igt@kms_s=
etmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_tiled_display@basic-test=
-pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-7/igt@kms_tv_load_detect@load-dete=
ct.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_vrr@cmrr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel=
 XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-7/igt@kms_vrr@flip-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499"=
>Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-4/igt@kms_vrr@lobf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Inte=
l XE#2168</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_vrr@lobf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Int=
el XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-5/igt@kms_vrr@negative-basic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_writeback@writeback-fb=
-id-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_writeback@writeback-inva=
lid-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@sriov_basic@enable-vfs-autop=
robe-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@sriov_basic@enable-vfs-autop=
robe-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-4/igt@xe_ccs@suspend-resume.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
55">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@xe_compute_preempt@compute=
-preempt-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_copy_basic@mem-set-line=
ar-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-sampling-rate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_eu_stall@invalid-sampli=
ng-rate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@xe_eudebug_online@preempt-=
breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4837">Intel XE#4837</a>) +10 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-8/igt@xe_eudebug_online@preempt-br=
eakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-3/igt@xe_eudebug_online@set-break=
point.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@xe_eudebug_online@single-ste=
p-one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-4/igt@xe_evict_ccs@evict-overcomm=
it-simple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/688">Intel XE#688</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@xe_evict_ccs@evict-overcommi=
t-simple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-432/igt@xe_exe=
c_balancer@once-parallel-userptr.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_exec_b=
alancer@once-parallel-userptr.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +30 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-8/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +14 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-4/igt@xe_exec_basic@multigpu-no-ex=
ec-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +6 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-3/igt@xe_exec_basic@multigpu-no-e=
xec-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@x=
e_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) =
+10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@xe_exec_fault_mode@many-ex=
ecqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +19 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-3/igt@xe_exec_fault_mode@twice-bi=
ndexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@xe_exec_system_allocator@man=
y-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +41 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@xe_exec_system_allocator@m=
any-large-malloc-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +151 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-4/igt@xe_exec_system_allocator@pro=
cess-many-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +14 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-6/igt@xe_exec_system_allocator@pr=
ocesses-evict-malloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_live_ktest@xe_bo.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
29">Intel XE#2229</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_live_ktest@xe_bo@xe_ccs=
_migrate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@xe_module_load@force-load.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill@rcs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-7/igt@xe_oa@buffer-fill@rcs-0.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4565">Intel XE#4565</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-8/igt@xe_oa@non-system-wide-paran=
oid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@xe_oa@privileged-forked-ac=
cess-vaddr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_pat@pat-index-xe2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
77">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-7/igt@xe_pat@pat-index-xelp.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/97=
7">Intel XE#977</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@xe_pat@pat-index-xelp.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
45">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-8/igt@xe_peer2peer@read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061"=
>Intel XE#1061</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@xe_peer2peer@read.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">=
Intel XE#2427</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@xe_peer2peer@read.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">=
Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-433/igt@xe_peer2peer@read@read-gpu=
a-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</l=
i>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@xe_pm@s3-d3cold-basic-exec.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-433/igt@xe_pm@s3-d3cold-basic-exec=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-adlp-6/igt@xe_pm@s=
4-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139954v15/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exe=
c.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-3/igt@xe_pm@s4=
-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@xe_pm@vram-d3cold-threshold.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@xe_pm_residency@cpg-basic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/584">Intel XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@xe_pmu@fn-engine-activity-lo=
ad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-433/igt@xe_pxp@display-black-pxp-f=
b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-pos=
t-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@xe_query@multigpu-query-inva=
lid-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-435/igt@xe_query@multigpu-query-to=
pology.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@xe_query@multigpu-query-topo=
logy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-adlp-2/igt@xe_query@multigpu-query-top=
ology-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-433/igt@xe_render_copy@render-stre=
ss-4-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/igt@xe_sriov_auto_provisioning@s=
elfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +2 other t=
ests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_sriov_auto_provisioning=
@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolat=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@xe_sriov_scheduling@equal-th=
roughput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-adlp-1/igt@kms_asy=
nc_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp=
-1/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">PASS</a> +1 other t=
est pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-adlp-9/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15=
/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-adlp-9/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel=
 XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-139954v15/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotat=
e-180-async-flip.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-432/igt@kms_ccs@random-ccs=
-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-6/igt@kms_colo=
r@gamma@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4889">Intel XE#4889</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/=
igt@kms_color@gamma@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x64:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-6/igt@kms_curs=
or_crc@cursor-random-64x64.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-1/i=
gt@kms_cursor_crc@cursor-random-64x64.html">PASS</a> +2 other tests pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-4/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-2=
/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> +4 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-4/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-2/igt@=
kms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-adlp-4/igt@kms_fbc=
on_fbt@fbc-suspend.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5066">Intel XE#5066</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-1/igt@kms_fbcon_=
fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-2/igt@kms_flip=
@2x-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel X=
E#2049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-139954v15/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible@ab=
-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-8/i=
gt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">PASS</a> +3 other tests pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-432/igt@kms_fl=
ip@flip-vs-expired-vblank@c-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-43=
2/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html">PASS</a> +4 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-432/igt@kms_fl=
ip@flip-vs-expired-vblank@d-dp2.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/sh=
ard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v1=
5/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-8/igt@kms_flip=
@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/i=
gt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-4/igt@kms_hdr@=
static-toggle-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_hdr@sta=
tic-toggle-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-3/igt@kms_pla=
ne_multiple@2x-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-5/igt@kms_pm_d=
c@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-7/igt@kms_psr_=
stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4692">Intel XE#4692</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/sh=
ard-lnl-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-7/igt@kms_vrr@=
flipline.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4227">Intel XE#4227</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@kms_vrr@flipline.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-r=
ace.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4842">Intel XE#4842</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-433/igt@xe_exec_basic@mult=
igpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE=
#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-139954v15/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-null-defer-bind.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-6/igt@xe_exec_=
system_allocator@many-large-execqueues-new-race.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#34=
28</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
9954v15/shard-bmg-3/igt@xe_exec_system_allocator@many-large-execqueues-new-=
race.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-l=
nl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/sha=
rd-lnl-5/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f=
/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89=
526f/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200da=
fd89526f/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b54507232=
00dafd89526f/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450=
723200dafd89526f/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b=
5450723200dafd89526f/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686=
d01b5450723200dafd89526f/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc=
8686d01b5450723200dafd89526f/shard-lnl-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a93=
00fc8686d01b5450723200dafd89526f/shard-lnl-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-36da=
6a9300fc8686d01b5450723200dafd89526f/shard-lnl-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3108-=
36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-=
lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/sh=
ard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3108-36da6a9300fc8686d01b5450723200dafd89526=
f/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-ln=
l-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
39954v15/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-139954v15/shard-lnl-7/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/sha=
rd-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-139954v15/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-2/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-139954v15/shard-lnl-5/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954=
v15/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139954v15/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-ln=
l-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
39954v15/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-139954v15/shard-lnl-6/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/sha=
rd-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-139954v15/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-5/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-139954v15/shard-lnl-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954=
v15/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-4/igt@xe_module=
_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-6/igt@xe_pm@d3=
hot-multiple-execs.html">TIMEOUT</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@xe_pm@d3hot-multiple-e=
xecs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-lnl-2/igt@xe_pm@s4=
-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-lnl-4/igt@xe_pm@s4-=
vm-bind-unbind-all.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-433/igt@kms_bi=
g_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@km=
s_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-adlp-1/igt@kms_big=
_fb@x-tiled-8bpp-rotate-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-adlp-3/=
igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15=
/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-464/igt@kms_cc=
s@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/sha=
rd-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#23=
51</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/420=
8">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-432/igt@kms_ch=
amelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard=
-dg2-464/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-4/igt@kms_cont=
ent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-7/igt@kms_=
content_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-3/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-433/igt@kms_cu=
rsor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464=
/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i=
915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-6/igt@kms_curs=
or_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/sha=
rd-bmg-3/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-433/igt@kms_ds=
c@dsc-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_dsc@dsc-wit=
h-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard=
-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel=
 XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-bmg-4=
/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-432/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
139954v15/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-y=
tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
39954v15/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-in=
dfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
042">Intel XE#5042</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-139954v15/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-pri=
mscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#41=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
9954v15/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-=
fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v15/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4141">Intel XE#4141</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Inte=
l XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-139954v15/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscr=
n-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v15/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indf=
b-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-139954v15/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-=
cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042"=
>Intel XE#5042</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-139954v15/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-prim=
scrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v15/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb=
-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2313">Intel XE#2313</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v15/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-=
draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
9954v15/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-=
fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-435/igt@kms_pl=
ane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139954v15/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-fa=
ctor-0-25-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-435/igt@kms_ps=
r2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v15/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exc=
eed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-464/igt@kms_ps=
r@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard=
-dg2-464/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-432/igt@kms_ro=
tation_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/ig=
t@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-435/igt@xe_eud=
ebug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg=
2-464/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-435/igt@xe_exe=
c_fault_mode@many-execqueues-userptr-imm.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-d=
g2-464/igt@xe_exec_fault_mode@many-execqueues-userptr-imm.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-433/igt@xe_exe=
c_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15=
/shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-mlock:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-432/igt@xe_exe=
c_system_allocator@threads-many-large-mmap-mlock.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v=
15/shard-dg2-464/igt@xe_exec_system_allocator@threads-many-large-mmap-mlock=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-464/igt@xe_huc=
_copy@huc_copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_huc_copy@huc=
_copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-435/igt@xe_oa@=
non-privileged-map-oa-buffer.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/sha=
rd-dg2-464/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-432/igt@xe_pmu=
@gt-frequency.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4819">Intel XE#4819</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/igt@xe_pmu@gt-freq=
uency.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3108-36da6a9300fc8686d01b5450723200dafd89526f/shard-dg2-433/igt@xe_que=
ry@multigpu-query-invalid-query.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v15/shard-dg2-464/ig=
t@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8366 -&gt; IGT_8367</li>
<li>Linux: xe-3108-36da6a9300fc8686d01b5450723200dafd89526f -&gt; xe-pw-139=
954v15</li>
</ul>
<p>IGT_8366: 8366<br />
  IGT_8367: 8367<br />
  xe-3108-36da6a9300fc8686d01b5450723200dafd89526f: 36da6a9300fc8686d01b545=
0723200dafd89526f<br />
  xe-pw-139954v15: 139954v15</p>

</body>
</html>

--===============2931614394927805668==--
