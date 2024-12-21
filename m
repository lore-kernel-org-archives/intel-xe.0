Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90F7E77184
	for <intel-xe@archiver.kernel.org>; Sat, 21 Dec 2024 12:36:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFE010E18C;
	Sat, 21 Dec 2024 12:36:42 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F4810E185;
 Sat, 21 Dec 2024 12:36:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8634208136681458731=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/display=3A_handle?=
 =?utf-8?q?_hdmi_connector_init_failures=2C_and_no_HDMI/DP_cases_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 21 Dec 2024 12:36:41 -0000
Message-ID: <173478460153.1207415.1403759763266596156@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1734099220.git.jani.nikula@intel.com>
In-Reply-To: <cover.1734099220.git.jani.nikula@intel.com>
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

--===============8634208136681458731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: handle hdmi connector init failures, and no HDMI/DP cases (rev3)
URL   : https://patchwork.freedesktop.org/series/142118/
State : failure

== Summary ==

CI Bug Log - changes from xe-2411-187726fb12b41cc501b62ee8e42946403083076c_full -> xe-pw-142118v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142118v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142118v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142118v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-lnl:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-3/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_flip@2x-busy-flip@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][2] -> [INCOMPLETE][3] +2 other tests incomplete
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-436/igt@kms_flip@2x-busy-flip@bd-hdmi-a6-dp4.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-435/igt@kms_flip@2x-busy-flip@bd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp5:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@c-dp5.html

  * igt@kms_flip@flip-vs-suspend@c-dp2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-dp2.html

  * igt@kms_histogram@algo-basic:
    - shard-bmg:          NOTRUN -> [SKIP][6] +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-7/igt@kms_histogram@algo-basic.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-lnl:          [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-vram01-vram01:
    - shard-bmg:          NOTRUN -> [FAIL][9] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-vram01-vram01.html

  * igt@xe_exec_reset@close-fd:
    - shard-adlp:         [PASS][10] -> [DMESG-WARN][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-3/igt@xe_exec_reset@close-fd.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-4/igt@xe_exec_reset@close-fd.html

  * igt@xe_pm@s2idle-mocs:
    - shard-bmg:          [PASS][12] -> [INCOMPLETE][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-5/igt@xe_pm@s2idle-mocs.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s3-mocs:
    - shard-bmg:          [PASS][14] -> [FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-8/igt@xe_pm@s3-mocs.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@xe_pm@s3-mocs.html

  
#### Warnings ####

  * igt@xe_ccs@suspend-resume:
    - shard-bmg:          [INCOMPLETE][16] ([Intel XE#2771]) -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-7/igt@xe_ccs@suspend-resume.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@xe_ccs@suspend-resume.html

  
Known issues
------------

  Here are the changes found in xe-pw-142118v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [PASS][18] -> [DMESG-WARN][19] ([Intel XE#1033]) +2 other tests dmesg-warn
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-1/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          NOTRUN -> [FAIL][20] ([Intel XE#3719]) +3 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2327]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#316]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][23] ([Intel XE#1033])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1124]) +5 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][25] -> [DMESG-FAIL][26] ([Intel XE#1033]) +13 other tests dmesg-fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1124]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#1124]) +10 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1124]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#367]) +4 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#367])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1512])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#2887]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2887]) +12 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#3432])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#3432])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#787]) +5 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#787]) +94 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#455] / [Intel XE#787]) +29 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][42] -> [INCOMPLETE][43] ([Intel XE#1727])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][44] -> [INCOMPLETE][45] ([Intel XE#1727] / [Intel XE#3113])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2652] / [Intel XE#787]) +17 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-5:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1152]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_cdclk@plane-scaling@pipe-b-dp-5.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2325]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-8/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#306])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-7/igt@kms_chamelium_color@ctm-negative.html
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#306])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#306])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-463/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2252]) +10 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#373]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-2/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#373]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-6/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2390]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#455]) +7 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@kms_content_protection@legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#3278]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-2/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          NOTRUN -> [FAIL][58] ([Intel XE#1178]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-3/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          NOTRUN -> [FAIL][59] ([Intel XE#1188]) +1 other test fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2320]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1424])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-5/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2321]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#323])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2286])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#323])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#323])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2-set2:     [PASS][67] -> [INCOMPLETE][68] ([Intel XE#3226])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2291])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-lnl:          [PASS][70] -> [FAIL][71] ([Intel XE#1475])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#1508])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#3070])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2244]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#2244])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#776])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@kms_fbcon_fbt@psr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#776])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-435/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][79] -> [FAIL][80] ([Intel XE#3321])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][81] -> [FAIL][82] ([Intel XE#2882])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1421]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-7/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][84] ([Intel XE#2635])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#2316]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-5/igt@kms_flip@2x-plain-flip-interruptible.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#310]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][88] ([Intel XE#301])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp5.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][89] ([Intel XE#3321]) +2 other tests fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp5.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     [PASS][90] -> [FAIL][91] ([Intel XE#301]) +2 other tests fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][92] ([Intel XE#3149])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp5.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][93] ([Intel XE#2597])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][94] -> [INCOMPLETE][95] ([Intel XE#2597]) +1 other test incomplete
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-dg2-set2:     [PASS][96] -> [INCOMPLETE][97] ([Intel XE#2049] / [Intel XE#2597])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1401] / [Intel XE#1745])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1401])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#455]) +6 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2293] / [Intel XE#2380]) +5 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][102] -> [DMESG-FAIL][103] ([Intel XE#1033] / [Intel XE#324]) +1 other test dmesg-fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2293]) +5 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-dg2-set2:     [PASS][105] -> [INCOMPLETE][106] ([Intel XE#2049])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-463/igt@kms_flip_tiling@flip-change-tiling.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-436/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#651]) +7 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#651]) +4 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2311]) +33 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [FAIL][110] ([Intel XE#2333]) +15 other tests fail
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2312]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#651]) +5 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#656]) +11 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2313]) +32 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#653]) +6 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#653]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2352]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#656]) +4 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#3374] / [Intel XE#3544])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][120] -> [SKIP][121] ([Intel XE#1503])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#346])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#356])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#356])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#599])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2493])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#2763]) +7 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2763]) +14 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2938])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#870]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][131] -> [FAIL][132] ([Intel XE#718])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2505])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1439] / [Intel XE#3141])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#2893]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#1489]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#1489])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#1489]) +7 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2234] / [Intel XE#2850]) +17 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#1406])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-4/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-8/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#2414])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#3414])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#3414]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2330]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#3414]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#2413]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#1435])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#2426])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#2450])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@disable-primary-vs-flip:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][152] ([Intel XE#877]) +2 other tests dmesg-warn
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-8/igt@kms_universal_plane@disable-primary-vs-flip.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [PASS][153] -> [DMESG-WARN][154] ([Intel XE#2953]) +1 other test dmesg-warn
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#1499])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-adlp:         NOTRUN -> [SKIP][156] ([Intel XE#2168])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-1/igt@kms_vrr@lobf.html
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#1499])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-2/igt@kms_vrr@lobf.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#1123])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-adlp:         NOTRUN -> [SKIP][159] ([Intel XE#1126])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-connect:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#2905]) +5 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-3/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#2905]) +11 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#3889])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug@discovery-empty:
    - shard-adlp:         NOTRUN -> [SKIP][163] ([Intel XE#2905]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-2/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#2905]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-463/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#688]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-8/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          NOTRUN -> [TIMEOUT][166] ([Intel XE#1473])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          NOTRUN -> [TIMEOUT][167] ([Intel XE#1473] / [Intel XE#2472])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-7/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#1392]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#2322]) +9 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:
    - shard-adlp:         NOTRUN -> [SKIP][170] ([Intel XE#288]) +6 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#288]) +4 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#1416])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-3/igt@xe_mmap@vram.html
    - shard-adlp:         NOTRUN -> [SKIP][173] ([Intel XE#1008])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-8/igt@xe_mmap@vram.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196]) -> ([PASS][197], [SKIP][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221]) ([Intel XE#2457])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-5/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-1/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-5/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-3/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-3/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-3/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-3/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-3/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-1/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-1/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-7/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-4/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-4/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-7/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-4/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-4/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-5/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-5/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-8/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-8/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-1/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-8/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-8/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-7/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-3/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-3/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-3/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-6/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-6/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-8/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-8/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-8/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-7/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246]) -> ([PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [SKIP][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272]) ([Intel XE#378])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-434/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-463/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-434/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-434/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-463/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-466/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-463/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-463/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-466/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-466/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-466/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-463/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-466/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-434/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-463/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-434/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-435/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-436/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-436/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-436/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-436/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-435/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-435/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-435/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-435/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-436/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-463/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-434/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-435/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-434/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-436/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-435/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-463/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-436/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-463/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-434/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-434/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-436/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-435/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-463/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-436/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-435/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-435/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-463/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-434/igt@xe_module_load@load.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][273] ([Intel XE#2248])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][274] ([Intel XE#2541] / [Intel XE#3573])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-435/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_oa@syncs-ufence-wait:
    - shard-adlp:         NOTRUN -> [SKIP][275] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-4/igt@xe_oa@syncs-ufence-wait.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][276] ([Intel XE#977])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-8/igt@xe_pat@pat-index-xelp.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][277] ([Intel XE#1173]) +1 other test fail
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-436/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][278] ([Intel XE#2427])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-8/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          NOTRUN -> [SKIP][279] ([Intel XE#2284])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][280] ([Intel XE#2284] / [Intel XE#366])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-basic:
    - shard-adlp:         [PASS][281] -> [DMESG-WARN][282] ([Intel XE#2953] / [Intel XE#569])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-6/igt@xe_pm@s3-basic.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][283] ([Intel XE#2284] / [Intel XE#366])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-1/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][284] -> [ABORT][285] ([Intel XE#1358] / [Intel XE#1607])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-8/igt@xe_pm@s4-exec-after.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][286] -> [ABORT][287] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-bmg:          [PASS][288] -> [INCOMPLETE][289] ([Intel XE#3088])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-3/igt@xe_pm_residency@cpg-basic.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_query@multigpu-query-config:
    - shard-adlp:         NOTRUN -> [SKIP][290] ([Intel XE#944]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-4/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-lnl:          NOTRUN -> [SKIP][291] ([Intel XE#944]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     NOTRUN -> [SKIP][292] ([Intel XE#944]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-434/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          NOTRUN -> [SKIP][293] ([Intel XE#944]) +2 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-7/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          NOTRUN -> [SKIP][294] ([Intel XE#3342])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][295] ([Intel XE#1033]) -> [PASS][296] +3 other tests pass
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][297] ([Intel XE#3862]) -> [PASS][298]
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][299] ([Intel XE#877]) -> [PASS][300]
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][301] ([Intel XE#2882]) -> [PASS][302] +4 other tests pass
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][303] ([Intel XE#3321]) -> [PASS][304] +2 other tests pass
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][305] -> [PASS][306]
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-dp2-hdmi-a3.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
    - shard-dg2-set2:     [FAIL][307] ([Intel XE#301]) -> [PASS][308] +5 other tests pass
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     [FAIL][309] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][310]
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [FAIL][311] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][312]
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1:
    - shard-lnl:          [FAIL][313] ([Intel XE#886]) -> [PASS][314] +2 other tests pass
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-adlp:         [DMESG-FAIL][315] ([Intel XE#1033] / [Intel XE#324]) -> [PASS][316] +1 other test pass
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [DMESG-FAIL][317] ([Intel XE#1033]) -> [PASS][318] +8 other tests pass
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][319] ([Intel XE#1874]) -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-2/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-3/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-lnl:          [FAIL][321] -> [PASS][322] +1 other test pass
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][323] ([Intel XE#2883]) -> [PASS][324] +6 other tests pass
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-3/igt@kms_setmode@basic.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-8/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][325] ([Intel XE#2883]) -> [PASS][326] +2 other tests pass
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-6/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][327] ([Intel XE#899]) -> [PASS][328]
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][329] ([Intel XE#2159]) -> [PASS][330] +1 other test pass
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_drm_fdinfo@parallel-utilization-single-idle:
    - shard-adlp:         [FAIL][331] ([Intel XE#3869]) -> [PASS][332]
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-2/igt@xe_drm_fdinfo@parallel-utilization-single-idle.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-3/igt@xe_drm_fdinfo@parallel-utilization-single-idle.html

  * igt@xe_exec_basic@no-exec-null:
    - shard-adlp:         [DMESG-WARN][333] ([Intel XE#2953]) -> [PASS][334] +7 other tests pass
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-8/igt@xe_exec_basic@no-exec-null.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-2/igt@xe_exec_basic@no-exec-null.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [ABORT][335] ([Intel XE#1794]) -> [PASS][336]
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_spin_batch@spin-timestamp-check@engine-drm_xe_engine_class_video_enhance:
    - shard-dg2-set2:     [INCOMPLETE][337] -> [PASS][338] +1 other test pass
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-463/igt@xe_spin_batch@spin-timestamp-check@engine-drm_xe_engine_class_video_enhance.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-463/igt@xe_spin_batch@spin-timestamp-check@engine-drm_xe_engine_class_video_enhance.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          [FAIL][339] ([Intel XE#2333]) -> [SKIP][340] ([Intel XE#2312]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][341] ([Intel XE#2311]) -> [SKIP][342] ([Intel XE#2312])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][343] ([Intel XE#2313]) -> [SKIP][344] ([Intel XE#2312]) +3 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#362]) -> [FAIL][346] ([Intel XE#1729])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01:
    - shard-bmg:          [INCOMPLETE][347] -> [FAIL][348] ([Intel XE#3664])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-7/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][349], [PASS][350], [SKIP][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360], [PASS][361], [PASS][362], [PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374]) ([Intel XE#378]) -> ([PASS][375], [PASS][376], [PASS][377], [PASS][378], [PASS][379], [PASS][380], [PASS][381], [PASS][382], [PASS][383], [PASS][384], [PASS][385], [PASS][386], [PASS][387], [PASS][388], [PASS][389], [PASS][390], [PASS][391], [PASS][392], [PASS][393], [DMESG-WARN][394], [PASS][395], [PASS][396], [SKIP][397], [PASS][398], [PASS][399], [PASS][400]) ([Intel XE#2953] / [Intel XE#378])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-3/igt@xe_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-1/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-2/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-1/igt@xe_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-3/igt@xe_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-2/igt@xe_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-2/igt@xe_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-1/igt@xe_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-1/igt@xe_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-8/igt@xe_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-8/igt@xe_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-6/igt@xe_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-6/igt@xe_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-3/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-3/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-6/igt@xe_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-9/igt@xe_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-9/igt@xe_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-9/igt@xe_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-9/igt@xe_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-2/igt@xe_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-4/igt@xe_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-4/igt@xe_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-4/igt@xe_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-6/igt@xe_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-8/igt@xe_module_load@load.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@xe_module_load@load.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-2/igt@xe_module_load@load.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-2/igt@xe_module_load@load.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-3/igt@xe_module_load@load.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-3/igt@xe_module_load@load.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-3/igt@xe_module_load@load.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-3/igt@xe_module_load@load.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-4/igt@xe_module_load@load.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-1/igt@xe_module_load@load.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-1/igt@xe_module_load@load.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-9/igt@xe_module_load@load.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-9/igt@xe_module_load@load.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-4/igt@xe_module_load@load.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-1/igt@xe_module_load@load.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-1/igt@xe_module_load@load.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@xe_module_load@load.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@xe_module_load@load.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-8/igt@xe_module_load@load.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-2/igt@xe_module_load@load.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-2/igt@xe_module_load@load.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-8/igt@xe_module_load@load.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-8/igt@xe_module_load@load.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@xe_module_load@load.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-8/igt@xe_module_load@load.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-4/igt@xe_module_load@load.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@xe_module_load@load.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [ABORT][401] ([Intel XE#3421]) -> [ABORT][402] ([Intel XE#3765])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-3/igt@xe_wedged@wedged-at-any-timeout.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-6/igt@xe_wedged@wedged-at-any-timeout.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2771
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#3088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#3664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3664
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3765]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3765
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3869]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3869
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * IGT: IGT_8167 -> IGT_8168
  * Linux: xe-2411-187726fb12b41cc501b62ee8e42946403083076c -> xe-pw-142118v3

  IGT_8167: 6e93c2e807b398f24673d010f3f71986a09fef8f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8168: ecb4351581b3ca4be76ee3c8842603be69931401 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2411-187726fb12b41cc501b62ee8e42946403083076c: 187726fb12b41cc501b62ee8e42946403083076c
  xe-pw-142118v3: 142118v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/index.html

--===============8634208136681458731==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: handle hdmi connector init=
 failures, and no HDMI/DP cases (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142118/">https://patchwork.freedesktop.org/series/142118/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142118v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142118v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2411-187726fb12b41cc501b62ee8e42946403=
083076c_full -&gt; xe-pw-142118v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142118v3_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-142118v3_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1421=
18v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-3/igt@core_hotunplug@hotreplug-late=
close.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-436/igt@kms_fl=
ip@2x-busy-flip@bd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-435/igt@kms_flip@2x-=
busy-flip@bd-hdmi-a6-dp4.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_flip@flip-vs-suspend-in=
terruptible@c-dp5.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-dp=
2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_histogram@algo-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-7/igt@kms_histogram@algo-basic.html=
">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-lnl-8/igt@kms_psr@=
fbc-psr2-cursor-plane-onoff.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-3/igt@kms_psr@fbc-psr2-=
cursor-plane-onoff.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@xe_ccs@suspend-resume@xmajor-=
compressed-compfmt0-vram01-vram01.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-fd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-3/igt@xe_exec=
_reset@close-fd.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-4/igt@xe_exec_reset@close-fd.html"=
>DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-5/igt@xe_pm@s2=
idle-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-142118v3/shard-bmg-1/igt@xe_pm@s2idle-mocs.html">INCOMPLETE<=
/a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-8/igt@xe_pm@s3=
-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142118v3/shard-bmg-1/igt@xe_pm@s3-mocs.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_ccs@suspend-resume:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-7/igt@xe_ccs@s=
uspend-resume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2771">Intel XE#2771</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@xe_ccs@susp=
end-resume.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142118v3_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-9/igt@kms_asy=
nc_flips@async-flip-suspend-resume.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-1/igt@kms_async=
_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +2 othe=
r tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-5/igt@kms_async_flips@async-flip-wi=
th-page-flip-events-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3719">Intel XE#3719</a>) +3 other tests fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip-async-flip.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-6/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-a=
dlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1033">Intel XE#1033</a>) +13 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-s=
tride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-3/igt@kms_big_fb@yf-tiled-64bpp-ro=
tate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_bw@connected-linear-tilin=
g-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_bw@linear-tiling-1-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@kms_bw@linear-tiling-4-displ=
ays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-8/igt@kms_bw@linear-tiling-4-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-8/igt@kms_ccs@ccs-on-another-bo-4-t=
iled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-=
180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +12 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-=
y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tes=
ts skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-2/igt@kms_ccs@crc-primary-suspend-=
y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +94 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +29 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg=
2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-8/igt@kms_chamelium_color@ctm-0-50.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-7/igt@kms_chamelium_color@ctm-negat=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/306">Intel XE#306</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@kms_chamelium_color@ctm-nega=
tive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-463/igt@kms_chamelium_color@degamma=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-re=
solution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-2/igt@kms_chamelium_frames@vga-fra=
me-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-6/igt@kms_chamelium_hpd@vga-hpd-wit=
h-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2390">Intel XE#2390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@kms_content_protection@legac=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a>) +7 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-2/igt@kms_content_protection@legacy=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3278">Intel XE#3278</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-3/igt@kms_content_protection@srm.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_content_protection@uevent=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@kms_cursor_crc@cursor-offscre=
en-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-5/igt@kms_cursor_crc@cursor-random-=
256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@kms_cursor_crc@cursor-random-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_cursor_legacy@basic-bus=
y-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-8/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@kms_cursor_legacy@basic-busy=
-flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-2/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-435/igt@kms_cu=
rsor_legacy@cursora-vs-flipb-toggle.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-436/igt@kms_cur=
sor_legacy@cursora-vs-flipb-toggle.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-=
flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-lnl-7/igt@kms_curs=
or_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-1/igt@kms_cursor_le=
gacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-1/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-6/igt@kms_dp_linktrai=
n_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3070">Intel XE#3070</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">I=
ntel XE#2244</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-8/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@kms_fbcon_fbt@psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">In=
tel XE#776</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-435/igt@kms_fbcon_fbt@psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">=
Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard=
-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@kms=
_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-7/igt@kms_flip@2x-flip-vs-modeset.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1421">Intel XE#1421</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend-i=
nterruptible@bc-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-5/igt@kms_flip=
@2x-plain-flip-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-6/igt@kms_flip@2x-plai=
n-flip-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-2/igt@kms_flip@2x-single-buffer-fl=
ip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible@a-dp5.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible@b-dp5.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-435/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-4=
66/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Int=
el XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible@d-dp5.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-8/igt@kms_flip=
@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-7/igt@kms_flip@flip-=
vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test i=
ncomplete</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-434/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_flip@f=
lip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1=
745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Inte=
l XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32=
bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-9/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-142118v3/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bp=
p-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE=
#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-463/igt@kms_fl=
ip_tiling@flip-change-tiling.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-436/igt@kms_flip_tilin=
g@flip-change-tiling.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-4/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +33 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-indfb-msflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +15 other tests f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +11 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +32 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
psr-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcp=
sr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2352">Intel XE#2352</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-2/igt@kms_frontbuffer_tracking@psr=
-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-1/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-5/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@kms_multipipe_modeset@basic-=
max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-4/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-3/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-1/igt@kms_plane_scaling@plane-downs=
cale-factor-0-5-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_plane_scaling@planes-unit=
y-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +14 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-7/igt@kms_pm_backlight@brightness-w=
ith-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@kms_pm_backlight@fade-with-dp=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-lnl-8/igt@kms_pm_d=
c@dc5-psr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-142118v3/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE=
#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-3/igt@kms_pm_dc@deep-pkgc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505"=
>Intel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-s=
tress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-pl=
ane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-2/igt@kms_psr2_sf@pr-overlay-plane=
-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-pl=
ane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plan=
e-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-plane-o=
noff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-4/igt@kms_psr@fbc-pr-primary-blt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-8/igt@kms_psr@psr-cursor-plane-mov=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-7/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@kms_rotation_crc@bad-pixel-=
format.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-3/igt@kms_rotation_crc@primary-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2330">Intel XE#2330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-5/igt@kms_rotation_crc@sprite-rotat=
ion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_scaling_modes@scaling-mod=
e-center.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2413">Intel XE#2413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_setmode@basic-clone-singl=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-8/igt@kms_universal_plane@disable-p=
rimary-vs-flip.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/877">Intel XE#877</a>) +2 other tests dmesg-warn</=
li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-4/igt@kms_vbl=
ank@ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@kms_vblank@=
ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +1 other te=
st dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@kms_vrr@flipline.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">In=
tel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-1/igt@kms_vrr@lobf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel=
 XE#2168</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-2/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel =
XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-435/igt@xe_copy_basic@mem-copy-line=
ar-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@xe_copy_basic@mem-set-linear=
-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-3/igt@xe_eudebug@basic-connect.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-meta=
data-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2905">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-uf=
ence-sigint-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-2/igt@xe_eudebug@discovery-empty.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-463/igt@xe_eudebug_online@writes-ca=
ching-sram-bb-sram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-8/igt@xe_evict@evict-beng-large-mul=
ti-vm-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@xe_evict@evict-beng-threads-l=
arge.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-7/igt@xe_evict@evict-threads-large.=
html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1473">Intel XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exe=
c-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@xe_exec_basic@multigpu-once-n=
ull-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2322">Intel XE#2322</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@xe_exec_fault_mode@many-exec=
queues-bindexecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-463/igt@xe_exec_fault_mode@once-bin=
dexecqueue-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-3/igt@xe_mmap@vram.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel =
XE#1416</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-8/igt@xe_mmap@vram.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel=
 XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/sha=
rd-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c=
/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083=
076c/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e4294640=
3083076c/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e429=
46403083076c/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8=
e42946403083076c/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b6=
2ee8e42946403083076c/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc5=
01b62ee8e42946403083076c/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b4=
1cc501b62ee8e42946403083076c/shard-bmg-7/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb=
12b41cc501b62ee8e42946403083076c/shard-bmg-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-1877=
26fb12b41cc501b62ee8e42946403083076c/shard-bmg-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-=
187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-=
8/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-7/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142118v3/shard-bmg-5/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-142118v3/shard-bmg-3/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/sha=
rd-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142118v3/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-6/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-142118v3/shard-bmg-6/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/sha=
rd-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142118v3/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-142118v3/shard-bmg-8/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/sha=
rd-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-5/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142118v3/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-142118v3/shard-bmg-8/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/sha=
rd-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-7/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142118v3/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/sha=
rd-bmg-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-434/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-463/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-4=
34/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard=
-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c=
/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e429464030=
83076c/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e429=
46403083076c/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62=
ee8e42946403083076c/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc=
501b62ee8e42946403083076c/shard-dg2-466/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb1=
2b41cc501b62ee8e42946403083076c/shard-dg2-466/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187=
726fb12b41cc501b62ee8e42946403083076c/shard-dg2-466/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-24=
11-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-463/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-466/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-463=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-d=
g2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/s=
hard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083=
076c/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946=
403083076c/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8=
e42946403083076c/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501=
b62ee8e42946403083076c/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b4=
1cc501b62ee8e42946403083076c/shard-dg2-435/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726=
fb12b41cc501b62ee8e42946403083076c/shard-dg2-435/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-=
187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-435/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-435/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-142118v3/shard-dg2-436/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/sh=
ard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-434/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-142118v3/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-4=
34/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-436/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42118v3/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-463/igt@xe=
_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/s=
hard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-142118v3/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-=
436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-463/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142118v3/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-142118v3/shard-dg2-436/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/=
shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-435/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142118v3/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2=
-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-435/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-142118v3/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-466/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142118v3/shard-dg2-463/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3=
/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@xe_oa@oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-435/igt@xe_oa@privileged-forked-acc=
ess-vaddr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-4/igt@xe_oa@syncs-ufence-wait.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-8/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977=
">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-436/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-8/igt@xe_peer2peer@write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">=
Intel XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-4/igt@xe_pm@d3cold-mocs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">I=
ntel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-e=
xec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-6/igt@xe_pm@s=
3-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-142118v3/shard-adlp-6/igt@xe_pm@s3-basic.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel=
 XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-1/igt@xe_pm@s3-d3cold-basic-exec.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-8/igt@xe_pm@s=
4-exec-after.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-142118v3/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">=
Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-8/igt@xe_pm@s=
4-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142118v3/shard-adlp-9/igt@xe_pm@s4-multiple-execs.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1607">Intel XE#1607</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-3/igt@xe_pm_re=
sidency@cpg-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142118v3/shard-bmg-1/igt@xe_pm_residency@cpg-basic.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3088">Intel XE#3088</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-adlp-4/igt@xe_query@multigpu-query-conf=
ig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-lnl-7/igt@xe_query@multigpu-query-inval=
id-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-dg2-434/igt@xe_query@multigpu-query-inv=
alid-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-7/igt@xe_query@multigpu-query-uc-fw=
-version-huc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142118v3/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-9/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3=
/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html">PA=
SS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-8/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard=
-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-3/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">I=
ntel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-142118v3/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-t=
ransitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard=
-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a>=
 +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard=
-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">PASS</a>=
 +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-suspend-interruptible@ad-dp2-hdmi-a3.html">INCOMPLETE</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-=
bmg-8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-dp2-hdmi-a3.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-435/igt@kms_fl=
ip@flip-vs-expired-vblank@a-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-434=
/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html">PASS</a> +5 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-435/igt@kms_fl=
ip@flip-vs-expired-vblank@c-dp4.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/sha=
rd-dg2-434/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-lnl-7/igt@kms_flip=
@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/=
shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-lnl-7/igt@kms_flip=
@plain-flip-ts-check-interruptible@c-edp1.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-l=
nl-7/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html">PASS</a> +=
2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-9/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">In=
tel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/324">Intel XE#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-142118v3/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp=
-ytile-to-32bpp-ytile-downscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">DMESG-FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel =
XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142118v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-s=
hrfb-draw-blt.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-2/igt@kms_pla=
ne_lowres@tiling-x@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-3=
/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-lnl-7/igt@kms_psr@=
fbc-psr2-cursor-plane-move.html">FAIL</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-5/igt@kms_psr@fbc-psr2-c=
ursor-plane-move.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-3/igt@kms_setm=
ode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-8/igt@kms_setmode@basic.htm=
l">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-lnl-4/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-6/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-lnl-6/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl=
-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-lnl-8/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2159">Intel XE#2159</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-7/igt@kms_vrr@cmrr@=
pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@parallel-utilization-single-idle:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-2/igt@xe_drm_=
fdinfo@parallel-utilization-single-idle.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3869">Intel XE#3869</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-a=
dlp-3/igt@xe_drm_fdinfo@parallel-utilization-single-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-null:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-8/igt@xe_exec=
_basic@no-exec-null.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-2/igt@xe_e=
xec_basic@no-exec-null.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-lnl-2/igt@xe_pm@s4=
-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-lnl-7/igt@xe_pm@s4-vm-b=
ind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-timestamp-check@engine-drm_xe_engine_class_video_=
enhance:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-463/igt@xe_spi=
n_batch@spin-timestamp-check@engine-drm_xe_engine_class_video_enhance.html"=
>INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-142118v3/shard-dg2-463/igt@xe_spin_batch@spin-timestamp-check@engine-=
drm_xe_engine_class_video_enhance.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-rte.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-6/igt@kms=
_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
18v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel =
XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142118v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-dg2-466/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-dg2-436/igt@=
kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-7/igt@xe_ccs@s=
uspend-resume@linear-compressed-compfmt0-vram01-vram01.html">INCOMPLETE</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/=
shard-bmg-4/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vra=
m01.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3664">Intel XE#3664</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-2/=
igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-ad=
lp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/sha=
rd-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076=
c/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e429464030=
83076c/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e4294=
6403083076c/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8=
e42946403083076c/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b=
62ee8e42946403083076c/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41c=
c501b62ee8e42946403083076c/shard-adlp-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb1=
2b41cc501b62ee8e42946403083076c/shard-adlp-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-1877=
26fb12b41cc501b62ee8e42946403083076c/shard-adlp-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411=
-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-3/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-3/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-9/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-adlp-9/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-ad=
lp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/sha=
rd-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e42946403083076=
c/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e429464030=
83076c/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8e4294=
6403083076c/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b62ee8=
e42946403083076c/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41cc501b=
62ee8e42946403083076c/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2411-187726fb12b41c=
c501b62ee8e42946403083076c/shard-adlp-8/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-142118v3/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-2/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
18v3/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-142118v3/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-a=
dlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-142118v3/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-142118v3/shard-adlp-9/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/sh=
ard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-142118v3/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-1/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118=
v3/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142118v3/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adl=
p-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-8/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-142118v3/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/i=
gt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142118v3/shard-adlp-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118=
v3/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-adlp-6/igt@xe_module=
_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2411-187726fb12b41cc501b62ee8e42946403083076c/shard-bmg-3/igt@xe_wedge=
d@wedged-at-any-timeout.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3421">Intel XE#3421</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142118v3/shard-bmg-6/igt@xe_wed=
ged@wedged-at-any-timeout.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3765">Intel XE#3765</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8167 -&gt; IGT_8168</li>
<li>Linux: xe-2411-187726fb12b41cc501b62ee8e42946403083076c -&gt; xe-pw-142=
118v3</li>
</ul>
<p>IGT_8167: 6e93c2e807b398f24673d010f3f71986a09fef8f @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8168: ecb4351581b3ca4be76ee3c8842603be69931401 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2411-187726fb12b41cc501b62ee8e42946403083076c: 187726fb12b41cc501b62ee=
8e42946403083076c<br />
  xe-pw-142118v3: 142118v3</p>

</body>
</html>

--===============8634208136681458731==--
