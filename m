Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B41CF07A0
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 04:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC1E10E857;
	Thu, 10 Oct 2024 04:57:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A42710E857;
 Thu, 10 Oct 2024 04:57:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3267027519684182078=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/guc=3A_Fix_inverted_logi?=
 =?utf-8?q?c_on_snapshot-=3Ecopy_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Colin Ian King" <colin.i.king@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Oct 2024 04:57:41 -0000
Message-ID: <172853626122.1213460.13901648426308009313@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241009160510.372195-1-colin.i.king@gmail.com>
In-Reply-To: <20241009160510.372195-1-colin.i.king@gmail.com>
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

--===============3267027519684182078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Fix inverted logic on snapshot->copy check
URL   : https://patchwork.freedesktop.org/series/139799/
State : failure

== Summary ==

CI Bug Log - changes from xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f_full -> xe-pw-139799v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139799v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139799v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139799v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color@legacy-gamma-reset:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-1/igt@kms_color@legacy-gamma-reset.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_color@legacy-gamma-reset.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-lnl:          [PASS][5] -> [DMESG-WARN][6] +3 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-4/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@xe_exec_threads@threads-bal-mixed-rebind:
    - shard-adlp:         [PASS][9] -> [TIMEOUT][10] +2 other tests timeout
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-2/igt@xe_exec_threads@threads-bal-mixed-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-9/igt@xe_exec_threads@threads-bal-mixed-rebind.html

  * igt@xe_pm@s3-mocs:
    - shard-dg2-set2:     [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-436/igt@xe_pm@s3-mocs.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-432/igt@xe_pm@s3-mocs.html

  
#### Warnings ####

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-adlp:         [SKIP][13] ([Intel XE#1127]) -> [TIMEOUT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-9/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [TIMEOUT][15] ([Intel XE#2105]) -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-3:
    - {shard-bmg}:        [PASS][17] -> [DMESG-WARN][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-bmg-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-3.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-bmg-5/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-3.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:
    - {shard-bmg}:        [PASS][19] -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html

  
Known issues
------------

  Here are the changes found in xe-pw-139799v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
    - shard-adlp:         [PASS][21] -> [DMESG-WARN][22] ([Intel XE#324]) +1 other test dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [PASS][23] -> [FAIL][24] ([Intel XE#1701]) +3 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1124]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][26] -> [FAIL][27] ([Intel XE#1659])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1407])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][29] ([Intel XE#1231]) +2 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#316]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1124]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1428])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1124]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#2191])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#367]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#367])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#787]) +17 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#2887]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][40] -> [INCOMPLETE][41] ([Intel XE#1195])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#306])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#306])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@degamma:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#306]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#373]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#373]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#307]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#599]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#455]) +7 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#2321])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1424])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#308])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#309]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [PASS][54] -> [FAIL][55] ([Intel XE#1475])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#323]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1137])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#310])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          NOTRUN -> [TIMEOUT][59] ([Intel XE#1504]) +1 other test timeout
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-1/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#886]) +3 other tests fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#651]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#651])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#656]) +7 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-dg2-set2:     [PASS][65] -> [ABORT][66] ([Intel XE#2625])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#651]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#656]) +16 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#653]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_hdr@static-swap:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1503] / [Intel XE#599])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-1/igt@kms_hdr@static-swap.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][71] ([Intel XE#1035] / [Intel XE#1195])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_plane@pixel-format.html

  * igt@kms_plane@pixel-format@pipe-a-plane-3:
    - shard-adlp:         NOTRUN -> [WARN][72] ([Intel XE#2078]) +1 other test warn
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_plane@pixel-format@pipe-a-plane-3.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-3:
    - shard-lnl:          [PASS][73] -> [DMESG-WARN][74] ([Intel XE#324]) +2 other tests dmesg-warn
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [PASS][75] -> [FAIL][76] ([Intel XE#616]) +1 other test fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-464/igt@kms_plane_cursor@viewport.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-464/igt@kms_plane_cursor@viewport.html
    - shard-lnl:          [PASS][77] -> [FAIL][78] ([Intel XE#1471])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-4/igt@kms_plane_cursor@viewport.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-7/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-64:
    - shard-lnl:          [PASS][79] -> [FAIL][80] ([Intel XE#1874])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-4/igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-64.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-7/igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-64.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][81] -> [FAIL][82] ([Intel XE#361])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1122])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1129])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1439])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1489]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1406])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-1/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-1/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@psr2-primary-page-flip@edp-1:
    - shard-lnl:          [PASS][89] -> [FAIL][90] ([Intel XE#2948]) +1 other test fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-1/igt@kms_psr@psr2-primary-page-flip@edp-1.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-5/igt@kms_psr@psr2-primary-page-flip@edp-1.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#2939])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#327])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-466/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         NOTRUN -> [FAIL][93] ([Intel XE#1874]) +1 other test fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-lnl:          [PASS][94] -> [DMESG-WARN][95] ([Intel XE#2055])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-3/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_setmode@basic:
    - shard-adlp:         [PASS][96] -> [FAIL][97] ([Intel XE#2883]) +1 other test fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-4/igt@kms_setmode@basic.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][98] -> [FAIL][99] ([Intel XE#2883])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_sysfs_edid_timing:
    - shard-adlp:         NOTRUN -> [FAIL][100] ([Intel XE#1174])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_sysfs_edid_timing.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][101] -> [FAIL][102] ([Intel XE#2159]) +1 other test fail
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_ccs@suspend-resume:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#455] / [Intel XE#488])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-1/igt@xe_ccs@suspend-resume.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#1123])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1126])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#2905]) +4 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#2905]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#688]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#261] / [Intel XE#688]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@xe_evict@evict-beng-mixed-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#688]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1392]) +4 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1392])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_fault_mode@once-userptr-rebind-imm:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#288]) +9 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@xe_exec_fault_mode@once-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#288]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][115] -> [INCOMPLETE][116] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [PASS][117] -> [DMESG-FAIL][118] ([Intel XE#1620])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#584])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_module_load@load:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#378])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-1/igt@xe_module_load@load.html

  * igt@xe_oa@buffer-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#2541])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-466/igt@xe_oa@buffer-fill.html

  * igt@xe_oa@map-oa-buffer:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#2541]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@xe_oa@map-oa-buffer.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-lnl:          NOTRUN -> [FAIL][123] ([Intel XE#2514]) +1 other test fail
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-1/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#2248])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#2838] / [Intel XE#979])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#2284] / [Intel XE#366])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#2284] / [Intel XE#366])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-1/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#1948])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [PASS][129] -> [ABORT][130] ([Intel XE#1358])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-463/igt@xe_pm@s2idle-exec-after.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-432/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s3-basic:
    - shard-dg2-set2:     [PASS][131] -> [ABORT][132] ([Intel XE#1358] / [Intel XE#1794])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-436/igt@xe_pm@s3-basic.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-432/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][133] -> [ABORT][134] ([Intel XE#1358] / [Intel XE#1607])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-4/igt@xe_pm@s4-basic.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][135] -> [ABORT][136] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-lnl:          [PASS][137] -> [INCOMPLETE][138] ([Intel XE#2655]) +1 other test incomplete
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-1/igt@xe_pm_residency@gt-c6-freeze.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-7/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#944])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@xe_query@multigpu-query-cs-cycles.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [FAIL][140] ([Intel XE#827]) -> [PASS][141] +1 other test pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2:
    - {shard-bmg}:        [DMESG-WARN][142] -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-bmg-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-bmg-5/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [FAIL][144] ([Intel XE#1659]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_color@ctm-max@pipe-c-edp-1:
    - shard-lnl:          [DMESG-WARN][146] ([Intel XE#2929]) -> [PASS][147] +1 other test pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-3/igt@kms_color@ctm-max@pipe-c-edp-1.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-7/igt@kms_color@ctm-max@pipe-c-edp-1.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-lnl:          [FAIL][148] ([Intel XE#1475]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - {shard-bmg}:        [FAIL][150] ([Intel XE#301]) -> [PASS][151] +4 other tests pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][152] ([Intel XE#301]) -> [PASS][153] +5 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - {shard-bmg}:        [FAIL][154] -> [PASS][155] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-lnl:          [INCOMPLETE][156] ([Intel XE#2049]) -> [PASS][157] +1 other test pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1:
    - shard-lnl:          [FAIL][158] ([Intel XE#886]) -> [PASS][159] +5 other tests pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [DMESG-WARN][160] -> [PASS][161] +1 other test pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-lnl:          [TIMEOUT][162] -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-lnl:          [TIMEOUT][164] ([Intel XE#1620]) -> [PASS][165] +1 other test pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-5/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [DMESG-WARN][166] ([Intel XE#324]) -> [PASS][167] +6 other tests pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          [DMESG-FAIL][168] ([Intel XE#324]) -> [PASS][169] +2 other tests pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][170] ([Intel XE#361]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [DMESG-WARN][172] ([Intel XE#2042]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-3/igt@kms_pm_rpm@universal-planes.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-2/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes@plane-77:
    - shard-lnl:          [DMESG-WARN][174] ([Intel XE#2932]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-3/igt@kms_pm_rpm@universal-planes@plane-77.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-2/igt@kms_pm_rpm@universal-planes@plane-77.html

  * igt@kms_psr@fbc-psr-primary-page-flip@edp-1:
    - shard-lnl:          [FAIL][176] -> [PASS][177] +1 other test pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-5/igt@kms_psr@fbc-psr-primary-page-flip@edp-1.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@kms_psr@fbc-psr-primary-page-flip@edp-1.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][178] ([Intel XE#2883]) -> [PASS][179] +6 other tests pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-433/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-435/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][180] ([Intel XE#899]) -> [PASS][181] +1 other test pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@wait-forked-busy-hang:
    - {shard-bmg}:        [DMESG-WARN][182] ([Intel XE#877]) -> [PASS][183] +1 other test pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-bmg-7/igt@kms_vblank@wait-forked-busy-hang.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-bmg-6/igt@kms_vblank@wait-forked-busy-hang.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - {shard-bmg}:        [TIMEOUT][184] ([Intel XE#1473]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][186] ([Intel XE#1473]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - {shard-bmg}:        [TIMEOUT][188] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue:
    - shard-adlp:         [TIMEOUT][190] -> [PASS][191] +4 other tests pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-8/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_basic@twice-null-defer-bind:
    - shard-lnl:          [INCOMPLETE][192] -> [PASS][193] +2 other tests pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-5/igt@xe_exec_basic@twice-null-defer-bind.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@xe_exec_basic@twice-null-defer-bind.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [DMESG-WARN][194] ([Intel XE#2687]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-5/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - {shard-bmg}:        [TIMEOUT][196] ([Intel XE#2105]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-bmg-3/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-dg2-set2:     [ABORT][198] ([Intel XE#1358]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-432/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-466/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [ABORT][200] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [ABORT][202] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [ABORT][204] ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][206] ([Intel XE#1794]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-adlp:         [FAIL][208] ([Intel XE#1874]) -> [TIMEOUT][209] ([Intel XE#402])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-9/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         [TIMEOUT][210] ([Intel XE#402]) -> [FAIL][211] ([Intel XE#1874])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][212] ([Intel XE#1231]) -> [DMESG-FAIL][213] ([Intel XE#324]) +1 other test dmesg-fail
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][214] ([Intel XE#324]) -> [FAIL][215] ([Intel XE#1231])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-adlp:         [TIMEOUT][216] -> [SKIP][217] ([Intel XE#656])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         [INCOMPLETE][218] ([Intel XE#1035]) -> [INCOMPLETE][219] ([Intel XE#1035] / [Intel XE#1195])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-adlp:         [TIMEOUT][220] -> [SKIP][221] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_setmode@basic@pipe-a-edp-1:
    - shard-lnl:          [FAIL][222] ([Intel XE#2883]) -> [FAIL][223] ([Intel XE#2947])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-8/igt@kms_setmode@basic@pipe-a-edp-1.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-1/igt@kms_setmode@basic@pipe-a-edp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1288
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2655]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2655
  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2947
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f -> xe-pw-139799v1

  IGT_8061: 8061
  xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f: 1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f
  xe-pw-139799v1: 139799v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/index.html

--===============3267027519684182078==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Fix inverted logic on snapshot-&gt;copy check</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139799/">https://patchwork.freedesktop.org/series/139799/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f_full -&gt; xe-pw-139799v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139799v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139799v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139799v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_color@legacy-gamma-reset:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-1/igt@kms_color@legacy-gamma-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_color@legacy-gamma-reset.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-4/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-2/igt@xe_exec_threads@threads-bal-mixed-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-9/igt@xe_exec_threads@threads-bal-mixed-rebind.html">TIMEOUT</a> +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-436/igt@xe_pm@s3-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-432/igt@xe_pm@s3-mocs.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-9/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-bmg-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-bmg-5/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-3.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139799v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-1/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-1/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-a-plane-3:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_plane@pixel-format@pipe-a-plane-3.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-464/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-464/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-4/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-7/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471">Intel XE#1471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-64:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-4/igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-7/igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-1/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-1/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-1/igt@kms_psr@psr2-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-5/igt@kms_psr@psr2-primary-page-flip@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-466/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_rotation_crc@multiplane-rotation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-3/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055">Intel XE#2055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-4/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-1/igt@xe_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@xe_evict@evict-beng-mixed-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-rebind-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@xe_exec_fault_mode@once-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-1/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-466/igt@xe_oa@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@xe_oa@map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-1/igt@xe_oa@oa-regs-whitelisted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-1/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-463/igt@xe_pm@s2idle-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-432/igt@xe_pm@s2idle-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-436/igt@xe_pm@s3-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-432/igt@xe_pm@s3-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-4/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-1/igt@xe_pm_residency@gt-c6-freeze.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-7/igt@xe_pm_residency@gt-c6-freeze.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2655">Intel XE#2655</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-bmg-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-bmg-5/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-3/igt@kms_color@ctm-max@pipe-c-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-7/igt@kms_color@ctm-max@pipe-c-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-8/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-5/igt@kms_pipe_crc_basic@suspend-read-crc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-3/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-2/igt@kms_pm_rpm@universal-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-77:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-3/igt@kms_pm_rpm@universal-planes@plane-77.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-2/igt@kms_pm_rpm@universal-planes@plane-77.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-5/igt@kms_psr@fbc-psr-primary-page-flip@edp-1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@kms_psr@fbc-psr-primary-page-flip@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-433/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-435/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-bmg-7/igt@kms_vblank@wait-forked-busy-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-bmg-6/igt@kms_vblank@wait-forked-busy-hang.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-8/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-null-defer-bind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-5/igt@xe_exec_basic@twice-null-defer-bind.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-8/igt@xe_exec_basic@twice-null-defer-bind.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687">Intel XE#2687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-5/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-bmg-3/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-dg2-432/igt@xe_pm@s2idle-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-dg2-466/igt@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-4/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-9/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f/shard-lnl-8/igt@kms_setmode@basic@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139799v1/shard-lnl-1/igt@kms_setmode@basic@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2947">Intel XE#2947</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f -&gt; xe-pw-139799v1</li>
</ul>
<p>IGT_8061: 8061<br />
  xe-2037-1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f: 1256f9d85c1ca48c3eb4c1a34d23d6ecc5109e0f<br />
  xe-pw-139799v1: 139799v1</p>

</body>
</html>

--===============3267027519684182078==--
