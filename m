Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6331AC3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 11:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E2A10E612;
	Wed, 14 May 2025 11:51:58 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32BC10E612;
 Wed, 14 May 2025 11:51:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6460743580674945453=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/i915=3A_Indicate_which?=
 =?utf-8?q?_pipe_lied_about_its_interrupts?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 May 2025 11:51:56 -0000
Message-ID: <174722351670.78050.7328415628264216053@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250513092820.18715-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250513092820.18715-1-ville.syrjala@linux.intel.com>
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

--===============6460743580674945453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Indicate which pipe lied about its interrupts
URL   : https://patchwork.freedesktop.org/series/148950/
State : success

== Summary ==

CI Bug Log - changes from xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089_FULL -> xe-pw-148950v1_FULL
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

  Here are the changes found in xe-pw-148950v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@write:
    - shard-dg2-set2:     [PASS][1] -> [SKIP][2] ([Intel XE#2134]) +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@fbdev@write.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@fbdev@write.html

  * igt@intel_sysfs_debugfs@xe-forcewake:
    - shard-dg2-set2:     [PASS][3] -> [SKIP][4] ([Intel XE#4208] / [Intel XE#4618]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@intel_sysfs_debugfs@xe-forcewake.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@intel_sysfs_debugfs@xe-forcewake.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-adlp:         NOTRUN -> [SKIP][5] ([Intel XE#3157])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#3157])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
    - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#911])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][9] -> [FAIL][10] ([Intel XE#3884]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#3768])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     [PASS][12] -> [SKIP][13] ([Intel XE#4208] / [i915#2575]) +105 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_atomic@plane-invalid-params-fence.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [PASS][14] -> [SKIP][15] ([Intel XE#2351] / [Intel XE#4208]) +12 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#316]) +4 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1407]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-5/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2327]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-8/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][19] ([Intel XE#4543]) +1 other test dmesg-fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#316]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1477])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][24] -> [DMESG-FAIL][25] ([Intel XE#4543]) +11 other tests dmesg-fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1124]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1124]) +7 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#2314] / [Intel XE#2894])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#2191])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#367]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2887]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-8/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#2907])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#787]) +160 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#3432])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#3432])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#787]) +11 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#2907])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#2669]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][41] -> [INCOMPLETE][42] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][43] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][44] ([Intel XE#1727] / [Intel XE#3113])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#455] / [Intel XE#787]) +27 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#4417] / [Intel XE#455])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_cdclk@mode-transition.html
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2724])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#4417]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#4417]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#306])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#373])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-4/igt@kms_chamelium_edid@dp-edid-resolution-list.html
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2252]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#373]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#373]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][55] ([Intel XE#1178])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#455]) +6 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][57] ([Intel XE#1188]) +1 other test fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1424]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#308])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#309])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2291])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#309]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#2291]) +5 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [PASS][65] -> [FAIL][66] ([Intel XE#1475])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_feature_discovery@chamelium:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#701])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-8/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][68] ([Intel XE#301] / [Intel XE#3321]) +2 other tests fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][69] ([Intel XE#301]) +5 other tests fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][70] -> [FAIL][71] ([Intel XE#3321]) +1 other test fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1421]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#2316]) +8 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#310]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2316])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          NOTRUN -> [FAIL][77] ([Intel XE#3321]) +2 other tests fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][78] ([Intel XE#301]) +3 other tests fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][79] -> [INCOMPLETE][80] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][81] -> [SKIP][82] ([Intel XE#4208]) +207 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1401] / [Intel XE#1745])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1401])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][85] ([Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#651]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#651]) +19 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2312]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2311]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#4141]) +4 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#651]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#656]) +13 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1469])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2352])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2313]) +5 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#653]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#653]) +15 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#656]) +12 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#2351] / [Intel XE#4208]) +11 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1470])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-1/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#346])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#2925])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#2927])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-3/igt@kms_joiner@basic-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2927])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#2927])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-8/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_lease@invalid-create-leases:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#4208] / [i915#2575]) +31 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_lease@invalid-create-leases.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][107] ([Intel XE#616])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#5020])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][109] ([Intel XE#4212])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [ABORT][110] ([Intel XE#4760])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#2763]) +5 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#2763]) +7 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#2763]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2763]) +9 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#870])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#870])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-1/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#908]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html
    - shard-adlp:         [PASS][120] -> [FAIL][121] ([Intel XE#718])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][122] -> [FAIL][123] ([Intel XE#718]) +1 other test fail
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1129])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#1489])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#1489])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-8/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#2893])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#1489]) +6 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@fbc-psr2-primary-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#4609]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#1406]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-8/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#2939])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#3414] / [Intel XE#3904])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#3414])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-3/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#3414] / [Intel XE#3904])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-8/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#3414]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#1127])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#1127])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2330])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][142] -> [SKIP][143] ([Intel XE#1435])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#2168])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_vrr@cmrr.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#756])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#455]) +5 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-4/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#1123])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#1062])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-2/igt@xe_create@create-big-vram.html

  * igt@xe_eudebug@multiple-sessions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#4837]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@xe_eudebug@multiple-sessions.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#4837])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#4518])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@xe_eudebug_sriov@deny-eudebug.html
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#4519])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@xe_eudebug_sriov@deny-eudebug.html
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#4518])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-2/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-beng-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@xe_evict@evict-beng-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#688]) +2 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#1392]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#1392]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#1392]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2322])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-dg2-set2:     [PASS][160] -> [SKIP][161] ([Intel XE#1392]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@xe_exec_basic@multigpu-once-null.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_basic@once-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#4208]) +160 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_exec_basic@once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#288]) +8 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][164] ([Intel XE#288]) +4 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html

  * igt@xe_exec_sip_eudebug@breakpoint-waitsip:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#4837]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-5/igt@xe_exec_sip_eudebug@breakpoint-waitsip.html

  * igt@xe_exec_system_allocator@process-many-execqueues-free:
    - shard-adlp:         NOTRUN -> [SKIP][166] ([Intel XE#4915]) +41 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-9/igt@xe_exec_system_allocator@process-many-execqueues-free.html

  * igt@xe_exec_system_allocator@process-many-mmap-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][167] ([Intel XE#4943]) +6 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-4/igt@xe_exec_system_allocator@process-many-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#4943]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-race-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#4915]) +89 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [PASS][170] -> [FAIL][171] ([Intel XE#5018])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#4045])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-6/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_module_load@force-load:
    - shard-adlp:         NOTRUN -> [SKIP][173] ([Intel XE#378])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@xe_module_load@force-load.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [PASS][174] -> [FAIL][175] ([Intel XE#4208])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-435/igt@xe_module_load@reload.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_module_load@reload.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-adlp:         NOTRUN -> [SKIP][176] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-4/igt@xe_oa@invalid-oa-format-id.html

  * igt@xe_oa@mi-rpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][177] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@xe_oa@mi-rpc.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][178] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-9/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][179] ([Intel XE#1173])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-adlp:         NOTRUN -> [SKIP][180] ([Intel XE#2284] / [Intel XE#366])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-bmg:          [PASS][181] -> [DMESG-WARN][182] ([Intel XE#3428])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][183] ([Intel XE#4733])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-lnl:          NOTRUN -> [SKIP][184] ([Intel XE#944])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-8/igt@xe_query@multigpu-query-oa-units.html
    - shard-adlp:         NOTRUN -> [SKIP][185] ([Intel XE#944])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-3/igt@xe_query@multigpu-query-oa-units.html
    - shard-bmg:          NOTRUN -> [SKIP][186] ([Intel XE#944])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#944]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#3342])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@xe_sriov_flr@flr-each-isolation.html
    - shard-lnl:          NOTRUN -> [SKIP][189] ([Intel XE#3342])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-2/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-adlp:         [DMESG-WARN][190] ([Intel XE#4173]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@core_hotunplug@hotunbind-rebind.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-4/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [SKIP][192] ([Intel XE#4963]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@core_hotunplug@unplug-rescan.html
    - shard-lnl:          [SKIP][194] ([Intel XE#4963]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@core_hotunplug@unplug-rescan.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-6/igt@core_hotunplug@unplug-rescan.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [FAIL][196] ([Intel XE#4208]) -> [PASS][197] +1 other test pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@core_setmaster@master-drop-set-user.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@pan:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#2134]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@fbdev@pan.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@fbdev@pan.html

  * igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][200] ([Intel XE#4543]) -> [PASS][201] +1 other test pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [DMESG-FAIL][202] ([Intel XE#4543]) -> [PASS][203] +5 other tests pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][204] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][205] +1 other test pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-bmg:          [INCOMPLETE][206] ([Intel XE#3226]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          [SKIP][208] ([Intel XE#2291]) -> [PASS][209] +3 other tests pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][210] ([Intel XE#4633]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][212] ([Intel XE#4294]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][214] ([Intel XE#2316]) -> [PASS][215] +8 other tests pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-adlp:         [FAIL][216] ([Intel XE#2882]) -> [PASS][217] +1 other test pass
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:
    - shard-adlp:         [FAIL][218] ([Intel XE#301]) -> [PASS][219] +1 other test pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][220] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][221] +1 other test pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][223] +9 other tests pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-adlp:         [ABORT][224] -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-6/igt@kms_hdmi_inject@inject-audio.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#455]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
    - shard-bmg:          [SKIP][228] ([Intel XE#1503]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - shard-adlp:         [SKIP][230] ([Intel XE#4996]) -> [PASS][231] +5 other tests pass
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_pipe_crc_basic@hang-read-crc.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [SKIP][232] ([Intel XE#4596]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][234] ([Intel XE#2571]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][236] ([Intel XE#718]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-lnl:          [SKIP][238] ([Intel XE#2351] / [Intel XE#4996]) -> [PASS][239] +2 other tests pass
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_psr@psr2-sprite-plane-onoff.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-8/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_sequence@get-idle:
    - shard-bmg:          [SKIP][240] ([Intel XE#4954] / [Intel XE#4996]) -> [PASS][241] +14 other tests pass
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_sequence@get-idle.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_sequence@get-idle.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][242] ([Intel XE#1435]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vblank@accuracy-idle:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#4208] / [i915#2575]) -> [PASS][245] +85 other tests pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_vblank@accuracy-idle.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@kms_vblank@accuracy-idle.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#4208]) -> [PASS][247] +153 other tests pass
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_exec_basic@many-null-rebind.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#1392]) -> [PASS][249]
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_system_allocator@many-free:
    - shard-bmg:          [SKIP][250] ([Intel XE#4996]) -> [PASS][251] +21 other tests pass
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_exec_system_allocator@many-free.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@xe_exec_system_allocator@many-free.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][252] ([Intel XE#5018]) -> [PASS][253]
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * {igt@xe_exec_system_allocator@twice-large-malloc-bo-unmap-nomemset}:
    - shard-lnl:          [SKIP][254] ([Intel XE#4996]) -> [PASS][255] +38 other tests pass
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@xe_exec_system_allocator@twice-large-malloc-bo-unmap-nomemset.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@xe_exec_system_allocator@twice-large-malloc-bo-unmap-nomemset.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-adlp:         [DMESG-WARN][256] ([Intel XE#4792]) -> [PASS][257]
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
    - shard-dg2-set2:     [DMESG-WARN][258] ([Intel XE#4792]) -> [PASS][259]
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_mmap@bad-object:
    - shard-adlp:         [SKIP][260] ([Intel XE#4945] / [Intel XE#4996]) -> [PASS][261] +9 other tests pass
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_mmap@bad-object.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@xe_mmap@bad-object.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][262] ([Intel XE#1794]) -> [PASS][263]
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#623]) -> [SKIP][265] ([Intel XE#4208] / [i915#2575])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#316]) -> [SKIP][267] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         [SKIP][268] ([Intel XE#4996]) -> [SKIP][269] ([Intel XE#316]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-270.html
    - shard-bmg:          [SKIP][270] ([Intel XE#2231] / [Intel XE#4996]) -> [SKIP][271] ([Intel XE#2327]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-270.html
    - shard-lnl:          [SKIP][272] ([Intel XE#2351] / [Intel XE#4996]) -> [SKIP][273] ([Intel XE#1407]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-8/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#316]) -> [SKIP][275] ([Intel XE#4208])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#4208]) -> [SKIP][277] ([Intel XE#316]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-lnl:          [SKIP][278] ([Intel XE#2351] / [Intel XE#4996]) -> [SKIP][279] ([Intel XE#1124]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-7/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
    - shard-adlp:         [SKIP][280] ([Intel XE#2351] / [Intel XE#4996]) -> [DMESG-FAIL][281] ([Intel XE#4543])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#1124]) -> [SKIP][283] ([Intel XE#2351] / [Intel XE#4208])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#4208]) -> [SKIP][285] ([Intel XE#610])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#4208]) -> [SKIP][287] ([Intel XE#1124]) +3 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][289] ([Intel XE#619])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#610]) -> [SKIP][291] ([Intel XE#4208])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][293] ([Intel XE#1124]) +3 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         [SKIP][294] ([Intel XE#4996]) -> [SKIP][295] ([Intel XE#1124])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
    - shard-bmg:          [SKIP][296] ([Intel XE#2231] / [Intel XE#4996]) -> [SKIP][297] ([Intel XE#1124]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#1124]) -> [SKIP][299] ([Intel XE#4208]) +11 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#4208] / [i915#2575]) -> [SKIP][301] ([Intel XE#2191]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#2191]) -> [SKIP][303] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#367]) -> [SKIP][305] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#4208] / [i915#2575]) -> [SKIP][307] ([Intel XE#367])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][309] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#2907]) -> [SKIP][311] ([Intel XE#4208])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#4208]) -> [SKIP][313] ([Intel XE#2907]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][315] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-adlp:         [SKIP][316] ([Intel XE#4996]) -> [SKIP][317] ([Intel XE#455] / [Intel XE#787])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
    - shard-bmg:          [SKIP][318] ([Intel XE#2231] / [Intel XE#4996]) -> [SKIP][319] ([Intel XE#2887])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
    - shard-lnl:          [SKIP][320] ([Intel XE#2351] / [Intel XE#4996]) -> [SKIP][321] ([Intel XE#2887])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][323] ([Intel XE#4208]) +15 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#4208]) -> [SKIP][325] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][327] ([Intel XE#4418])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#4208] / [i915#2575]) -> [SKIP][329] ([Intel XE#306]) +1 other test skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_chamelium_color@ctm-0-25.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#306]) -> [SKIP][331] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_chamelium_color@gamma.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#4208] / [i915#2575]) -> [SKIP][333] ([Intel XE#373]) +12 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_chamelium_edid@hdmi-mode-timings.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#373]) -> [SKIP][335] ([Intel XE#4208] / [i915#2575]) +12 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-adlp:         [SKIP][336] ([Intel XE#4950] / [Intel XE#4996]) -> [SKIP][337] ([Intel XE#373])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [FAIL][338] ([Intel XE#1178]) -> [SKIP][339] ([Intel XE#4208] / [i915#2575])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-436/igt@kms_content_protection@atomic.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#4208] / [i915#2575]) -> [SKIP][341] ([Intel XE#307]) +1 other test skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#307]) -> [SKIP][343] ([Intel XE#4208] / [i915#2575])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][344] ([Intel XE#2341]) -> [FAIL][345] ([Intel XE#1178])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_content_protection@lic-type-0.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          [SKIP][346] ([Intel XE#4996]) -> [SKIP][347] ([Intel XE#3278])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_content_protection@uevent.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-1/igt@kms_content_protection@uevent.html
    - shard-bmg:          [SKIP][348] ([Intel XE#4996]) -> [SKIP][349] ([Intel XE#2341])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_content_protection@uevent.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#4208] / [i915#2575]) -> [SKIP][351] ([Intel XE#308])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#308]) -> [SKIP][353] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-adlp:         [SKIP][354] ([Intel XE#4996]) -> [SKIP][355] ([Intel XE#4354])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_dp_link_training@non-uhbr-sst.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-1/igt@kms_dp_link_training@non-uhbr-sst.html
    - shard-bmg:          [SKIP][356] ([Intel XE#2231] / [Intel XE#4996]) -> [SKIP][357] ([Intel XE#4354])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
    - shard-lnl:          [SKIP][358] ([Intel XE#2351] / [Intel XE#4996]) -> [SKIP][359] ([Intel XE#4354])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_dp_link_training@non-uhbr-sst.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-1/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#4356]) -> [SKIP][361] ([Intel XE#4208])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_dp_link_training@uhbr-mst.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#4331]) -> [SKIP][363] ([Intel XE#4208])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#455]) -> [SKIP][365] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#4208]) -> [SKIP][367] ([Intel XE#4422])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#776]) -> [SKIP][369] ([Intel XE#4208])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_fbcon_fbt@psr.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#4208] / [i915#2575]) -> [SKIP][371] ([Intel XE#1138])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_feature_discovery@display-4x.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#4208] / [i915#2575]) -> [SKIP][373] ([Intel XE#1135])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_feature_discovery@psr1.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][374] ([Intel XE#2316]) -> [FAIL][375] ([Intel XE#3321])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][377] ([Intel XE#455])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#455]) -> [SKIP][379] ([Intel XE#4208]) +5 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#4208]) -> [SKIP][381] ([Intel XE#455]) +4 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][382] ([Intel XE#2311]) -> [SKIP][383] ([Intel XE#2311] / [Intel XE#5042])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [SKIP][384] ([Intel XE#4996]) -> [SKIP][385] ([Intel XE#651])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html
    - shard-bmg:          [SKIP][386] ([Intel XE#2231] / [Intel XE#4954] / [Intel XE#4996]) -> [SKIP][387] ([Intel XE#2311])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#651]) -> [SKIP][389] ([Intel XE#4208]) +21 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][390] ([Intel XE#2311]) -> [SKIP][391] ([Intel XE#2312]) +17 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#651]) -> [SKIP][393] ([Intel XE#2351] / [Intel XE#4208]) +8 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#4208]) -> [SKIP][395] ([Intel XE#651]) +15 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-adlp:         [SKIP][396] ([Intel XE#2351]) -> [SKIP][397] ([Intel XE#656])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
    - shard-bmg:          [SKIP][398] ([Intel XE#2231] / [Intel XE#4954]) -> [SKIP][399] ([Intel XE#4141])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
    - shard-lnl:          [SKIP][400] ([Intel XE#2351]) -> [SKIP][401] ([Intel XE#656])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][402] ([Intel XE#2312]) -> [SKIP][403] ([Intel XE#2312] / [Intel XE#5042])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][404] ([Intel XE#4141]) -> [SKIP][405] ([Intel XE#2312]) +10 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][406] ([Intel XE#2312]) -> [SKIP][407] ([Intel XE#4141]) +5 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - shard-bmg:          [SKIP][408] ([Intel XE#2231] / [Intel XE#4954] / [Intel XE#4996]) -> [SKIP][409] ([Intel XE#4141])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][410] ([Intel XE#2231] / [Intel XE#4954]) -> [SKIP][411] ([Intel XE#2311])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html
    - shard-adlp:         [SKIP][412] ([Intel XE#2351]) -> [SKIP][413] ([Intel XE#651])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html
    - shard-lnl:          [SKIP][414] ([Intel XE#2351]) -> [SKIP][415] ([Intel XE#651])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][416] ([Intel XE#2312]) -> [SKIP][417] ([Intel XE#2311]) +23 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
    - shard-dg2-set2:     [SKIP][418] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][419] ([Intel XE#651]) +5 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         [SKIP][420] ([Intel XE#4996]) -> [SKIP][421] ([Intel XE#656]) +1 other test skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
    - shard-bmg:          [SKIP][422] ([Intel XE#2231] / [Intel XE#4954] / [Intel XE#4996]) -> [SKIP][423] ([Intel XE#2312]) +1 other test skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
    - shard-lnl:          [SKIP][424] ([Intel XE#2351] / [Intel XE#4996]) -> [SKIP][425] ([Intel XE#656]) +1 other test skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][426] ([Intel XE#2312]) -> [SKIP][427] ([Intel XE#2313]) +24 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][428] ([Intel XE#653]) -> [SKIP][429] ([Intel XE#2351] / [Intel XE#4208]) +7 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-bmg:          [SKIP][430] ([Intel XE#2231] / [Intel XE#4954] / [Intel XE#4996]) -> [SKIP][431] ([Intel XE#2313])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
    - shard-adlp:         [SKIP][432] ([Intel XE#4996]) -> [SKIP][433] ([Intel XE#653])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][435] ([Intel XE#653]) +7 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][436] ([Intel XE#4208]) -> [SKIP][437] ([Intel XE#653]) +16 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][438] ([Intel XE#2313]) -> [SKIP][439] ([Intel XE#2312]) +22 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#653]) -> [SKIP][441] ([Intel XE#4208]) +25 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][442] ([Intel XE#2925]) -> [SKIP][443] ([Intel XE#4208])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-436/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][444] ([Intel XE#356]) -> [SKIP][445] ([Intel XE#4208] / [i915#2575])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-adlp:         [SKIP][446] ([Intel XE#4950] / [Intel XE#4996]) -> [SKIP][447] ([Intel XE#455])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_panel_fitting@legacy.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-9/igt@kms_panel_fitting@legacy.html
    - shard-bmg:          [SKIP][448] ([Intel XE#4954] / [Intel XE#4996]) -> [SKIP][449] ([Intel XE#2486])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_panel_fitting@legacy.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_cursor@overlay:
    - shard-dg2-set2:     [SKIP][450] ([Intel XE#4208] / [i915#2575]) -> [FAIL][451] ([Intel XE#616])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_plane_cursor@overlay.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2-set2:     [SKIP][452] ([Intel XE#5021]) -> [SKIP][453] ([Intel XE#4208] / [i915#2575])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-y.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][454] ([Intel XE#5021]) -> [SKIP][455] ([Intel XE#4596]) +1 other test skip
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#4208] / [i915#2575]) -> [SKIP][457] ([Intel XE#5021])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][458] ([Intel XE#4208] / [i915#2575]) -> [SKIP][459] ([Intel XE#2763] / [Intel XE#455])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][460] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][461] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][462] ([Intel XE#4208]) -> [SKIP][463] ([Intel XE#870])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_pm_backlight@bad-brightness.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          [SKIP][464] ([Intel XE#736]) -> [SKIP][465] ([Intel XE#1909])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_properties@get_properties-sanity-non-atomic:
    - shard-dg2-set2:     [FAIL][466] ([Intel XE#5017]) -> [SKIP][467] ([Intel XE#4208] / [i915#2575])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_properties@get_properties-sanity-non-atomic.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_properties@get_properties-sanity-non-atomic.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][468] ([Intel XE#4208]) -> [SKIP][469] ([Intel XE#1489]) +8 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][470] ([Intel XE#1489]) -> [SKIP][471] ([Intel XE#4208]) +10 other tests skip
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][472] ([Intel XE#1122]) -> [SKIP][473] ([Intel XE#4208]) +1 other test skip
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_psr2_su@page_flip-p010.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-bmg:          [SKIP][474] ([Intel XE#2231] / [Intel XE#4954] / [Intel XE#4996]) -> [SKIP][475] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_psr@fbc-pr-sprite-blt.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@kms_psr@fbc-pr-sprite-blt.html
    - shard-adlp:         [SKIP][476] ([Intel XE#4996]) -> [SKIP][477] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_psr@fbc-pr-sprite-blt.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-1/igt@kms_psr@fbc-pr-sprite-blt.html
    - shard-lnl:          [SKIP][478] ([Intel XE#2351] / [Intel XE#4996]) -> [SKIP][479] ([Intel XE#1406])
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_psr@fbc-pr-sprite-blt.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-5/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][480] ([Intel XE#4208]) -> [SKIP][481] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-render.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][482] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][483] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_psr@psr-dpms.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-dg2-set2:     [SKIP][484] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][485] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_psr@psr-sprite-blt.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][486] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][487] ([Intel XE#4208]) +12 other tests skip
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-436/igt@kms_psr@psr2-basic.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_psr@psr2-basic.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][488] ([Intel XE#3414]) -> [SKIP][489] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-90.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][490] ([Intel XE#4208] / [i915#2575]) -> [SKIP][491] ([Intel XE#1127])
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][492] ([Intel XE#4208] / [i915#2575]) -> [SKIP][493] ([Intel XE#3414]) +1 other test skip
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-270.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][494] ([Intel XE#1500]) -> [SKIP][495] ([Intel XE#4208] / [i915#2575])
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][496] ([Intel XE#455]) -> [SKIP][497] ([Intel XE#4208] / [i915#2575]) +8 other tests skip
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_vrr@flip-dpms.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][498] ([Intel XE#4208] / [i915#2575]) -> [SKIP][499] ([Intel XE#455]) +4 other tests skip
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_vrr@flipline.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_vrr@flipline.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          [SKIP][500] ([Intel XE#4996]) -> [SKIP][501] ([Intel XE#1499])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_vrr@negative-basic.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-2/igt@kms_vrr@negative-basic.html
    - shard-adlp:         [SKIP][502] ([Intel XE#4996]) -> [SKIP][503] ([Intel XE#455]) +1 other test skip
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_vrr@negative-basic.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][504] ([Intel XE#756]) -> [SKIP][505] ([Intel XE#4208] / [i915#2575])
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_writeback@writeback-fb-id.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html

  * igt@testdisplay:
    - shard-dg2-set2:     [ABORT][506] -> [ABORT][507] ([Intel XE#2705])
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-434/igt@testdisplay.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-436/igt@testdisplay.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][508] ([Intel XE#4208]) -> [SKIP][509] ([Intel XE#1123])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-adlp:         [SKIP][510] ([Intel XE#4945] / [Intel XE#4996]) -> [SKIP][511] ([Intel XE#1123])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][512] ([Intel XE#1126]) -> [SKIP][513] ([Intel XE#4208])
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eu_stall@invalid-gt-id:
    - shard-dg2-set2:     [SKIP][514] ([Intel XE#4497]) -> [SKIP][515] ([Intel XE#4208]) +2 other tests skip
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_eu_stall@invalid-gt-id.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_eu_stall@invalid-gt-id.html

  * igt@xe_eu_stall@invalid-sampling-rate:
    - shard-dg2-set2:     [SKIP][516] ([Intel XE#4208]) -> [SKIP][517] ([Intel XE#4497])
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_eu_stall@invalid-sampling-rate.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@xe_eu_stall@invalid-sampling-rate.html

  * igt@xe_eudebug@basic-vm-access-userptr-faultable:
    - shard-dg2-set2:     [SKIP][518] ([Intel XE#4208]) -> [SKIP][519] ([Intel XE#4837]) +14 other tests skip
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@xe_eudebug@basic-vm-access-userptr-faultable.html

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - shard-dg2-set2:     [SKIP][520] ([Intel XE#4837]) -> [SKIP][521] ([Intel XE#4208]) +15 other tests skip
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@xe_eudebug@vm-bind-clear-faultable.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_eudebug@vm-bind-clear-faultable.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-bmg:          [SKIP][522] ([Intel XE#4954] / [Intel XE#4996]) -> [SKIP][523] ([Intel XE#4837])
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_eudebug_online@basic-breakpoint.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@xe_eudebug_online@basic-breakpoint.html
    - shard-adlp:         [SKIP][524] ([Intel XE#4945] / [Intel XE#4996]) -> [SKIP][525] ([Intel XE#4837])
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_eudebug_online@basic-breakpoint.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@xe_eudebug_online@basic-breakpoint.html
    - shard-lnl:          [SKIP][526] ([Intel XE#4996]) -> [SKIP][527] ([Intel XE#4837])
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@xe_eudebug_online@basic-breakpoint.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-dg2-set2:     [SKIP][528] ([Intel XE#4518]) -> [SKIP][529] ([Intel XE#4208])
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@xe_eudebug_sriov@deny-sriov.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][530] ([Intel XE#1392]) -> [SKIP][531] ([Intel XE#4208]) +1 other test skip
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          [SKIP][532] ([Intel XE#4996]) -> [SKIP][533] ([Intel XE#1392])
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-7/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html
    - shard-adlp:         [SKIP][534] ([Intel XE#4945] / [Intel XE#4996]) -> [SKIP][535] ([Intel XE#1392])
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-1/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html
    - shard-bmg:          [SKIP][536] ([Intel XE#4954] / [Intel XE#4996]) -> [SKIP][537] ([Intel XE#2322])
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-7/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-adlp:         [SKIP][538] ([Intel XE#4945] / [Intel XE#4996]) -> [SKIP][539] ([Intel XE#288])
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
    - shard-dg2-set2:     [SKIP][540] ([Intel XE#4208]) -> [SKIP][541] ([Intel XE#288]) +21 other tests skip
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][542] ([Intel XE#288]) -> [SKIP][543] ([Intel XE#4208]) +29 other tests skip
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-adlp:         [SKIP][544] ([Intel XE#4945] / [Intel XE#4996]) -> [SKIP][545] ([Intel XE#2360])
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     [SKIP][546] ([Intel XE#4208]) -> [SKIP][547] ([Intel XE#2360])
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_system_allocator@many-mmap-shared:
    - shard-adlp:         [SKIP][548] ([Intel XE#4945] / [Intel XE#4996]) -> [SKIP][549] ([Intel XE#4915]) +12 other tests skip
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_exec_system_allocator@many-mmap-shared.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@xe_exec_system_allocator@many-mmap-shared.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
    - shard-dg2-set2:     [SKIP][550] ([Intel XE#4208]) -> [SKIP][551] ([Intel XE#4915]) +154 other tests skip
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:
    - shard-dg2-set2:     [SKIP][552] ([Intel XE#4915]) -> [SKIP][553] ([Intel XE#4208]) +188 other tests skip
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][554] -> [ABORT][555] ([Intel XE#4917])
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-lnl:          [FAIL][556] ([Intel XE#5012]) -> [ABORT][557] ([Intel XE#4911])
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
    - shard-adlp:         [FAIL][558] ([Intel XE#5012]) -> [TIMEOUT][559] ([Intel XE#4911])
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
    - shard-bmg:          [FAIL][560] ([Intel XE#5012]) -> [ABORT][561] ([Intel XE#4911])
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_oa@buffer-size:
    - shard-dg2-set2:     [SKIP][562] ([Intel XE#4501]) -> [SKIP][563] ([Intel XE#4208])
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_oa@buffer-size.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_oa@buffer-size.html

  * igt@xe_oa@missing-sample-flags:
    - shard-dg2-set2:     [SKIP][564] ([Intel XE#4208]) -> [SKIP][565] ([Intel XE#2541] / [Intel XE#3573]) +4 other tests skip
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_oa@missing-sample-flags.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@xe_oa@missing-sample-flags.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][566] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][567] ([Intel XE#4208]) +5 other tests skip
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_oa@polling-small-buf.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_oa@polling-small-buf.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-dg2-set2:     [SKIP][568] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][569] ([Intel XE#4208])
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@xe_oa@syncs-syncobj-wait-cfg.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_oa@syncs-ufence-wait:
    - shard-dg2-set2:     [SKIP][570] ([Intel XE#4208]) -> [SKIP][571] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_oa@syncs-ufence-wait.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@xe_oa@syncs-ufence-wait.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-adlp:         [SKIP][572] ([Intel XE#4945] / [Intel XE#4996]) -> [SKIP][573] ([Intel XE#2541] / [Intel XE#3573])
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_oa@unprivileged-single-ctx-counters.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-9/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][574] ([Intel XE#977]) -> [SKIP][575] ([Intel XE#4208])
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@xe_pat@pat-index-xe2.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_pat@pat-index-xe2.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][576] ([Intel XE#1061] / [Intel XE#4208]) -> [FAIL][577] ([Intel XE#1173])
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_peer2peer@write.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][578] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][579] ([Intel XE#4208]) +1 other test skip
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][580] ([Intel XE#4208]) -> [SKIP][581] ([Intel XE#2284])
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_pm@d3cold-mocs.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][582] ([Intel XE#4208]) -> [SKIP][583] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][584] ([Intel XE#4208]) -> [SKIP][585] ([Intel XE#579])
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-dg2-set2:     [SKIP][586] ([Intel XE#4650]) -> [SKIP][587] ([Intel XE#4208])
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-435/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-dg2-set2:     [SKIP][588] ([Intel XE#4208]) -> [SKIP][589] ([Intel XE#4733])
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-dg2-set2:     [SKIP][590] ([Intel XE#4733]) -> [SKIP][591] ([Intel XE#4208])
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-config:
    - shard-adlp:         [SKIP][592] ([Intel XE#4945] / [Intel XE#4996]) -> [SKIP][593] ([Intel XE#944])
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_query@multigpu-query-config.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-1/igt@xe_query@multigpu-query-config.html
    - shard-bmg:          [SKIP][594] ([Intel XE#4954] / [Intel XE#4996]) -> [SKIP][595] ([Intel XE#944])
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_query@multigpu-query-config.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-7/igt@xe_query@multigpu-query-config.html
    - shard-lnl:          [SKIP][596] ([Intel XE#4996]) -> [SKIP][597] ([Intel XE#944])
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@xe_query@multigpu-query-config.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-7/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][598] ([Intel XE#4208]) -> [SKIP][599] ([Intel XE#944])
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_query@multigpu-query-cs-cycles.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][600] ([Intel XE#944]) -> [SKIP][601] ([Intel XE#4208]) +2 other tests skip
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-434/igt@xe_query@multigpu-query-engines.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_query@multigpu-query-engines.html

  * igt@xe_render_copy@render-stress-0-copies:
    - shard-dg2-set2:     [SKIP][602] ([Intel XE#4208]) -> [SKIP][603] ([Intel XE#4814])
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_render_copy@render-stress-0-copies.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@xe_render_copy@render-stress-0-copies.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-dg2-set2:     [SKIP][604] ([Intel XE#4814]) -> [SKIP][605] ([Intel XE#4208])
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@xe_render_copy@render-stress-1-copies.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_render_copy@render-stress-1-copies.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-dg2-set2:     [SKIP][606] ([Intel XE#4821]) -> [SKIP][607] ([Intel XE#4208])
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-435/igt@xe_spin_batch@spin-mem-copy.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_spin_batch@spin-mem-copy.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     [SKIP][608] ([Intel XE#4208]) -> [SKIP][609] ([Intel XE#4130]) +1 other test skip
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     [SKIP][610] ([Intel XE#4130]) -> [SKIP][611] ([Intel XE#4208])
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-dg2-set2:     [SKIP][612] ([Intel XE#4273]) -> [SKIP][613] ([Intel XE#4208])
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@xe_sriov_flr@flr-twice.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     [SKIP][614] ([Intel XE#4208]) -> [SKIP][615] ([Intel XE#4351])
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4792]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4792
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#4996]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996
  [Intel XE#5012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5012
  [Intel XE#5017]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5017
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8362 -> IGT_8363
  * Linux: xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089 -> xe-pw-148950v1

  IGT_8362: 8362
  IGT_8363: 58f45de87b977a0134e8deae8d2103c7a8ccd3fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089: 4fd790cf2b20fd2ab205aa2a074cecd214562089
  xe-pw-148950v1: 148950v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/index.html

--===============6460743580674945453==
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
<tr><td><b>Series:</b></td><td>drm/i915: Indicate which pipe lied about its interrupts</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148950/">https://patchwork.freedesktop.org/series/148950/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089_FULL -&gt; xe-pw-148950v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148950v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-forcewake:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@intel_sysfs_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@intel_sysfs_debugfs@xe-forcewake.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_atomic@plane-invalid-params-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_atomic@plane-invalid-params-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +105 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-5/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-8/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +11 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-8/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +160 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417">Intel XE#4417</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-1/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417">Intel XE#4417</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-4/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-8/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +207 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel XE#4921</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-1/igt@kms_hdmi_inject@inject-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-1/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-3/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-8/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@invalid-create-leases:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_lease@invalid-create-leases.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-1/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) +1 other test fail</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-8/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-8/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-3/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-8/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-4/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-2/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multiple-sessions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@xe_eudebug@multiple-sessions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519">Intel XE#4519</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-2/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@xe_evict@evict-beng-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@xe_exec_basic@multigpu-once-null.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_exec_basic@once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +160 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-waitsip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-5/igt@xe_exec_sip_eudebug@breakpoint-waitsip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-free:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-9/igt@xe_exec_system_allocator@process-many-execqueues-free.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-4/igt@xe_exec_system_allocator@process-many-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +89 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-6/igt@xe_mmap@pci-membarrier-parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-435/igt@xe_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-4/igt@xe_oa@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-9/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-8/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-3/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-2/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@core_hotunplug@hotunbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-4/igt@core_hotunplug@hotunbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@core_hotunplug@unplug-rescan.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-6/igt@core_hotunplug@unplug-rescan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@core_setmaster@master-drop-set-user.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@fbdev@pan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-6/igt@kms_hdmi_inject@inject-audio.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-1/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_psr@psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-8/igt@kms_psr@psr2-sprite-plane-onoff.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_sequence@get-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_sequence@get-idle.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_vblank@accuracy-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@kms_vblank@accuracy-idle.html">PASS</a> +85 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_exec_basic@many-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html">PASS</a> +153 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-free:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_exec_system_allocator@many-free.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@xe_exec_system_allocator@many-free.html">PASS</a> +21 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@twice-large-malloc-bo-unmap-nomemset}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@xe_exec_system_allocator@twice-large-malloc-bo-unmap-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@xe_exec_system_allocator@twice-large-malloc-bo-unmap-nomemset.html">PASS</a> +38 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4792">Intel XE#4792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4792">Intel XE#4792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_mmap@bad-object:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_mmap@bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@xe_mmap@bad-object.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-8/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-7/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-436/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-7/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-1/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-1/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-1/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356">Intel XE#4356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042">Intel XE#5042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +23 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-436/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-9/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_plane_cursor@overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@kms_plane_cursor@overlay.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/736">Intel XE#736</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909">Intel XE#1909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@get_properties-sanity-non-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_properties@get_properties-sanity-non-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5017">Intel XE#5017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_properties@get_properties-sanity-non-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-6/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-1/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-5/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_psr@psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_psr@psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-436/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-2/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-434/igt@testdisplay.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-436/igt@testdisplay.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-gt-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_eu_stall@invalid-gt-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497">Intel XE#4497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_eu_stall@invalid-gt-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-sampling-rate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_eu_stall@invalid-sampling-rate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@xe_eu_stall@invalid-sampling-rate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr-faultable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_eudebug@basic-vm-access-userptr-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@xe_eudebug@basic-vm-access-userptr-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@xe_eudebug@vm-bind-clear-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_eudebug@vm-bind-clear-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-4/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-2/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-3/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-7/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-1/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-7/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-shared:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_exec_system_allocator@many-mmap-shared.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@xe_exec_system_allocator@many-mmap-shared.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-432/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +154 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +188 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5012">Intel XE#5012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911">Intel XE#4911</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5012">Intel XE#5012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911">Intel XE#4911</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5012">Intel XE#5012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911">Intel XE#4911</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_oa@buffer-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_oa@buffer-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_oa@missing-sample-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@xe_oa@missing-sample-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@xe_oa@syncs-syncobj-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_oa@syncs-syncobj-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_oa@syncs-ufence-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@xe_oa@syncs-ufence-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-9/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-463/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-435/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-adlp-1/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-bmg-7/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-lnl-7/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-434/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-0-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_render_copy@render-stress-0-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-434/igt@xe_render_copy@render-stress-0-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@xe_render_copy@render-stress-1-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_render_copy@render-stress-1-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-435/igt@xe_spin_batch@spin-mem-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821">Intel XE#4821</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_spin_batch@spin-mem-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@xe_sriov_flr@flr-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-464/igt@xe_sriov_flr@flr-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148950v1/shard-dg2-435/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8362 -&gt; IGT_8363</li>
<li>Linux: xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089 -&gt; xe-pw-148950v1</li>
</ul>
<p>IGT_8362: 8362<br />
  IGT_8363: 58f45de87b977a0134e8deae8d2103c7a8ccd3fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089: 4fd790cf2b20fd2ab205aa2a074cecd214562089<br />
  xe-pw-148950v1: 148950v1</p>

</body>
</html>

--===============6460743580674945453==--
