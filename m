Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AA8C3DA64
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 11:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C650910E3FD;
	Wed, 31 Jul 2024 11:08:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EFB10E15B;
 Wed, 31 Jul 2024 11:08:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8731386029094995409=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Write_all_slices_if_i?=
 =?utf-8?q?ts_mcr_register?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 31 Jul 2024 11:08:54 -0000
Message-ID: <172242413492.467159.1054590846659561194@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240731093152.51424-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240731093152.51424-1-tejas.upadhyay@intel.com>
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

--===============8731386029094995409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Write all slices if its mcr register
URL   : https://patchwork.freedesktop.org/series/136731/
State : failure

== Summary ==

CI Bug Log - changes from xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90_full -> xe-pw-136731v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136731v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136731v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136731v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-lnl:          [PASS][1] -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-1/igt@core_setmaster@master-drop-set-shared-fd.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@core_setmaster@master-drop-set-shared-fd.html

  
Known issues
------------

  Here are the changes found in xe-pw-136731v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - shard-dg2-set2:     [PASS][3] -> [SKIP][4] ([Intel XE#1201] / [Intel XE#2134])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@fbdev@eof.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@fbdev@eof.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#911]) +3 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         [PASS][7] -> [DMESG-WARN][8] ([Intel XE#324])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][9] -> [SKIP][10] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +24 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [PASS][11] -> [FAIL][12] ([Intel XE#1426]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#1426]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [FAIL][15] ([Intel XE#1659])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [PASS][17] -> [FAIL][18] ([Intel XE#1659])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [PASS][20] -> [SKIP][21] ([Intel XE#1201]) +8 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1407])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [FAIL][23] ([Intel XE#1874])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#619])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1467])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1124]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][27] -> [FAIL][28] ([Intel XE#1231])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#367])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#787]) +34 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1399]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#787]) +38 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][34] ([Intel XE#616]) +7 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#787]) +13 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#314]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-6/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#306])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_chamelium_color@degamma.html
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#306])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_chamelium_color@degamma.html
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#306])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#373])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_chamelium_frames@hdmi-crc-single.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#373])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#1178])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][48] ([Intel XE#1204])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x128:
    - shard-adlp:         [PASS][49] -> [INCOMPLETE][50] ([Intel XE#1195])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1424])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][52] -> [SKIP][53] ([Intel XE#1201] / [i915#2575]) +8 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#2423]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201]) +16 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#309])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#323])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [PASS][58] -> [INCOMPLETE][59] ([Intel XE#1616])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-6/igt@kms_fbcon_fbt@fbc-suspend.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#776])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#776])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][62] -> [INCOMPLETE][63] ([Intel XE#1195])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][64] ([Intel XE#2019])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][67] ([Intel XE#1551]) +1 other test dmesg-warn
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-dg2-set2:     [PASS][68] -> [SKIP][69] ([Intel XE#1201] / [Intel XE#2351]) +7 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1401]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1401] / [Intel XE#1745])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#2351]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         [PASS][74] -> [FAIL][75] ([Intel XE#1861])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#656]) +8 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#651]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#651]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#656]) +6 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#653])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
    - shard-lnl:          [PASS][84] -> [SKIP][85] ([Intel XE#2351]) +22 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1470])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - shard-adlp:         [PASS][88] -> [SKIP][89] ([Intel XE#1201]) +75 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][90] ([Intel XE#1035] / [Intel XE#1195])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-adlp:         NOTRUN -> [WARN][91] ([Intel XE#2078]) +3 other tests warn
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [PASS][92] -> [DMESG-WARN][93] ([Intel XE#324]) +6 other tests dmesg-warn
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][94] -> [FAIL][95] ([Intel XE#1874]) +4 other tests fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][96] -> [FAIL][97] ([Intel XE#361])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#2318]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1122] / [Intel XE#1201])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#1122] / [Intel XE#1201])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#736])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][106] -> [FAIL][107] ([Intel XE#718])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1201] / [Intel XE#908])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html
    - shard-lnl:          NOTRUN -> [FAIL][109] ([Intel XE#1430])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html
    - shard-adlp:         NOTRUN -> [FAIL][110] ([Intel XE#718])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#1201] / [Intel XE#929])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr@psr2-suspend:
    - shard-lnl:          [PASS][113] -> [FAIL][114] ([Intel XE#2028]) +6 other tests fail
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_psr@psr2-suspend.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-lnl:          [PASS][115] -> [SKIP][116] ([Intel XE#2423]) +32 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-3/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#1127])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#1201] / [Intel XE#327])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_evict@evict-large:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#1201] / [Intel XE#261])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-6/igt@xe_evict@evict-large.html

  * igt@xe_evict@evict-small:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@xe_evict@evict-small.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#688]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  * igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1130]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind:
    - shard-adlp:         [PASS][124] -> [DMESG-WARN][125] ([Intel XE#2226]) +3 other tests dmesg-warn
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#1392]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-6/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#1201] / [Intel XE#288]) +4 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1201] / [Intel XE#288]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-invalid-fault:
    - shard-lnl:          [PASS][130] -> [SKIP][131] ([Intel XE#1130]) +78 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@xe_exec_fault_mode@many-invalid-fault.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@xe_exec_fault_mode@many-invalid-fault.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#288])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#1201] / [Intel XE#2360])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
    - shard-lnl:          NOTRUN -> [FAIL][134] ([Intel XE#2343])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic:
    - shard-adlp:         [PASS][135] -> [SKIP][136] ([Intel XE#1130] / [Intel XE#1201]) +26 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-2/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [PASS][137] -> [SKIP][138] ([Intel XE#1192] / [Intel XE#1201])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#1201] / [Intel XE#2419]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-lnl:          [PASS][140] -> [FAIL][141] ([Intel XE#1924] / [Intel XE#2028])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#584])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-5/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-dg2-set2:     [PASS][143] -> [SKIP][144] ([Intel XE#1130] / [Intel XE#1201]) +64 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@xe_pm@s4-basic-exec.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][145] -> [ABORT][146] ([Intel XE#1794])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [PASS][147] -> [ABORT][148] ([Intel XE#1794])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#1201] / [Intel XE#944])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
    - shard-adlp:         [PASS][150] -> [FAIL][151] ([Intel XE#1081])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html

  * igt@xe_vm@bind-one-bo-many-times:
    - shard-adlp:         [PASS][152] -> [DMESG-WARN][153] ([Intel XE#1727] / [Intel XE#2226])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@xe_vm@bind-one-bo-many-times.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@xe_vm@bind-one-bo-many-times.html

  * igt@xe_vm@large-split-binds-134217728:
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#1130] / [Intel XE#1201])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@xe_vm@large-split-binds-134217728.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-lnl:          [DMESG-WARN][155] -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-6/igt@core_hotunplug@hotreplug-lateclose.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#1201] / [Intel XE#2134]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@fbdev@write.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@fbdev@write.html
    - shard-lnl:          [SKIP][159] -> [PASS][160] +3 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-3/igt@fbdev@write.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-2/igt@fbdev@write.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][161] ([Intel XE#1033]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#1201] / [Intel XE#2351]) -> [PASS][164] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [FAIL][165] ([Intel XE#1659]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          [SKIP][167] ([Intel XE#2351]) -> [PASS][168] +28 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][169] ([Intel XE#1231]) -> [PASS][170] +1 other test pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][171] ([Intel XE#1242]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_edge_walk@256x256-right-edge:
    - shard-lnl:          [SKIP][173] ([Intel XE#2423]) -> [PASS][174] +32 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_cursor_edge_walk@256x256-right-edge.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_cursor_edge_walk@256x256-right-edge.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset:
    - shard-dg2-set2:     [SKIP][175] ([i915#2575]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [FAIL][177] ([Intel XE#1874]) -> [PASS][178] +1 other test pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#1201]) -> [PASS][180] +27 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [FAIL][181] ([Intel XE#1861]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_lease@page-flip-implicit-plane:
    - shard-adlp:         [INCOMPLETE][183] ([Intel XE#1195]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@kms_lease@page-flip-implicit-plane.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_lease@page-flip-implicit-plane.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#1201] / [i915#2575]) -> [PASS][186] +31 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-FAIL][187] ([Intel XE#324]) -> [PASS][188] +1 other test pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-5/igt@kms_plane@plane-position-hole.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-6/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane@plane-position-hole@pipe-b-plane-2:
    - shard-lnl:          [DMESG-WARN][189] ([Intel XE#324]) -> [PASS][190] +1 other test pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html

  * igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][191] ([Intel XE#2058]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-adlp:         [DMESG-FAIL][193] ([Intel XE#2226]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@kms_pm_dc@dc5-dpms.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-adlp:         [SKIP][195] ([Intel XE#1201]) -> [PASS][196] +97 other tests pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-lnl:          [FAIL][197] ([Intel XE#2028]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_properties@crtc-properties-atomic:
    - shard-adlp:         [SKIP][199] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@kms_properties@crtc-properties-atomic.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_properties@crtc-properties-atomic.html

  * igt@kms_psr@psr-suspend@edp-1:
    - shard-lnl:          [INCOMPLETE][201] -> [PASS][202] +1 other test pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-8/igt@kms_psr@psr-suspend@edp-1.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_psr@psr-suspend@edp-1.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [PASS][204] +4 other tests pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-180.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_vrr@max-min@pipe-a-edp-1:
    - shard-lnl:          [FAIL][205] -> [PASS][206] +1 other test pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_vrr@max-min@pipe-a-edp-1.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_vrr@max-min@pipe-a-edp-1.html

  * igt@xe_dma_buf_sync@export-dma-buf-many:
    - shard-adlp:         [DMESG-WARN][207] ([Intel XE#2226]) -> [PASS][208] +12 other tests pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@xe_dma_buf_sync@export-dma-buf-many.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@xe_dma_buf_sync@export-dma-buf-many.html

  * igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][210] +85 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html

  * igt@xe_exec_basic@once-basic-defer-mmap:
    - shard-lnl:          [SKIP][211] ([Intel XE#1130]) -> [PASS][212] +96 other tests pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@xe_exec_basic@once-basic-defer-mmap.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@xe_exec_basic@once-basic-defer-mmap.html

  * igt@xe_exec_basic@twice-basic-defer-mmap:
    - shard-adlp:         [SKIP][213] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][214] +28 other tests pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@xe_exec_basic@twice-basic-defer-mmap.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@xe_exec_basic@twice-basic-defer-mmap.html

  * igt@xe_exec_threads@threads-hang-basic:
    - shard-adlp:         [DMESG-WARN][215] ([Intel XE#2226] / [Intel XE#358]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@xe_exec_threads@threads-hang-basic.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@xe_exec_threads@threads-hang-basic.html

  * igt@xe_gt_freq@freq_fixed_exec:
    - shard-adlp:         [FAIL][217] ([Intel XE#2256]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@xe_gt_freq@freq_fixed_exec.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@xe_gt_freq@freq_fixed_exec.html

  * igt@xe_spin_batch@spin-fixed-duration:
    - shard-adlp:         [FAIL][219] ([Intel XE#1081]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@xe_spin_batch@spin-fixed-duration.html

  
#### Warnings ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-adlp:         [SKIP][221] ([Intel XE#1201]) -> [ABORT][222] ([Intel XE#2421]) +1 other test abort
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@core_hotunplug@hotunbind-rebind.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@core_hotunplug@hotunbind-rebind.html
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#1201]) -> [ABORT][224] ([Intel XE#2421])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html
    - shard-lnl:          [SKIP][225] -> [ABORT][226] ([Intel XE#2421])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@core_hotunplug@hotunbind-rebind.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#1885]) -> [ABORT][228] ([Intel XE#2421])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@core_hotunplug@unbind-rebind.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@core_hotunplug@unbind-rebind.html
    - shard-lnl:          [SKIP][229] ([Intel XE#1885]) -> [ABORT][230] ([Intel XE#2421])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@core_hotunplug@unbind-rebind.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-5/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-lnl:          [SKIP][231] ([Intel XE#2423]) -> [SKIP][232] ([Intel XE#1466])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         [SKIP][233] ([Intel XE#1201]) -> [SKIP][234] ([Intel XE#1124] / [Intel XE#1201]) +8 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [SKIP][235] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][236] ([Intel XE#1201])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#316]) -> [SKIP][238] ([Intel XE#1201] / [Intel XE#316])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-lnl:          [SKIP][239] ([Intel XE#2351]) -> [SKIP][240] ([Intel XE#1407])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-5/igt@kms_big_fb@linear-32bpp-rotate-90.html
    - shard-adlp:         [SKIP][241] ([Intel XE#1201]) -> [SKIP][242] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-90.html
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#1201]) -> [SKIP][244] ([Intel XE#1201] / [Intel XE#316])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-lnl:          [DMESG-WARN][245] ([Intel XE#1725]) -> [SKIP][246] ([Intel XE#2351])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-1/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][248] ([Intel XE#316]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#316]) -> [SKIP][250] ([Intel XE#1201])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
    - shard-lnl:          [SKIP][251] ([Intel XE#1407]) -> [SKIP][252] ([Intel XE#2351])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [SKIP][253] ([Intel XE#1201]) -> [FAIL][254] ([Intel XE#1231])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-WARN][255] ([Intel XE#324]) -> [FAIL][256] ([Intel XE#1231])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-lnl:          [SKIP][257] ([Intel XE#1124]) -> [SKIP][258] ([Intel XE#2351]) +5 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-adlp:         [SKIP][259] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][260] ([Intel XE#1201]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#607]) -> [SKIP][262] ([Intel XE#1201] / [Intel XE#607])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#1201] / [Intel XE#610]) -> [SKIP][264] ([Intel XE#610]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][266] ([Intel XE#1124]) +5 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [SKIP][267] ([Intel XE#1201]) -> [FAIL][268] ([Intel XE#1874]) +2 other tests fail
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#1124]) -> [SKIP][270] ([Intel XE#1201]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#1124]) -> [SKIP][272] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-lnl:          [SKIP][273] ([Intel XE#2351]) -> [SKIP][274] ([Intel XE#1124]) +5 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][276] ([Intel XE#1201]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#1201]) -> [SKIP][278] ([Intel XE#1201] / [Intel XE#619])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-lnl:          [SKIP][279] ([Intel XE#2351]) -> [SKIP][280] ([Intel XE#1467])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-adlp:         [SKIP][281] ([Intel XE#1201]) -> [SKIP][282] ([Intel XE#1201] / [Intel XE#619])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_big_fb@yf-tiled-addfb.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#1201]) -> [SKIP][284] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_joiner@basic:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][286] ([Intel XE#346])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@kms_big_joiner@basic.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_big_joiner@basic.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-adlp:         [SKIP][287] ([Intel XE#1201]) -> [SKIP][288] ([Intel XE#1201] / [Intel XE#2191])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#1201] / [i915#2575]) -> [SKIP][290] ([Intel XE#1201] / [Intel XE#2191])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
    - shard-lnl:          [SKIP][291] ([Intel XE#2423]) -> [SKIP][292] ([Intel XE#2191])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][294] ([Intel XE#2191])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#1201] / [i915#2575]) -> [SKIP][296] ([Intel XE#1201] / [Intel XE#367])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
    - shard-adlp:         [SKIP][297] ([Intel XE#1201]) -> [SKIP][298] ([Intel XE#1201] / [Intel XE#367])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][300] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][302] ([Intel XE#367]) +2 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         [SKIP][303] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][304] ([Intel XE#1201]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][306] ([Intel XE#1201] / [i915#2575])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
    - shard-lnl:          [SKIP][307] ([Intel XE#367]) -> [SKIP][308] ([Intel XE#2423])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#367]) -> [SKIP][310] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#787]) -> [SKIP][312] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - shard-adlp:         [SKIP][313] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][314] ([Intel XE#1201]) +6 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-adlp:         [SKIP][315] ([Intel XE#1201]) -> [SKIP][316] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][318] ([Intel XE#1201]) +6 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#1201]) -> [SKIP][320] ([Intel XE#1252])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][322] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][324] ([Intel XE#1201]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#1201]) -> [SKIP][326] ([Intel XE#455] / [Intel XE#787])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#1201]) -> [SKIP][328] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-adlp:         [SKIP][329] ([Intel XE#1201]) -> [SKIP][330] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#1201]) -> [SKIP][332] ([Intel XE#1201] / [Intel XE#1252])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#1201]) -> [FAIL][334] ([Intel XE#616])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-lnl:          [SKIP][335] ([Intel XE#2351]) -> [SKIP][336] ([Intel XE#1399]) +8 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][338] ([Intel XE#787]) +55 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          [SKIP][339] ([Intel XE#1399]) -> [SKIP][340] ([Intel XE#2351]) +8 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][342] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-4.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][344] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][346] ([Intel XE#455] / [Intel XE#787])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-lnl:          [SKIP][347] ([Intel XE#2351]) -> [SKIP][348] ([Intel XE#314] / [Intel XE#599])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_cdclk@mode-transition.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         [SKIP][349] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][350] ([Intel XE#1201]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_chamelium_color@ctm-0-50.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@kms_chamelium_color@ctm-0-50.html
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][352] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#1201] / [i915#2575]) -> [SKIP][354] ([Intel XE#1201] / [Intel XE#306])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html
    - shard-lnl:          [SKIP][355] ([Intel XE#2423]) -> [SKIP][356] ([Intel XE#306])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_chamelium_color@ctm-0-75.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_chamelium_color@ctm-0-75.html
    - shard-adlp:         [SKIP][357] ([Intel XE#1201]) -> [SKIP][358] ([Intel XE#1201] / [Intel XE#306])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_chamelium_color@ctm-0-75.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-6/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          [SKIP][359] ([Intel XE#306]) -> [SKIP][360] ([Intel XE#2423]) +2 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_chamelium_color@ctm-blue-to-red.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_chamelium_color@ctm-blue-to-red.html
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#306]) -> [SKIP][362] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][364] ([Intel XE#306])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_chamelium_color@ctm-green-to-red.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#373]) -> [SKIP][366] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#1201] / [i915#2575]) -> [SKIP][368] ([Intel XE#373])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-adlp:         [SKIP][369] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][370] ([Intel XE#1201]) +4 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@kms_chamelium_frames@dp-crc-multiple.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_chamelium_frames@dp-crc-multiple.html
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][372] ([Intel XE#1201] / [i915#2575]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-multiple.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-crc-planes-random:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][374] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +1 other test skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-planes-random.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-planes-random.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#373]) -> [SKIP][376] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#1201] / [i915#2575]) -> [SKIP][378] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html
    - shard-lnl:          [SKIP][379] ([Intel XE#2423]) -> [SKIP][380] ([Intel XE#373]) +2 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd.html
    - shard-adlp:         [SKIP][381] ([Intel XE#1201]) -> [SKIP][382] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-lnl:          [SKIP][383] ([Intel XE#373]) -> [SKIP][384] ([Intel XE#2423]) +5 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#373]) -> [SKIP][386] ([Intel XE#1201] / [i915#2575])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][388] ([Intel XE#373]) +6 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#1201] / [i915#2575]) -> [FAIL][390] ([Intel XE#1178])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@kms_content_protection@atomic.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][392] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-lnl:          [SKIP][393] ([Intel XE#307]) -> [SKIP][394] ([Intel XE#2423])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-4/igt@kms_content_protection@dp-mst-lic-type-0.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-adlp:         [SKIP][395] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][396] ([Intel XE#1201])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-2/igt@kms_content_protection@dp-mst-lic-type-0.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][398] ([Intel XE#307])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#1201] / [i915#2575]) -> [FAIL][400] ([Intel XE#1204])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_content_protection@lic-type-0.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_content_protection@lic-type-0.html
    - shard-lnl:          [SKIP][401] ([Intel XE#2423]) -> [SKIP][402] ([Intel XE#599]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_content_protection@lic-type-0.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#308]) -> [SKIP][404] ([Intel XE#1201] / [Intel XE#308])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-lnl:          [SKIP][405] ([Intel XE#2423]) -> [SKIP][406] ([Intel XE#1413]) +1 other test skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#455]) -> [SKIP][408] ([Intel XE#1201] / [i915#2575])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-lnl:          [SKIP][409] ([Intel XE#1424]) -> [SKIP][410] ([Intel XE#2423])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-lnl:          [SKIP][411] ([Intel XE#2423]) -> [SKIP][412] ([Intel XE#1424])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#1201] / [i915#2575]) -> [SKIP][414] ([Intel XE#1201] / [Intel XE#308])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-adlp:         [SKIP][415] ([Intel XE#1201]) -> [SKIP][416] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-lnl:          [SKIP][417] ([Intel XE#2423]) -> [SKIP][418] ([Intel XE#309]) +2 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-adlp:         [SKIP][419] ([Intel XE#1201] / [Intel XE#309]) -> [SKIP][420] ([Intel XE#1201])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
    - shard-lnl:          [SKIP][421] ([Intel XE#309]) -> [SKIP][422] ([Intel XE#2423])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][424] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-lnl:          [SKIP][425] ([Intel XE#323]) -> [SKIP][426] ([Intel XE#2423]) +1 other test skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-adlp:         [SKIP][427] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][428] ([Intel XE#1201]) +1 other test skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-adlp:         [SKIP][429] ([Intel XE#1201]) -> [SKIP][430] ([Intel XE#1201] / [Intel XE#309]) +3 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#323]) -> [SKIP][432] ([Intel XE#1201] / [Intel XE#323])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][434] ([Intel XE#323])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#323]) -> [SKIP][436] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#307]) -> [SKIP][438] ([Intel XE#1201] / [Intel XE#307])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][439] ([i915#3804]) -> [SKIP][440] ([Intel XE#1201] / [i915#3804])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][442] ([Intel XE#1201] / [Intel XE#455])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-lnl:          [SKIP][443] ([Intel XE#2351]) -> [SKIP][444] ([Intel XE#599])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][446] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_feature_discovery@chamelium.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_feature_discovery@chamelium.html
    - shard-adlp:         [SKIP][447] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][448] ([Intel XE#1201])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_feature_discovery@chamelium.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-lnl:          [SKIP][449] ([Intel XE#2423]) -> [SKIP][450] ([Intel XE#1421])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-3/igt@kms_flip@2x-flip-vs-suspend.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_flip@2x-flip-vs-suspend.html
    - shard-adlp:         [SKIP][451] ([Intel XE#1201]) -> [SKIP][452] ([Intel XE#1201] / [Intel XE#310])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_flip@2x-flip-vs-suspend.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@kms_flip@2x-flip-vs-suspend.html
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#1201] / [i915#2575]) -> [DMESG-WARN][454] ([Intel XE#2019])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][455] ([Intel XE#2019]) -> [INCOMPLETE][456] ([Intel XE#1195] / [Intel XE#2019])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          [SKIP][457] ([Intel XE#1397] / [Intel XE#1745]) -> [SKIP][458] ([Intel XE#2351])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#1201]) -> [SKIP][460] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#455]) -> [SKIP][462] ([Intel XE#1201])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
    - shard-lnl:          [SKIP][463] ([Intel XE#1401] / [Intel XE#1745]) -> [SKIP][464] ([Intel XE#2351])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-lnl:          [SKIP][465] ([Intel XE#2351]) -> [SKIP][466] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          [SKIP][467] ([Intel XE#352]) -> [SKIP][468] ([Intel XE#2423])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-8/igt@kms_force_connector_basic@force-connector-state.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         [SKIP][469] ([Intel XE#1201]) -> [SKIP][470] ([Intel XE#1201] / [Intel XE#651]) +7 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#1201]) -> [SKIP][472] ([Intel XE#651]) +1 other test skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][474] ([Intel XE#651]) +1 other test skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#1201]) -> [SKIP][476] ([Intel XE#1201] / [Intel XE#651]) +10 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#651]) -> [SKIP][478] ([Intel XE#1201] / [Intel XE#651]) +13 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#651]) -> [SKIP][480] ([Intel XE#1201]) +1 other test skip
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-lnl:          [SKIP][481] ([Intel XE#656]) -> [SKIP][482] ([Intel XE#2351]) +18 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][484] ([Intel XE#1201] / [Intel XE#2351]) +7 other tests skip
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - shard-lnl:          [SKIP][485] ([Intel XE#2351]) -> [SKIP][486] ([Intel XE#651]) +6 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [FAIL][487] ([Intel XE#1861]) -> [SKIP][488] ([Intel XE#1201]) +1 other test skip
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         [SKIP][489] ([Intel XE#1201]) -> [SKIP][490] ([Intel XE#1201] / [Intel XE#656]) +24 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         [SKIP][491] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][492] ([Intel XE#1201]) +19 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][493] ([Intel XE#2351]) -> [SKIP][494] ([Intel XE#656]) +25 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-adlp:         [SKIP][495] ([Intel XE#1201]) -> [FAIL][496] ([Intel XE#1861])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         [SKIP][497] ([Intel XE#1201]) -> [SKIP][498] ([Intel XE#1151] / [Intel XE#1201])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#1201]) -> [SKIP][500] ([Intel XE#1201] / [Intel XE#2351]) +1 other test skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][502] ([Intel XE#651]) +17 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][504] ([Intel XE#1201]) +2 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][506] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][507] ([Intel XE#651]) -> [SKIP][508] ([Intel XE#1201] / [Intel XE#2351])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          [SKIP][509] ([Intel XE#651]) -> [SKIP][510] ([Intel XE#2351]) +3 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
    - shard-adlp:         [SKIP][511] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][512] ([Intel XE#1201]) +3 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:
    - shard-adlp:         [SKIP][513] ([Intel XE#1201]) -> [SKIP][514] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#1201]) -> [SKIP][516] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][517] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][518] ([Intel XE#1201]) +4 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][519] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][520] ([Intel XE#1201] / [Intel XE#2351]) +3 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][521] ([Intel XE#658]) -> [SKIP][522] ([Intel XE#1201] / [Intel XE#658])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         [SKIP][523] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][524] ([Intel XE#1201]) +4 other tests skip
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][525] ([Intel XE#653]) -> [SKIP][526] ([Intel XE#1201] / [Intel XE#2351])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][527] ([Intel XE#653]) -> [SKIP][528] ([Intel XE#1201] / [Intel XE#653]) +12 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][529] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][530] ([Intel XE#653]) +18 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][531] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][532] ([Intel XE#1201] / [Intel XE#653])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][533] ([Intel XE#1201]) -> [SKIP][534] ([Intel XE#653]) +2 other tests skip
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][535] ([Intel XE#653]) -> [SKIP][536] ([Intel XE#1201]) +1 other test skip
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][537] ([Intel XE#605]) -> [SKIP][538] ([Intel XE#1201] / [Intel XE#605])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-lnl:          [SKIP][539] ([Intel XE#2340]) -> [SKIP][540] ([Intel XE#2423])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_getfb@getfb2-accept-ccs.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_getfb@getfb2-accept-ccs.html
    - shard-adlp:         [SKIP][541] ([Intel XE#1201] / [Intel XE#1339]) -> [SKIP][542] ([Intel XE#1201])
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_getfb@getfb2-accept-ccs.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          [SKIP][543] ([Intel XE#599]) -> [SKIP][544] ([Intel XE#2423])
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-5/igt@kms_hdr@invalid-metadata-sizes.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-adlp:         [SKIP][545] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][546] ([Intel XE#1201]) +3 other tests skip
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@kms_hdr@invalid-metadata-sizes.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-adlp:         [SKIP][547] ([Intel XE#1201]) -> [SKIP][548] ([Intel XE#1201] / [Intel XE#356])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg2-set2:     [SKIP][549] ([Intel XE#1201] / [i915#2575]) -> [SKIP][550] ([Intel XE#356])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-lnl:          [SKIP][551] ([Intel XE#2423]) -> [SKIP][552] ([Intel XE#356])
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-adlp:         [SKIP][553] ([Intel XE#1201]) -> [SKIP][554] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_panel_fitting@legacy.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_panel_fitting@legacy.html
    - shard-dg2-set2:     [SKIP][555] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][556] ([Intel XE#1201] / [Intel XE#455])
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_panel_fitting@legacy.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [DMESG-WARN][557] ([Intel XE#1162]) -> [SKIP][558] ([Intel XE#1201] / [i915#2575])
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         [SKIP][559] ([Intel XE#1201]) -> [INCOMPLETE][560] ([Intel XE#1035] / [Intel XE#1195])
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_plane@pixel-format.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@kms_plane@pixel-format.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     [SKIP][561] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][562] ([Intel XE#455]) +18 other tests skip
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_plane_multiple@tiling-y.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][563] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][564] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][565] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][566] ([Intel XE#498]) +2 other tests skip
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][567] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][568] ([Intel XE#1201] / [i915#2575])
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
    - shard-lnl:          [SKIP][569] ([Intel XE#498]) -> [SKIP][570] ([Intel XE#2423])
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
    - shard-adlp:         [SKIP][571] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][572] ([Intel XE#1201])
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][573] ([Intel XE#1201] / [i915#2575]) -> [SKIP][574] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +5 other tests skip
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][575] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][576] ([Intel XE#2318] / [Intel XE#455])
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][577] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][578] ([Intel XE#2318]) +2 other tests skip
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][579] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][580] ([Intel XE#2318] / [Intel XE#455])
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-6.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-adlp:         [SKIP][581] ([Intel XE#1201]) -> [SKIP][582] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455])
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html
    - shard-dg2-set2:     [SKIP][583] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][584] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455])
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html
    - shard-lnl:          [SKIP][585] ([Intel XE#2423]) -> [SKIP][586] ([Intel XE#2318])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1:
    - shard-adlp:         [SKIP][587] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][588] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +4 other tests skip
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1:
    - shard-adlp:         [SKIP][589] ([Intel XE#1201]) -> [SKIP][590] ([Intel XE#1201] / [Intel XE#2318]) +14 other tests skip
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-lnl:          [SKIP][591] ([Intel XE#2318]) -> [SKIP][592] ([Intel XE#2423])
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][593] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][594] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +3 other tests skip
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][595] ([Intel XE#870]) -> [SKIP][596] ([Intel XE#1201] / [Intel XE#870])
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          [SKIP][597] ([Intel XE#1131]) -> [SKIP][598] ([Intel XE#2351])
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_pm_dc@dc5-dpms-negative.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][599] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][600] ([Intel XE#1129])
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][601] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][602] ([Intel XE#1489]) +1 other test skip
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][603] ([Intel XE#1201]) -> [SKIP][604] ([Intel XE#1201] / [Intel XE#1489])
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     [SKIP][605] ([Intel XE#1489]) -> [SKIP][606] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][607] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][608] ([Intel XE#1201])
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html
    - shard-lnl:          [SKIP][609] ([Intel XE#1128]) -> [SKIP][610] ([Intel XE#2351])
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_psr2_su@page_flip-nv12.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_psr2_su@page_flip-nv12.html
    - shard-adlp:         [SKIP][611] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][612] ([Intel XE#1201])
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_psr2_su@page_flip-nv12.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-lnl:          [SKIP][613] ([Intel XE#2351]) -> [SKIP][614] ([Intel XE#1406]) +1 other test skip
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_psr@fbc-pr-dpms.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-dg2-set2:     [SKIP][615] ([Intel XE#929]) -> [SKIP][616] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_psr@fbc-pr-no-drrs.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-dg2-set2:     [SKIP][617] ([Intel XE#1201]) -> [SKIP][618] ([Intel XE#929])
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_psr@fbc-psr-primary-blt.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-dg2-set2:     [SKIP][619] ([Intel XE#1201]) -> [SKIP][620] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-blt.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-blt.html
    - shard-adlp:         [SKIP][621] ([Intel XE#1201]) -> [SKIP][622] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_psr@fbc-psr2-primary-blt.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][623] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][624] ([Intel XE#1201]) +7 other tests skip
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][625] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][626] ([Intel XE#929]) +11 other tests skip
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_psr@pr-cursor-plane-onoff.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@pr-cursor-render:
    - shard-adlp:         [SKIP][627] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][628] ([Intel XE#1201]) +7 other tests skip
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_psr@pr-cursor-render.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_psr@pr-cursor-render.html
    - shard-lnl:          [SKIP][629] ([Intel XE#1406]) -> [SKIP][630] ([Intel XE#2351]) +1 other test skip
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_psr@pr-cursor-render.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_psr@pr-cursor-render.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][631] ([Intel XE#1201] / [Intel XE#2231]) -> [SKIP][632] ([Intel XE#1201] / [Intel XE#929])
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_psr@psr-primary-page-flip.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-adlp:         [SKIP][633] ([Intel XE#1201]) -> [SKIP][634] ([Intel XE#1149] / [Intel XE#1201])
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2-set2:     [SKIP][635] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][636] ([Intel XE#1149])
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         [SKIP][637] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][638] ([Intel XE#1201])
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         [FAIL][639] ([Intel XE#1874]) -> [SKIP][640] ([Intel XE#1201]) +2 other tests skip
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     [SKIP][641] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) -> [SKIP][642] ([Intel XE#1201] / [Intel XE#327])
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-270.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][643] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][644] ([Intel XE#327])
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][645] ([Intel XE#1201] / [i915#2575]) -> [SKIP][646] ([Intel XE#327]) +1 other test skip
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
    - shard-lnl:          [SKIP][647] ([Intel XE#2423]) -> [SKIP][648] ([Intel XE#1437]) +2 other tests skip
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][649] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][650] ([Intel XE#1127])
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         [SKIP][651] ([Intel XE#1201]) -> [SKIP][652] ([Intel XE#1201] / [Intel XE#327]) +2 other tests skip
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_rotation_crc@sprite-rotation-90.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-lnl:          [SKIP][653] ([Intel XE#2423]) -> [SKIP][654] ([Intel XE#1435])
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_setmode@basic-clone-single-crtc.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][655] ([Intel XE#1500]) -> [SKIP][656] ([Intel XE#1201] / [Intel XE#1500])
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2-set2:     [SKIP][657] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][658] ([Intel XE#1201] / [i915#2575])
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_vrr@flip-basic-fastset.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_vrr@flip-basic-fastset.html
    - shard-lnl:          [FAIL][659] -> [SKIP][660] ([Intel XE#2423])
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-4/igt@kms_vrr@flip-basic-fastset.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][661] ([Intel XE#455]) -> [SKIP][662] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_vrr@flipline.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_vrr@flipline.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2-set2:     [SKIP][663] ([Intel XE#1201] / [i915#2575]) -> [SKIP][664] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_vrr@seamless-rr-switch-virtual.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][665] ([Intel XE#756]) -> [SKIP][666] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension:
    - shard-adlp:         [SKIP][667] ([Intel XE#1201]) -> [SKIP][668] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488]) +1 other test skip
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@xe_ccs@block-copy-compressed-inc-dimension.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@xe_ccs@block-copy-compressed-inc-dimension.html

  * igt@xe_ccs@block-multicopy-inplace:
    - shard-adlp:         [SKIP][669] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488]) -> [SKIP][670] ([Intel XE#1201])
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@xe_ccs@block-multicopy-inplace.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@xe_ccs@block-multicopy-inplace.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][671] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][672] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt:
    - shard-dg2-set2:     [SKIP][673] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][674] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455])
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@xe_compute_preempt@compute-threadgroup-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][675] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][676] ([Intel XE#1123])
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-adlp:         [SKIP][677] ([Intel XE#1201]) -> [SKIP][678] ([Intel XE#1123] / [Intel XE#1201])
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@xe_copy_basic@mem-copy-linear-0xfd.html
    - shard-dg2-set2:     [SKIP][679] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][680] ([Intel XE#1123])
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         [SKIP][681] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][682] ([Intel XE#1201])
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0x369.html
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][683] ([Intel XE#1126]) -> [SKIP][684] ([Intel XE#1126] / [Intel XE#1201])
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][685] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][686] ([Intel XE#1130] / [Intel XE#1201])
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html
    - shard-adlp:         [SKIP][687] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][688] ([Intel XE#1130] / [Intel XE#1201])
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-lnl:          [SKIP][689] ([Intel XE#1130]) -> [SKIP][690] ([Intel XE#688]) +3 other tests skip
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@xe_evict@evict-beng-large-external-cm.html
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@xe_evict@evict-beng-large-external-cm.html
    - shard-adlp:         [SKIP][691] ([Intel XE#1201]) -> [SKIP][692] ([Intel XE#1201] / [Intel XE#261]) +1 other test skip
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@xe_evict@evict-beng-large-external-cm.html
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-adlp:         [SKIP][693] ([Intel XE#1201] / [Intel XE#261]) -> [SKIP][694] ([Intel XE#1201]) +4 other tests skip
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@xe_evict@evict-large-multi-vm-cm.html
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@xe_evict@evict-large-multi-vm-cm.html
    - shard-dg2-set2:     [FAIL][695] ([Intel XE#1600]) -> [SKIP][696] ([Intel XE#1130] / [Intel XE#1201])
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][697] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][698] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - shard-adlp:         [SKIP][699] ([Intel XE#1201]) -> [SKIP][700] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@xe_evict@evict-mixed-threads-small-multi-vm.html
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-lnl:          [SKIP][701] ([Intel XE#688]) -> [SKIP][702] ([Intel XE#1130]) +5 other tests skip
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-6/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
    - shard-adlp:         [SKIP][703] ([Intel XE#1201] / [Intel XE#688]) -> [SKIP][704] ([Intel XE#1201])
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-adlp:         [SKIP][705] ([Intel XE#1201]) -> [SKIP][706] ([Intel XE#1201] / [Intel XE#688])
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate-race:
    - shard-adlp:         [DMESG-WARN][707] ([Intel XE#2226]) -> [SKIP][708] ([Intel XE#1201]) +1 other test skip
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate-race.html
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate-race.html

  * igt@xe_exec_balancer@twice-virtual-userptr:
    - shard-adlp:         [DMESG-WARN][709] ([Intel XE#2226]) -> [SKIP][710] ([Intel XE#1130] / [Intel XE#1201]) +1 other test skip
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@xe_exec_balancer@twice-virtual-userptr.html
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@xe_exec_balancer@twice-virtual-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-lnl:          [SKIP][711] ([Intel XE#1130]) -> [SKIP][712] ([Intel XE#1392]) +2 other tests skip
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
    - shard-adlp:         [SKIP][713] ([Intel XE#1201]) -> [SKIP][714] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         [SKIP][715] ([Intel XE#1201] / [Intel XE#1392]) -> [SKIP][716] ([Intel XE#1201]) +2 other tests skip
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-lnl:          [SKIP][717] ([Intel XE#1392]) -> [SKIP][718] ([Intel XE#1130]) +2 other tests skip
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:
    - shard-dg2-set2:     [SKIP][719] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][720] ([Intel XE#288]) +15 other tests skip
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-adlp:         [SKIP][721] ([Intel XE#1201]) -> [SKIP][722] ([Intel XE#1201] / [Intel XE#288]) +5 other tests skip
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
    - shard-dg2-set2:     [SKIP][723] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][724] ([Intel XE#288]) +3 other tests skip
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@once-basic-imm:
    - shard-dg2-set2:     [SKIP][725] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][726] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@xe_exec_fault_mode@once-basic-imm.html
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@xe_exec_fault_mode@once-basic-imm.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][727] ([Intel XE#288]) -> [SKIP][728] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate:
    - shard-adlp:         [SKIP][729] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][730] ([Intel XE#1201]) +13 other tests skip
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-2/igt@xe_exec_fault_mode@once-userptr-invalidate.html
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@xe_exec_fault_mode@once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - shard-adlp:         [SKIP][731] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][732] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][733] ([Intel XE#288]) -> [SKIP][734] ([Intel XE#1130] / [Intel XE#1201]) +1 other test skip
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-adlp:         [SKIP][735] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][736] ([Intel XE#1130] / [Intel XE#1201]) +2 other tests skip
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][737] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][738] ([Intel XE#1130] / [Intel XE#1201]) +14 other tests skip
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][739] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][740] ([Intel XE#2360])
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-adlp:         [SKIP][741] ([Intel XE#1201]) -> [SKIP][742] ([Intel XE#1201] / [Intel XE#2360])
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
    - shard-dg2-set2:     [SKIP][743] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][744] ([Intel XE#1201] / [Intel XE#2360])
   [743]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [744]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
    - shard-lnl:          [SKIP][745] ([Intel XE#1130]) -> [FAIL][746] ([Intel XE#2343])
   [745]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [746]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         [SKIP][747] ([Intel XE#1201]) -> [DMESG-WARN][748] ([Intel XE#358])
   [747]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@xe_exec_reset@cat-error.html
   [748]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@xe_exec_reset@cat-error.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         [SKIP][749] ([Intel XE#1130] / [Intel XE#1201]) -> [DMESG-FAIL][750] ([Intel XE#1962])
   [749]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.html
   [750]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_exec_threads@threads-mixed-rebind:
    - shard-adlp:         [SKIP][751] ([Intel XE#1201]) -> [DMESG-WARN][752] ([Intel XE#2226])
   [751]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@xe_exec_threads@threads-mixed-rebind.html
   [752]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@xe_exec_threads@threads-mixed-rebind.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     [SKIP][753] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][754] ([Intel XE#378])
   [753]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@xe_module_load@force-load.html
   [754]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_module_load@force-load.html

  * igt@xe_oa@non-system-wide-paranoid:
    - shard-dg2-set2:     [SKIP][755] ([Intel XE#1201] / [Intel XE#2419]) -> [SKIP][756] ([Intel XE#2419]) +2 other tests skip
   [755]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@xe_oa@non-system-wide-paranoid.html
   [756]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_oa@non-system-wide-paranoid.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-dg2-set2:     [SKIP][757] ([Intel XE#2419]) -> [SKIP][758] ([Intel XE#1201] / [Intel XE#2419]) +5 other tests skip
   [757]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@xe_oa@unprivileged-single-ctx-counters.html
   [758]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][759] ([Intel XE#1173]) -> [SKIP][760] ([Intel XE#1061] / [Intel XE#1201])
   [759]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@xe_peer2peer@read.html
   [760]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][761] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][762] ([Intel XE#1130] / [Intel XE#1201])
   [761]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@xe_pm@d3cold-mmap-system.html
   [762]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@xe_pm@d3cold-mmap-system.html
    - shard-lnl:          [SKIP][763] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][764] ([Intel XE#1130])
   [763]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-3/igt@xe_pm@d3cold-mmap-system.html
   [764]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@xe_pm@d3cold-mmap-system.html
    - shard-adlp:         [SKIP][765] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][766] ([Intel XE#1130] / [Intel XE#1201])
   [765]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@xe_pm@d3cold-mmap-system.html
   [766]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][767] ([Intel XE#2284]) -> [SKIP][768] ([Intel XE#1201] / [Intel XE#2284])
   [767]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@xe_pm@d3cold-mocs.html
   [768]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     [SKIP][769] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][770] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [769]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html
   [770]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][771] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][772] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [771]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [772]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [SKIP][773] ([Intel XE#1130] / [Intel XE#1201]) -> [DMESG-WARN][774] ([Intel XE#569])
   [773]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html
   [774]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@xe_pm@s3-vm-bind-prefetch.html
    - shard-lnl:          [SKIP][775] ([Intel XE#1130]) -> [SKIP][776] ([Intel XE#584])
   [775]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-1/igt@xe_pm@s3-vm-bind-prefetch.html
   [776]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-2/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][777] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][778] ([Intel XE#944]) +1 other test skip
   [777]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@xe_query@multigpu-query-cs-cycles.html
   [778]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][779] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][780] ([Intel XE#944])
   [779]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@xe_query@multigpu-query-engines.html
   [780]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_query@multigpu-query-engines.html
    - shard-lnl:          [SKIP][781] ([Intel XE#1130]) -> [SKIP][782] ([Intel XE#944]) +1 other test skip
   [781]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@xe_query@multigpu-query-engines.html
   [782]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][783] ([Intel XE#944]) -> [SKIP][784] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [783]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html
   [784]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         [SKIP][785] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][786] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [785]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@xe_query@multigpu-query-invalid-extension.html
   [786]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@xe_query@multigpu-query-invalid-extension.html
    - shard-dg2-set2:     [SKIP][787] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][788] ([Intel XE#1201] / [Intel XE#944])
   [787]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html
   [788]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][789] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][790] ([Intel XE#1130] / [Intel XE#1201])
   [789]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [790]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-huc.html
    - shard-lnl:          [SKIP][791] ([Intel XE#944]) -> [SKIP][792] ([Intel XE#1130])
   [791]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [792]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html
    - shard-adlp:         [SKIP][793] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][794] ([Intel XE#1130] / [Intel XE#1201])
   [793]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [794]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
  [Intel XE#1962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2058]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2058
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2256
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419
  [Intel XE#2421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
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
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_7943 -> IGT_7944
  * Linux: xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90 -> xe-pw-136731v1

  IGT_7943: 62b91f7a3a3eb9855fb656dc6971242d0d638e7d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7944: 7944
  xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90: 4a4602971578bb1ed5b64078f758dff3034b6b90
  xe-pw-136731v1: 136731v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/index.html

--===============8731386029094995409==
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
<tr><td><b>Series:</b></td><td>drm/xe: Write all slices if its mcr register</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136731/">https://patchwork.freedesktop.org/series/136731/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90_full -&gt; xe-pw-136731v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136731v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136731v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136731v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_setmaster@master-drop-set-shared-fd:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-1/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136731v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-6/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_content_protection@atomic@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x128:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +8 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +16 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_flip@blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_hdmi_inject@inject-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +75 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>) +3 other tests warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_psr@psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_psr@psr2-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_psr@psr2-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-3/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-6/igt@xe_evict@evict-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@xe_evict@evict-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-bind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-6/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@xe_exec_fault_mode@many-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@xe_exec_fault_mode@many-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +78 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343">Intel XE#2343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-2/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@xe_pm@s2idle-d3hot-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-5/igt@xe_pm@s3-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@xe_pm@s4-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +64 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration-with-preempter:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-one-bo-many-times:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@xe_vm@bind-one-bo-many-times.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@xe_vm@bind-one-bo-many-times.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-134217728:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@xe_vm@large-split-binds-134217728.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-6/igt@core_hotunplug@hotreplug-lateclose.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@fbdev@write.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-3/igt@fbdev@write.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-2/igt@fbdev@write.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +28 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_cursor_edge_walk@256x256-right-edge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_cursor_edge_walk@256x256-right-edge.html">PASS</a> +32 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> +27 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@page-flip-implicit-plane:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@kms_lease@page-flip-implicit-plane.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_lease@page-flip-implicit-plane.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">PASS</a> +31 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-5/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-6/igt@kms_plane@plane-position-hole.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2058">Intel XE#2058</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@kms_pm_dc@dc5-dpms.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> +97 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@kms_properties@crtc-properties-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_properties@crtc-properties-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-8/igt@kms_psr@psr-suspend@edp-1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_psr@psr-suspend@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-180.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_vrr@max-min@pipe-a-edp-1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_vrr@max-min@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-many:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@xe_dma_buf_sync@export-dma-buf-many.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@xe_dma_buf_sync@export-dma-buf-many.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate.html">PASS</a> +85 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@xe_exec_basic@once-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@xe_exec_basic@once-basic-defer-mmap.html">PASS</a> +96 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@xe_exec_basic@twice-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@xe_exec_basic@twice-basic-defer-mmap.html">PASS</a> +28 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@xe_exec_threads@threads-hang-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@xe_exec_threads@threads-hang-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@xe_gt_freq@freq_fixed_exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2256">Intel XE#2256</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@xe_gt_freq@freq_fixed_exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@xe_spin_batch@spin-fixed-duration.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@core_hotunplug@hotunbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>) +1 other test abort</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@core_hotunplug@hotunbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-5/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-5/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-1/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_big_fb@linear-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-6/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-planes-random:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +5 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-4/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-2/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-7/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-3/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-8/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339">Intel XE#1339</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-5/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_plane@pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131">Intel XE#1131</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_psr@fbc-psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_psr@fbc-psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_psr@pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@kms_psr@pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_psr@pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@kms_psr@pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_rotation_crc@multiplane-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-7/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-4/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@xe_ccs@block-copy-compressed-inc-dimension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@xe_ccs@block-copy-compressed-inc-dimension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@xe_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@xe_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@xe_compute_preempt@compute-threadgroup-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@xe_evict@evict-beng-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@xe_evict@evict-beng-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@xe_evict@evict-beng-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@xe_evict@evict-beng-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-6/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-6/igt@xe_exec_balancer@twice-virtual-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@xe_exec_balancer@twice-virtual-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@xe_exec_fault_mode@once-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@xe_exec_fault_mode@once-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-2/igt@xe_exec_fault_mode@once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@xe_exec_fault_mode@once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343">Intel XE#2343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@xe_exec_reset@cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-2/igt@xe_exec_reset@cat-error.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-9/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962">Intel XE#1962</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-9/igt@xe_exec_threads@threads-mixed-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@xe_exec_threads@threads-mixed-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@xe_oa@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_oa@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-434/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-433/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-3/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-3/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-4/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-463/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-1/igt@xe_pm@s3-vm-bind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-2/igt@xe_pm@s3-vm-bind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-435/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-463/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-432/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-7/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-4/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-436/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-1/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-435/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-lnl-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-lnl-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90/shard-adlp-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136731v1/shard-adlp-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7943 -&gt; IGT_7944</li>
<li>Linux: xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90 -&gt; xe-pw-136731v1</li>
</ul>
<p>IGT_7943: 62b91f7a3a3eb9855fb656dc6971242d0d638e7d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7944: 7944<br />
  xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90: 4a4602971578bb1ed5b64078f758dff3034b6b90<br />
  xe-pw-136731v1: 136731v1</p>

</body>
</html>

--===============8731386029094995409==--
