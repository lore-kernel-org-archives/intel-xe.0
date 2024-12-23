Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0167CE7718B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Dec 2024 22:04:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9043110E13E;
	Mon, 23 Dec 2024 22:04:26 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959E810E13E;
 Mon, 23 Dec 2024 22:04:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3188949591297732479=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Remove_=27Force_?=
 =?utf-8?q?write_completion=27_from_MI=5FSTORE=5FDATA=5FIMM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Dec 2024 22:04:24 -0000
Message-ID: <173499146459.2252688.18249053637587813700@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241223182918.126288-1-jose.souza@intel.com>
In-Reply-To: <20241223182918.126288-1-jose.souza@intel.com>
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

--===============3188949591297732479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Remove 'Force write completion' from MI_STORE_DATA_IMM
URL   : https://patchwork.freedesktop.org/series/142944/
State : failure

== Summary ==

CI Bug Log - changes from xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea_full -> xe-pw-142944v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142944v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142944v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142944v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         NOTRUN -> [ABORT][1] +2 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-lnl:          NOTRUN -> [ABORT][2] +2 other tests abort
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-6/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][4] +2 other tests incomplete
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_plane_cursor@viewport.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][5] +7 other tests incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2.html

  * igt@xe_ccs@suspend-resume:
    - shard-bmg:          NOTRUN -> [FAIL][6] +3 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@xe_ccs@suspend-resume.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind:
    - shard-dg2-set2:     NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-142944v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_setmaster_vs_auth:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#2423])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@core_setmaster_vs_auth.html

  * igt@fbdev@eof:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2134])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@fbdev@eof.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#2134])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@fbdev@eof.html

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1125]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@intel_hwmon@hwmon-read.html

  * igt@intel_hwmon@hwmon-write:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1125]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@intel_hwmon@hwmon-write.html

  * igt@kms_3d:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1465])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_3d.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2233])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#623])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1466])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#3157])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#3157])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          NOTRUN -> [FAIL][19] ([Intel XE#3719]) +3 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][20] ([Intel XE#1033]) +6 other tests dmesg-warn
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#3767]) +23 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          NOTRUN -> [FAIL][22] ([Intel XE#911]) +3 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#2550]) +23 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@crc:
    - shard-adlp:         NOTRUN -> [WARN][24] ([Intel XE#3819]) +1 other test warn
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_async_flips@crc.html
    - shard-bmg:          NOTRUN -> [INCOMPLETE][25] ([Intel XE#3781]) +3 other tests incomplete
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][26] ([Intel XE#3781]) +3 other tests incomplete
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-6.html

  * igt@kms_async_flips@crc@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [CRASH][27] ([Intel XE#3819]) +7 other tests crash
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_async_flips@crc@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#873])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_async_flips@invalid-async-flip.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#873])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_async_flips@invalid-async-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#873])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#3768])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_async_flips@invalid-async-flip-atomic.html
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#3768])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@kms_async_flips@invalid-async-flip-atomic.html
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#3768])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#664]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#3279]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2370])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#619]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1124]) +61 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1407]) +25 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#3658]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#316]) +22 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_big_fb@linear-32bpp-rotate-270.html
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2327]) +13 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][43] ([Intel XE#1725]) +1 other test dmesg-warn
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#316]) +21 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#610])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#1124]) +44 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1124]) +56 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2328]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#619]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1467]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#607])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#607]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#607]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1477]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#610]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#610])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1428])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1124]) +60 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#2191]) +7 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#2191]) +11 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#2191]) +7 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1512]) +6 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2314] / [Intel XE#2894]) +6 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#367]) +22 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#367]) +7 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#367]) +14 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#367]) +7 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2887]) +69 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#787]) +538 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#2887]) +80 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#2669]) +19 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#455] / [Intel XE#787]) +183 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#3442]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-bmg:          NOTRUN -> [INCOMPLETE][74] ([Intel XE#3862]) +1 other test incomplete
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#3442]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#3433]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#3432]) +8 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#3432]) +10 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#787]) +275 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2136] / [Intel XE#2231]) +37 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#455] / [Intel XE#787]) +153 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][82] ([Intel XE#2692])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#2907]) +9 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#2907]) +8 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2652] / [Intel XE#787]) +44 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#314]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#314]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#314]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#314] / [Intel XE#455]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1152]) +3 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@kms_cdclk@plane-scaling.html
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1152] / [Intel XE#455])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_cdclk@plane-scaling.html
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2724]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1152]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#1152]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#306]) +9 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@kms_chamelium_color@ctm-0-50.html
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2325]) +9 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#306]) +9 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#306]) +8 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#373]) +56 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2252]) +43 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#373]) +53 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#373]) +56 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic@pipe-a-dp-5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][103] ([Intel XE#3407])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_content_protection@atomic@pipe-a-dp-5.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2341]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#307]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#307]) +4 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2390]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#307]) +4 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][109] ([Intel XE#1178]) +5 other tests fail
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@legacy@pipe-a-dp-5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][110] ([Intel XE#3304]) +1 other test fail
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_content_protection@legacy@pipe-a-dp-5.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1468])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][112] ([Intel XE#1178]) +6 other tests fail
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][113] ([Intel XE#1188]) +1 other test fail
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_content_protection@uevent.html
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#3278]) +8 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2320]) +20 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#2321]) +8 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#308]) +8 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#2423] / [i915#2575]) +28 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-64x64.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1424]) +27 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#308]) +8 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2321]) +7 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][122] ([Intel XE#3878])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#309]) +24 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#323]) +5 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#323]) +5 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#323]) +5 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2286]) +4 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#309]) +24 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
    - shard-bmg:          NOTRUN -> [DMESG-WARN][129] ([Intel XE#877]) +2 other tests dmesg-warn
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#1508])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#1508])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [FAIL][132] ([Intel XE#2141]) +2 other tests fail
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#3383])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#1340])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([i915#3804])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_aux_dev:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#3009])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#3070])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#3070])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2244]) +5 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#2244]) +6 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [FAIL][141] ([Intel XE#1695]) +1 other test fail
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#776]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#776]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#776]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#701])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_feature_discovery@chamelium.html
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#701])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@kms_feature_discovery@chamelium.html
    - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#701])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#702])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_feature_discovery@display-2x.html
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#702])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#703])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_feature_discovery@display-3x.html
    - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#703])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@kms_feature_discovery@display-3x.html
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#2373])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_feature_discovery@display-3x.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#703])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#1138])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_feature_discovery@display-4x.html
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#1138])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_feature_discovery@display-4x.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#1138])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_feature_discovery@display-4x.html
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#1138])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#1137])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@kms_feature_discovery@dp-mst.html
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2375])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#1137])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#1137])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][162] ([Intel XE#1135]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@kms_feature_discovery@psr1.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#1135]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     NOTRUN -> [FAIL][164] ([Intel XE#301])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][165] ([Intel XE#2882]) +8 other tests fail
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][166] ([Intel XE#3321]) +2 other tests fail
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp5.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][167] ([Intel XE#3321]) +1 other test fail
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp5:
    - shard-dg2-set2:     NOTRUN -> [FAIL][168] ([Intel XE#3149])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp5.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#1421]) +40 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][170] ([Intel XE#310]) +39 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][171] ([Intel XE#1504]) +1 other test incomplete
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][172] ([Intel XE#2597]) +1 other test incomplete
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][173] ([Intel XE#886]) +2 other tests fail
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][174] ([Intel XE#1401]) +26 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#1397]) +7 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][176] ([Intel XE#2380]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#1397] / [Intel XE#1745]) +7 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][178] ([Intel XE#2293] / [Intel XE#2380]) +21 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][179] ([Intel XE#1033] / [Intel XE#324]) +3 other tests dmesg-fail
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#2293]) +21 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][181] ([Intel XE#2136] / [Intel XE#2351]) +8 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][182] ([Intel XE#1401] / [Intel XE#1745]) +26 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         NOTRUN -> [FAIL][183] ([Intel XE#1874]) +7 other tests fail
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][184] ([Intel XE#1033]) +20 other tests dmesg-fail
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     NOTRUN -> [SKIP][185] ([i915#5274])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html
    - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#352]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#2311]) +134 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][188] ([Intel XE#651]) +80 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][189] ([Intel XE#656]) +226 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][190] ([Intel XE#651]) +167 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [FAIL][191] ([Intel XE#2333]) +64 other tests fail
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][192] ([Intel XE#2136]) +28 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][193] ([Intel XE#1151]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][194] ([Intel XE#651]) +81 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][195] ([Intel XE#658]) +2 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][196] ([Intel XE#1469]) +2 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][197] ([Intel XE#653]) +166 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][198] ([Intel XE#653]) +79 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][199] ([Intel XE#2352])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][200] ([Intel XE#1158])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - shard-adlp:         NOTRUN -> [SKIP][201] ([Intel XE#1158])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - shard-bmg:          NOTRUN -> [SKIP][202] ([Intel XE#2350])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][203] ([Intel XE#2313]) +130 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][204] ([Intel XE#656]) +225 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][205] ([Intel XE#2502])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@kms_getfb@getfb-reject-ccs.html
    - shard-adlp:         NOTRUN -> [SKIP][206] ([Intel XE#1341])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@kms_getfb@getfb-reject-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][207] ([Intel XE#605])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][208] ([Intel XE#605])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][209] ([Intel XE#2340])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-lnl:          NOTRUN -> [SKIP][210] ([Intel XE#1470])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          NOTRUN -> [SKIP][211] ([Intel XE#1470] / [Intel XE#2853])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          NOTRUN -> [SKIP][212] ([Intel XE#3374] / [Intel XE#3544])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_hdr@brightness-with-hdr.html
    - shard-bmg:          NOTRUN -> [SKIP][213] ([Intel XE#3544])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          NOTRUN -> [SKIP][214] ([Intel XE#1503]) +2 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_histogram@algo-basic:
    - shard-adlp:         NOTRUN -> [SKIP][215] ([Intel XE#3897]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_histogram@algo-basic.html
    - shard-bmg:          NOTRUN -> [SKIP][216] ([Intel XE#3897]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_histogram@algo-basic.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][217] ([Intel XE#3897]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_histogram@algo-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][218] ([Intel XE#3897]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-6/igt@kms_histogram@algo-basic.html

  * igt@kms_histogram@global-color:
    - shard-lnl:          NOTRUN -> [SKIP][219] ([Intel XE#3898]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-6/igt@kms_histogram@global-color.html
    - shard-bmg:          NOTRUN -> [SKIP][220] ([Intel XE#3898])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_histogram@global-color.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-lnl:          NOTRUN -> [SKIP][221] ([Intel XE#1450] / [Intel XE#2568])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][222] ([Intel XE#1450]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][223] ([Intel XE#346])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][224] ([Intel XE#346]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][225] ([Intel XE#2925]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][226] ([Intel XE#2934]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][227] ([Intel XE#2925]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][228] ([Intel XE#2934]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][229] ([Intel XE#2927]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@kms_joiner@basic-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][230] ([Intel XE#2927]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][231] ([Intel XE#346])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][232] ([Intel XE#346])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][233] ([Intel XE#3012]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][234] ([Intel XE#2927]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][235] ([Intel XE#2927]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-adlp:         NOTRUN -> [SKIP][236] ([Intel XE#356])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-bmg:          NOTRUN -> [SKIP][237] ([Intel XE#2501])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][238] ([Intel XE#356])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-lnl:          NOTRUN -> [SKIP][239] ([Intel XE#356])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][240] ([Intel XE#2486])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][241] ([Intel XE#1035]) +1 other test incomplete
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@kms_plane@pixel-format.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-adlp:         NOTRUN -> [WARN][242] ([Intel XE#2078]) +3 other tests warn
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][243] ([Intel XE#616]) +3 other tests fail
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][244] ([Intel XE#599]) +13 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][245] ([Intel XE#2493]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html
    - shard-lnl:          NOTRUN -> [SKIP][246] ([Intel XE#2493]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          NOTRUN -> [SKIP][247] ([Intel XE#3307])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][248] ([Intel XE#361]) +2 other tests fail
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][249] ([Intel XE#2763] / [Intel XE#455]) +17 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][250] ([Intel XE#2763]) +89 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][251] ([Intel XE#2763] / [Intel XE#455]) +17 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-adlp:         NOTRUN -> [SKIP][252] ([Intel XE#2763]) +26 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][253] ([Intel XE#2763]) +26 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][254] ([Intel XE#2763]) +64 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][255] ([Intel XE#2938])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-adlp:         NOTRUN -> [SKIP][256] ([Intel XE#2938])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][257] ([Intel XE#2938])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][258] ([Intel XE#870]) +3 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_pm_backlight@fade.html
    - shard-adlp:         NOTRUN -> [SKIP][259] ([Intel XE#870]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_pm_backlight@fade.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][260] ([Intel XE#870]) +3 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          NOTRUN -> [SKIP][261] ([Intel XE#736])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          NOTRUN -> [SKIP][262] ([Intel XE#1131])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][263] ([Intel XE#2392]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html
    - shard-adlp:         NOTRUN -> [SKIP][264] ([Intel XE#1129]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@kms_pm_dc@dc5-psr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][265] ([Intel XE#1129]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html
    - shard-lnl:          NOTRUN -> [FAIL][266] ([Intel XE#718])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][267] ([Intel XE#3309])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-lnl:          NOTRUN -> [SKIP][268] ([Intel XE#3309])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-adlp:         NOTRUN -> [SKIP][269] ([Intel XE#3309])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          NOTRUN -> [FAIL][270] ([Intel XE#1430]) +1 other test fail
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         NOTRUN -> [FAIL][271] ([Intel XE#3325])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-adlp:         NOTRUN -> [SKIP][272] ([Intel XE#2007])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_pm_dc@deep-pkgc.html
    - shard-bmg:          NOTRUN -> [SKIP][273] ([Intel XE#2505])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_pm_dc@deep-pkgc.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][274] ([Intel XE#908])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html
    - shard-lnl:          NOTRUN -> [FAIL][275] ([Intel XE#2029])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][276] ([Intel XE#2499])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][277] ([Intel XE#2446])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_pm_rpm@cursor-dpms.html
    - shard-bmg:          NOTRUN -> [SKIP][278] ([Intel XE#2446])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][279] ([Intel XE#1439] / [Intel XE#836])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][280] ([Intel XE#1439] / [Intel XE#836])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][281] ([Intel XE#836]) +4 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][282] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +2 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][283] ([Intel XE#1439] / [Intel XE#3141]) +3 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][284] ([Intel XE#1489]) +38 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][285] ([Intel XE#1489]) +45 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][286] ([Intel XE#1489]) +45 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][287] ([Intel XE#2893]) +21 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][288] ([Intel XE#1128]) +2 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][289] ([Intel XE#1122]) +3 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][290] ([Intel XE#1122]) +3 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_psr2_su@page_flip-p010.html
    - shard-bmg:          NOTRUN -> [SKIP][291] ([Intel XE#2387]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][292] ([Intel XE#2234] / [Intel XE#2850]) +64 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][293] ([Intel XE#1406]) +25 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-3/igt@kms_psr@pr-primary-blt.html

  * igt@kms_psr@psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][294] ([Intel XE#2850] / [Intel XE#929]) +79 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][295] ([Intel XE#2850] / [Intel XE#929]) +84 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][296] ([Intel XE#2234])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][297] ([Intel XE#2939])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][298] ([Intel XE#2414])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][299] ([Intel XE#2939])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][300] ([Intel XE#3414]) +5 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][301] ([Intel XE#2330]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][302] ([Intel XE#1127]) +2 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][303] ([Intel XE#3414]) +10 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
    - shard-lnl:          NOTRUN -> [SKIP][304] ([Intel XE#3414]) +12 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][305] ([Intel XE#1127]) +3 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][306] ([Intel XE#1127]) +3 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][307] ([Intel XE#3414]) +9 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          NOTRUN -> [SKIP][308] ([Intel XE#2413]) +2 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-none.html
    - shard-lnl:          NOTRUN -> [SKIP][309] ([Intel XE#2413] / [Intel XE#374])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][310] ([Intel XE#374]) +2 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_sequence@get-busy:
    - shard-bmg:          NOTRUN -> [SKIP][311] ([Intel XE#3007]) +29 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@kms_sequence@get-busy.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][312] ([Intel XE#1435]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][313] ([Intel XE#1435]) +4 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-adlp:         NOTRUN -> [FAIL][314] ([Intel XE#1174])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-adlp:         NOTRUN -> [SKIP][315] ([Intel XE#362]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_tiled_display@basic-test-pattern.html
    - shard-bmg:          NOTRUN -> [SKIP][316] ([Intel XE#2426])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][317] ([Intel XE#1729])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
    - shard-lnl:          NOTRUN -> [SKIP][318] ([Intel XE#362]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][319] ([Intel XE#2509])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][320] ([Intel XE#1500])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][321] ([Intel XE#330])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html
    - shard-lnl:          NOTRUN -> [SKIP][322] ([Intel XE#330])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_tv_load_detect@load-detect.html
    - shard-adlp:         NOTRUN -> [SKIP][323] ([Intel XE#330])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          NOTRUN -> [FAIL][324] ([Intel XE#899]) +1 other test fail
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][325] ([Intel XE#3864])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          NOTRUN -> [SKIP][326] ([Intel XE#2168])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_vrr@cmrr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][327] ([Intel XE#2168])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][328] ([Intel XE#2159]) +1 other test fail
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][329] ([Intel XE#455]) +136 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@kms_vrr@flip-suspend.html
    - shard-bmg:          NOTRUN -> [SKIP][330] ([Intel XE#1499]) +7 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][331] ([Intel XE#455]) +95 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-adlp:         NOTRUN -> [SKIP][332] ([Intel XE#2168]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][333] ([Intel XE#1499]) +3 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][334] ([Intel XE#756]) +3 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html
    - shard-lnl:          NOTRUN -> [SKIP][335] ([Intel XE#756]) +5 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][336] ([Intel XE#756]) +4 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-bmg:          NOTRUN -> [SKIP][337] ([Intel XE#756]) +3 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          NOTRUN -> [SKIP][338] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][339] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-lnl:          NOTRUN -> [SKIP][340] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg2-set2:     NOTRUN -> [SKIP][341] ([Intel XE#1130]) +50 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_ccs@large-ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> [SKIP][342] ([Intel XE#3576])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@xe_ccs@large-ctrl-surf-copy.html

  * igt@xe_ccs@suspend-resume:
    - shard-adlp:         NOTRUN -> [SKIP][343] ([Intel XE#455] / [Intel XE#488]) +5 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@xe_ccs@suspend-resume.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][344] ([Intel XE#1447]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@xe_compute@ccs-mode-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][345] ([Intel XE#1447]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][346] ([Intel XE#1280] / [Intel XE#455]) +5 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][347] ([Intel XE#1123]) +3 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][348] ([Intel XE#1123]) +3 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][349] ([Intel XE#1126]) +3 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][350] ([Intel XE#1126]) +2 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         NOTRUN -> [SKIP][351] ([Intel XE#1062])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@xe_create@create-big-vram.html
    - shard-lnl:          NOTRUN -> [SKIP][352] ([Intel XE#1062])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@xe_create@create-big-vram.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][353] ([Intel XE#2504])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_drm_fdinfo@utilization-all-full-load:
    - shard-adlp:         NOTRUN -> [FAIL][354] ([Intel XE#3869]) +1 other test fail
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@xe_drm_fdinfo@utilization-all-full-load.html

  * igt@xe_drm_fdinfo@utilization-others-full-load:
    - shard-dg2-set2:     NOTRUN -> [FAIL][355] ([Intel XE#3869])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_drm_fdinfo@utilization-others-full-load.html
    - shard-lnl:          NOTRUN -> [FAIL][356] ([Intel XE#3869])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@xe_drm_fdinfo@utilization-others-full-load.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][357] ([Intel XE#2905]) +58 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-connect:
    - shard-lnl:          NOTRUN -> [SKIP][358] ([Intel XE#2905]) +60 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     NOTRUN -> [SKIP][359] ([Intel XE#3889]) +2 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
    - shard-lnl:          NOTRUN -> [SKIP][360] ([Intel XE#3889]) +2 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          NOTRUN -> [SKIP][361] ([Intel XE#3889]) +2 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
    - shard-adlp:         NOTRUN -> [SKIP][362] ([Intel XE#3889]) +2 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][363] ([Intel XE#2905]) +47 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@xe_eudebug_online@single-step.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-adlp:         NOTRUN -> [SKIP][364] ([Intel XE#2905]) +60 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     NOTRUN -> [FAIL][365] ([Intel XE#1600]) +1 other test fail
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][366] ([Intel XE#1473])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][367] ([Intel XE#1473] / [Intel XE#402])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-bmg:          NOTRUN -> [TIMEOUT][368] ([Intel XE#1473]) +3 other tests timeout
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][369] ([Intel XE#688]) +58 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@xe_evict@evict-beng-threads-large-multi-vm.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-bmg:          NOTRUN -> [FAIL][370] ([Intel XE#2364])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][371] ([Intel XE#1473])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          NOTRUN -> [TIMEOUT][372] ([Intel XE#1473] / [Intel XE#2472])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][373] ([Intel XE#261] / [Intel XE#688]) +48 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          NOTRUN -> [FAIL][374] ([Intel XE#1000])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@xe_evict@evict-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][375] ([Intel XE#688]) +8 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][376] ([Intel XE#2322]) +38 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][377] ([Intel XE#1392]) +49 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][378] ([Intel XE#1392]) +50 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
    - shard-adlp:         NOTRUN -> [SKIP][379] ([Intel XE#288]) +138 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][380] ([Intel XE#288]) +137 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][381] ([Intel XE#2360]) +3 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][382] ([Intel XE#2360]) +3 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][383] ([Intel XE#3868])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@xe_exec_reset@cat-error.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][384] ([Intel XE#3868])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][385] ([Intel XE#255])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     NOTRUN -> [SKIP][386] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_live_ktest@xe_bo.html
    - shard-adlp:         NOTRUN -> [SKIP][387] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [FAIL][388] ([Intel XE#3099]) +2 other tests fail
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][389] ([Intel XE#2229]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][390] ([Intel XE#2833])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@xe_live_ktest@xe_eudebug.html
    - shard-lnl:          NOTRUN -> [SKIP][391] ([Intel XE#1192] / [Intel XE#3026])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-6/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-lnl:          NOTRUN -> [SKIP][392] ([Intel XE#1192]) +3 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][393] ([Intel XE#2229]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-adlp:         NOTRUN -> [FAIL][394] ([Intel XE#1999]) +2 other tests fail
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][395] ([Intel XE#1999]) +2 other tests fail
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][396] ([Intel XE#560])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_media_fill@media-fill.html
    - shard-lnl:          NOTRUN -> [SKIP][397] ([Intel XE#560])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-adlp:         NOTRUN -> [SKIP][398] ([Intel XE#512])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@xe_mmap@small-bar.html
    - shard-bmg:          NOTRUN -> [SKIP][399] ([Intel XE#586])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@xe_mmap@small-bar.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][400] ([Intel XE#512])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@xe_mmap@small-bar.html
    - shard-lnl:          NOTRUN -> [SKIP][401] ([Intel XE#512])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][402] ([Intel XE#2457])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@xe_module_load@force-load.html
    - shard-adlp:         NOTRUN -> [SKIP][403] ([Intel XE#378])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@xe_module_load@force-load.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][404] ([Intel XE#378])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_module_load@force-load.html
    - shard-lnl:          NOTRUN -> [SKIP][405] ([Intel XE#378])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-3/igt@xe_module_load@force-load.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][406] ([Intel XE#2953]) +5 other tests dmesg-warn
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     NOTRUN -> [FAIL][407] ([Intel XE#3546])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@xe_module_load@reload.html
    - shard-bmg:          NOTRUN -> [FAIL][408] ([Intel XE#3546])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@xe_module_load@reload.html

  * igt@xe_noexec_ping_pong:
    - shard-adlp:         NOTRUN -> [SKIP][409] ([Intel XE#379])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@xe_noexec_ping_pong.html
    - shard-lnl:          NOTRUN -> [SKIP][410] ([Intel XE#379])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@xe_noexec_ping_pong.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-adlp:         NOTRUN -> [SKIP][411] ([Intel XE#2541] / [Intel XE#3573]) +40 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][412] ([Intel XE#2248]) +1 other test skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][413] ([Intel XE#2541] / [Intel XE#3573]) +40 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-bmg:          NOTRUN -> [SKIP][414] ([Intel XE#2248]) +1 other test skip
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-adlp:         NOTRUN -> [SKIP][415] ([Intel XE#1337])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@xe_pat@display-vs-wb-transient.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][416] ([Intel XE#1337])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         NOTRUN -> [SKIP][417] ([Intel XE#977])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@xe_pat@pat-index-xe2.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][418] ([Intel XE#977])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-adlp:         NOTRUN -> [SKIP][419] ([Intel XE#2838] / [Intel XE#979])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@xe_pat@pat-index-xehpc.html
    - shard-bmg:          NOTRUN -> [SKIP][420] ([Intel XE#1420])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@xe_pat@pat-index-xehpc.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][421] ([Intel XE#2838] / [Intel XE#979])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html
    - shard-lnl:          NOTRUN -> [SKIP][422] ([Intel XE#1420] / [Intel XE#2838])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][423] ([Intel XE#977])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@xe_pat@pat-index-xelp.html
    - shard-bmg:          NOTRUN -> [SKIP][424] ([Intel XE#2245])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-adlp:         NOTRUN -> [SKIP][425] ([Intel XE#979])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@xe_pat@pat-index-xelpg.html
    - shard-bmg:          NOTRUN -> [SKIP][426] ([Intel XE#2236])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@xe_pat@pat-index-xelpg.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][427] ([Intel XE#979])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html
    - shard-lnl:          NOTRUN -> [SKIP][428] ([Intel XE#979])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-adlp:         NOTRUN -> [SKIP][429] ([Intel XE#1061]) +1 other test skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@xe_peer2peer@read.html
    - shard-bmg:          NOTRUN -> [SKIP][430] ([Intel XE#2427]) +1 other test skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@xe_peer2peer@read.html
    - shard-lnl:          NOTRUN -> [SKIP][431] ([Intel XE#1061]) +1 other test skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][432] ([Intel XE#1173]) +3 other tests fail
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          NOTRUN -> [SKIP][433] ([Intel XE#2284] / [Intel XE#366]) +6 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          NOTRUN -> [SKIP][434] ([Intel XE#2284]) +1 other test skip
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][435] ([Intel XE#2284] / [Intel XE#366]) +6 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-adlp:         NOTRUN -> [SKIP][436] ([Intel XE#2284])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@xe_pm@d3cold-mocs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][437] ([Intel XE#2284])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_pm@d3cold-mocs.html
    - shard-lnl:          NOTRUN -> [SKIP][438] ([Intel XE#2284])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][439] ([Intel XE#1948])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@xe_pm@d3hot-mmap-vram.html
    - shard-lnl:          NOTRUN -> [SKIP][440] ([Intel XE#1948])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][441] ([Intel XE#2284] / [Intel XE#366]) +7 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][442] ([Intel XE#584]) +9 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         NOTRUN -> [ABORT][443] ([Intel XE#1358] / [Intel XE#1607])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [ABORT][444] ([Intel XE#1358] / [Intel XE#1607])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][445] ([Intel XE#579])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][446] ([Intel XE#944]) +16 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][447] ([Intel XE#944]) +13 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         NOTRUN -> [SKIP][448] ([Intel XE#944]) +15 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> [SKIP][449] ([Intel XE#944]) +15 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@query-gt-list:
    - shard-bmg:          NOTRUN -> [SKIP][450] ([Intel XE#1130]) +50 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@xe_query@query-gt-list.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][451] ([Intel XE#3342])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_sriov_flr@flr-vf1-clear.html
    - shard-bmg:          NOTRUN -> [SKIP][452] ([Intel XE#3342]) +1 other test skip
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     NOTRUN -> [ABORT][453] ([Intel XE#3075] / [Intel XE#3084])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@xe_module_load@load:
    - shard-lnl:          ([DMESG-WARN][454], [DMESG-WARN][455], [DMESG-WARN][456], [DMESG-WARN][457], [DMESG-WARN][458], [DMESG-WARN][459], [DMESG-WARN][460], [DMESG-WARN][461], [DMESG-WARN][462], [DMESG-WARN][463], [DMESG-WARN][464], [DMESG-WARN][465], [DMESG-WARN][466], [DMESG-WARN][467], [DMESG-WARN][468], [DMESG-WARN][469], [DMESG-WARN][470], [DMESG-WARN][471], [DMESG-WARN][472], [DMESG-WARN][473], [DMESG-WARN][474], [DMESG-WARN][475], [DMESG-WARN][476], [DMESG-WARN][477], [DMESG-WARN][478]) ([Intel XE#3899]) -> ([PASS][479], [PASS][480], [PASS][481], [PASS][482], [PASS][483], [PASS][484], [PASS][485], [PASS][486], [PASS][487], [PASS][488], [PASS][489], [PASS][490], [PASS][491], [PASS][492], [PASS][493], [PASS][494], [PASS][495], [PASS][496], [PASS][497], [PASS][498], [PASS][499], [PASS][500], [PASS][501], [SKIP][502], [PASS][503], [PASS][504]) ([Intel XE#378])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-1/igt@xe_module_load@load.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-2/igt@xe_module_load@load.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-7/igt@xe_module_load@load.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-7/igt@xe_module_load@load.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-2/igt@xe_module_load@load.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-7/igt@xe_module_load@load.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-2/igt@xe_module_load@load.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-6/igt@xe_module_load@load.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-6/igt@xe_module_load@load.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-6/igt@xe_module_load@load.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-2/igt@xe_module_load@load.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-3/igt@xe_module_load@load.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-3/igt@xe_module_load@load.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-3/igt@xe_module_load@load.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-4/igt@xe_module_load@load.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-4/igt@xe_module_load@load.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-4/igt@xe_module_load@load.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-8/igt@xe_module_load@load.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-8/igt@xe_module_load@load.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-8/igt@xe_module_load@load.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-1/igt@xe_module_load@load.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-1/igt@xe_module_load@load.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-5/igt@xe_module_load@load.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-5/igt@xe_module_load@load.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-5/igt@xe_module_load@load.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@xe_module_load@load.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@xe_module_load@load.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@xe_module_load@load.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@xe_module_load@load.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@xe_module_load@load.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@xe_module_load@load.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@xe_module_load@load.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@xe_module_load@load.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@xe_module_load@load.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@xe_module_load@load.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-3/igt@xe_module_load@load.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-3/igt@xe_module_load@load.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@xe_module_load@load.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@xe_module_load@load.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@xe_module_load@load.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-3/igt@xe_module_load@load.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@xe_module_load@load.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@xe_module_load@load.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@xe_module_load@load.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@xe_module_load@load.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-6/igt@xe_module_load@load.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@xe_module_load@load.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@xe_module_load@load.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@xe_module_load@load.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-6/igt@xe_module_load@load.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-6/igt@xe_module_load@load.html
    - shard-bmg:          ([DMESG-WARN][505], [DMESG-WARN][506], [DMESG-WARN][507], [DMESG-WARN][508], [DMESG-WARN][509], [DMESG-WARN][510], [DMESG-WARN][511], [DMESG-WARN][512], [DMESG-WARN][513], [DMESG-WARN][514], [DMESG-WARN][515], [DMESG-WARN][516], [DMESG-WARN][517], [DMESG-WARN][518], [DMESG-WARN][519], [DMESG-WARN][520], [DMESG-WARN][521], [DMESG-WARN][522], [DMESG-WARN][523], [DMESG-WARN][524], [DMESG-WARN][525], [DMESG-WARN][526], [DMESG-WARN][527], [DMESG-WARN][528], [DMESG-WARN][529]) ([Intel XE#3899]) -> ([PASS][530], [PASS][531], [PASS][532], [PASS][533], [PASS][534], [PASS][535], [PASS][536], [PASS][537], [PASS][538], [PASS][539], [PASS][540], [PASS][541], [PASS][542], [SKIP][543], [PASS][544], [PASS][545], [PASS][546], [PASS][547], [PASS][548], [PASS][549], [PASS][550], [PASS][551], [PASS][552], [PASS][553], [PASS][554]) ([Intel XE#2457])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-4/igt@xe_module_load@load.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-3/igt@xe_module_load@load.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-3/igt@xe_module_load@load.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-3/igt@xe_module_load@load.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-3/igt@xe_module_load@load.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-5/igt@xe_module_load@load.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-8/igt@xe_module_load@load.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-8/igt@xe_module_load@load.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-8/igt@xe_module_load@load.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-8/igt@xe_module_load@load.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-1/igt@xe_module_load@load.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-1/igt@xe_module_load@load.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-1/igt@xe_module_load@load.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-1/igt@xe_module_load@load.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-7/igt@xe_module_load@load.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-7/igt@xe_module_load@load.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-7/igt@xe_module_load@load.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-7/igt@xe_module_load@load.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-7/igt@xe_module_load@load.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-5/igt@xe_module_load@load.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-5/igt@xe_module_load@load.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-5/igt@xe_module_load@load.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-4/igt@xe_module_load@load.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-4/igt@xe_module_load@load.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-4/igt@xe_module_load@load.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@xe_module_load@load.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@xe_module_load@load.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@xe_module_load@load.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@xe_module_load@load.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@xe_module_load@load.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@xe_module_load@load.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@xe_module_load@load.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@xe_module_load@load.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@xe_module_load@load.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@xe_module_load@load.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@xe_module_load@load.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@xe_module_load@load.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@xe_module_load@load.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@xe_module_load@load.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@xe_module_load@load.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@xe_module_load@load.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@xe_module_load@load.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@xe_module_load@load.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@xe_module_load@load.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@xe_module_load@load.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@xe_module_load@load.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@xe_module_load@load.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@xe_module_load@load.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@xe_module_load@load.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@xe_module_load@load.html
    - shard-adlp:         ([DMESG-WARN][555], [DMESG-WARN][556], [DMESG-WARN][557], [DMESG-WARN][558], [DMESG-WARN][559], [DMESG-WARN][560], [DMESG-WARN][561], [DMESG-WARN][562], [DMESG-WARN][563], [DMESG-WARN][564], [DMESG-WARN][565], [DMESG-WARN][566], [DMESG-WARN][567], [DMESG-WARN][568], [DMESG-WARN][569], [DMESG-WARN][570], [DMESG-WARN][571], [DMESG-WARN][572], [DMESG-WARN][573], [DMESG-WARN][574], [DMESG-WARN][575], [DMESG-WARN][576], [DMESG-WARN][577], [DMESG-WARN][578], [DMESG-WARN][579]) ([Intel XE#3899]) -> ([PASS][580], [PASS][581], [PASS][582], [PASS][583], [PASS][584], [PASS][585], [PASS][586], [SKIP][587], [PASS][588], [PASS][589], [PASS][590], [PASS][591], [PASS][592], [PASS][593], [PASS][594], [PASS][595], [PASS][596], [PASS][597], [PASS][598], [PASS][599], [PASS][600], [PASS][601], [PASS][602], [PASS][603], [PASS][604], [PASS][605]) ([Intel XE#378])
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-1/igt@xe_module_load@load.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-1/igt@xe_module_load@load.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-1/igt@xe_module_load@load.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-4/igt@xe_module_load@load.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-4/igt@xe_module_load@load.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-4/igt@xe_module_load@load.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-3/igt@xe_module_load@load.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-3/igt@xe_module_load@load.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-3/igt@xe_module_load@load.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-3/igt@xe_module_load@load.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-2/igt@xe_module_load@load.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-2/igt@xe_module_load@load.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-2/igt@xe_module_load@load.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-8/igt@xe_module_load@load.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-2/igt@xe_module_load@load.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-8/igt@xe_module_load@load.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-8/igt@xe_module_load@load.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-9/igt@xe_module_load@load.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-9/igt@xe_module_load@load.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-9/igt@xe_module_load@load.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-9/igt@xe_module_load@load.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-6/igt@xe_module_load@load.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-6/igt@xe_module_load@load.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-6/igt@xe_module_load@load.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-6/igt@xe_module_load@load.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@xe_module_load@load.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@xe_module_load@load.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@xe_module_load@load.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@xe_module_load@load.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@xe_module_load@load.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@xe_module_load@load.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@xe_module_load@load.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@xe_module_load@load.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@xe_module_load@load.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@xe_module_load@load.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@xe_module_load@load.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@xe_module_load@load.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@xe_module_load@load.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@xe_module_load@load.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@xe_module_load@load.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@xe_module_load@load.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@xe_module_load@load.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@xe_module_load@load.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@xe_module_load@load.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@xe_module_load@load.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@xe_module_load@load.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@xe_module_load@load.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@xe_module_load@load.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@xe_module_load@load.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@xe_module_load@load.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([DMESG-WARN][606], [DMESG-WARN][607], [DMESG-WARN][608], [DMESG-WARN][609], [DMESG-WARN][610], [DMESG-WARN][611], [DMESG-WARN][612], [DMESG-WARN][613], [DMESG-WARN][614], [DMESG-WARN][615], [DMESG-WARN][616], [DMESG-WARN][617], [DMESG-WARN][618], [DMESG-WARN][619], [DMESG-WARN][620], [DMESG-WARN][621], [DMESG-WARN][622], [DMESG-WARN][623], [DMESG-WARN][624], [DMESG-WARN][625], [DMESG-WARN][626], [DMESG-WARN][627], [DMESG-WARN][628], [DMESG-WARN][629], [DMESG-WARN][630]) ([Intel XE#3899]) -> ([PASS][631], [PASS][632], [PASS][633], [PASS][634], [PASS][635], [PASS][636], [PASS][637], [PASS][638], [PASS][639], [PASS][640], [PASS][641], [PASS][642], [PASS][643], [PASS][644], [PASS][645], [PASS][646], [SKIP][647], [PASS][648], [PASS][649], [PASS][650], [PASS][651], [PASS][652], [PASS][653], [PASS][654], [PASS][655], [PASS][656]) ([Intel XE#378])
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-435/igt@xe_module_load@load.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-435/igt@xe_module_load@load.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-435/igt@xe_module_load@load.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-435/igt@xe_module_load@load.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-435/igt@xe_module_load@load.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-435/igt@xe_module_load@load.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-466/igt@xe_module_load@load.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-466/igt@xe_module_load@load.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-466/igt@xe_module_load@load.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-466/igt@xe_module_load@load.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-466/igt@xe_module_load@load.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-466/igt@xe_module_load@load.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-434/igt@xe_module_load@load.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-434/igt@xe_module_load@load.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-434/igt@xe_module_load@load.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-434/igt@xe_module_load@load.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-434/igt@xe_module_load@load.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-434/igt@xe_module_load@load.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-436/igt@xe_module_load@load.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-436/igt@xe_module_load@load.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-436/igt@xe_module_load@load.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-436/igt@xe_module_load@load.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-436/igt@xe_module_load@load.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-436/igt@xe_module_load@load.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-436/igt@xe_module_load@load.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_module_load@load.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_module_load@load.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_module_load@load.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_module_load@load.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_module_load@load.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_module_load@load.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_module_load@load.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@xe_module_load@load.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@xe_module_load@load.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_module_load@load.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_module_load@load.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@xe_module_load@load.html
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@xe_module_load@load.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_module_load@load.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_module_load@load.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_module_load@load.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@xe_module_load@load.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@xe_module_load@load.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@xe_module_load@load.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_module_load@load.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_module_load@load.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_module_load@load.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_module_load@load.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_module_load@load.html
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_module_load@load.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3383
  [Intel XE#3407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3407
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3576]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3576
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#3819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3819
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3864
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3869]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3869
  [Intel XE#3878]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3878
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3897]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3897
  [Intel XE#3898]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3898
  [Intel XE#3899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3899
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea -> xe-pw-142944v1

  IGT_8172: 9112581619aa198fa03041d5c7e18e02f42ac00f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea: bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea
  xe-pw-142944v1: 142944v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/index.html

--===============3188949591297732479==
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
<tr><td><b>Series:</b></td><td>drm/xe: Remove &#x27;Force write completion&=
#x27; from MI_STORE_DATA_IMM</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142944/">https://patchwork.freedesktop.org/series/142944/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142944v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142944v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd5=
7fb34ea_full -&gt; xe-pw-142944v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142944v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-142944v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1429=
44v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@core_hotunplug@hotreplug.htm=
l">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-6/igt@core_hotunplug@hotunplug-resc=
an.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@kms_bw@connected-linear-tilin=
g-1-displays-3840x2160p.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_plane_cursor@viewport.h=
tml">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_vblank@ts-continuation-dp=
ms-suspend@pipe-d-dp-2.html">INCOMPLETE</a> +7 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@xe_ccs@suspend-resume.html">F=
AIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_exec_balancer@many-execq=
ueues-cm-virtual-rebind.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142944v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_setmaster_vs_auth:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@core_setmaster_vs_auth.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@fbdev@eof.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#=
2134</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@fbdev@eof.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel X=
E#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@intel_hwmon@hwmon-read.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
25">Intel XE#1125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@intel_hwmon@hwmon-write.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1125">Intel XE#1125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_3d.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#146=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-t=
iled-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1466">Intel XE#1466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_addfb_basic@invalid-smem=
-bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_addfb_basic@invalid-smem-=
bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_async_flips@async-flip-wi=
th-page-flip-events-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3719">Intel XE#3719</a>) +3 other tests fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-=
a-1-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@kms_async_flips@async-flip-w=
ith-page-flip-events-atomic@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033=
</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-=
a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_async_flips@async-flip-=
with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#37=
67</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_async_flips@async-flip-wi=
th-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other=
 tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-m=
c-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_async_flips@async-flip-=
with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a>)=
 +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_async_flips@crc.html">WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3819=
">Intel XE#3819</a>) +1 other test warn</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_async_flips@crc.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3781">Intel XE#3781</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_async_flips@crc-atomic@=
pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3781">Intel XE#3781</a>) +3 other tests incomplet=
e</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_async_flips@crc@pipe-c-h=
dmi-a-1.html">CRASH</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3819">Intel XE#3819</a>) +7 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_async_flips@invalid-async=
-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/873">Intel XE#873</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_async_flips@invalid-asy=
nc-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/873">Intel XE#873</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_async_flips@invalid-async=
-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_async_flips@invalid-asy=
nc-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3768">Intel XE#3768</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@kms_async_flips@invalid-async=
-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3768">Intel XE#3768</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_async_flips@invalid-async=
-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_async_flips@test-cursor.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/664">Intel XE#664</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@kms_atomic@plane-primary-over=
lay-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3279">Intel XE#3279</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/619">Intel XE#619</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +25 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_big_fb@linear-32bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>) +22 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@kms_big_fb@linear-64bpp-rotat=
e-180.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1725">Intel XE#1725</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2328">Intel XE#2328</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/619">Intel XE#619</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1467">Intel XE#1467</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_big_fb@yf-tiled-addfb-si=
ze-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-s=
ize-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/607">Intel XE#607</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1477">Intel XE#1477</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_big_fb@yf-tiled-addfb-si=
ze-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/610">Intel XE#610</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-s=
ize-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/610">Intel XE#610</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +60 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_bw@connected-linear-tilin=
g-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +7 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@kms_bw@connected-linear-tili=
ng-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +11 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_bw@connected-linear-til=
ing-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +7 other tests skip<=
/li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-3/igt@kms_bw@connected-linear-tilin=
g-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) +6 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_bw@connected-linear-tilin=
g-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +6 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_bw@linear-tiling-1-disp=
lays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@kms_bw@linear-tiling-1-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_bw@linear-tiling-2-displ=
ays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_bw@linear-tiling-2-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-=
tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +538 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-til=
ed-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +80 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-t=
iled-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +19 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a=
-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@kms_ccs@crc-primary-rotation=
-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#78=
7</a>) +183 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3442">Intel XE#3442</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4=
-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete<=
/li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend=
-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3442">Intel XE#3442</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4=
-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3433">Intel XE#3433</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-=
y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +275 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +37 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +153 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2692">Intel XE#2692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2907">Intel XE#2907</a>) +9 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +44 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@kms_cdclk@mode-transition-al=
l-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_cdclk@mode-transition@pip=
e-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/314">Intel XE#314</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/314">Intel XE#314</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@kms_cdclk@mode-transition@pi=
pe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/314">Intel XE#314</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@kms_cdclk@plane-scaling.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
152">Intel XE#1152</a>) +3 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_cdclk@plane-scaling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1152">Intel XE#1152</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_cdclk@plane-scaling.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
724">Intel XE#2724</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_cdclk@plane-scaling@pipe=
-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1152">Intel XE#1152</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@kms_chamelium_color@ctm-0-50=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>) +9 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_chamelium_color@ctm-0-50.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_chamelium_color@ctm-blue-=
to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/306">Intel XE#306</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_chamelium_color@ctm-lim=
ited-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/306">Intel XE#306</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_chamelium_edid@dp-edid-r=
esolution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-=
after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/373">Intel XE#373</a>) +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-ena=
ble-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/373">Intel XE#373</a>) +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_content_protection@atom=
ic@pipe-a-dp-5.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3407">Intel XE#3407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_content_protection@conten=
t-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2341">Intel XE#2341</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_content_protection@dp-m=
st-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/307">Intel XE#307</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@kms_content_protection@dp-mst=
-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/307">Intel XE#307</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2390">Intel XE#2390</a>) +2 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@kms_content_protection@dp-ms=
t-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_content_protection@legacy=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_content_protection@lega=
cy@pipe-a-dp-5.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3304">Intel XE#3304</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_content_protection@mei-in=
terface.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1468">Intel XE#1468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_content_protection@ueve=
nt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1188">Intel XE#1188</a>) +1 other test fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-3/igt@kms_content_protection@uevent=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3278">Intel XE#3278</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscre=
en-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_cursor_crc@cursor-offscre=
en-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_cursor_crc@cursor-onscr=
een-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscr=
een-64x64.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +28 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-m=
ovement-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1424">Intel XE#1424</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@kms_cursor_crc@cursor-slidin=
g-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>) +8 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_cursor_crc@cursor-suspend=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3878">Intel XE#3878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_cursor_legacy@2x-nonblock=
ing-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +24 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_cursor_legacy@basic-bus=
y-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +5 other tests skip<=
/li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_cursor_legacy@basic-busy=
-flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +5 other tests =
skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs=
-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +24 other=
 tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-=
flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +2 o=
ther tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_dirtyfb@drrs-dirtyfb-ioct=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1508">Intel XE#1508</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioct=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2141">Intel XE#2141</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@kms_display_modes@extended-mo=
de-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3383">Intel XE#3383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_dp_aux_dev.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Int=
el XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_dp_linktrain_fallback@dp=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3070">Intel XE#3070</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-6/igt@kms_dp_linktrain_fallback@dp-=
fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3070">Intel XE#3070</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2244">Intel XE#2244</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1695">Intel XE#1695</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/776">Intel XE#776</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_fbcon_fbt@psr-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/776">Intel XE#776</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/776">Intel XE#776</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_feature_discovery@chame=
lium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/701">Intel XE#701</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/701">Intel XE#701</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@kms_feature_discovery@chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_feature_discovery@display=
-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/702">Intel XE#702</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_feature_discovery@displa=
y-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_feature_discovery@display=
-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/703">Intel XE#703</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@kms_feature_discovery@displa=
y-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/703">Intel XE#703</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_feature_discovery@display=
-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2373">Intel XE#2373</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_feature_discovery@displ=
ay-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_feature_discovery@displa=
y-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1138">Intel XE#1138</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1138">Intel XE#1138</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_feature_discovery@displ=
ay-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1138">Intel XE#1138</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@kms_feature_discovery@dp-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1137">Intel XE#1137</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_feature_discovery@dp-mst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2375">Intel XE#2375</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_feature_discovery@dp-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1137">Intel XE#1137</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_feature_discovery@dp-mst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@kms_feature_discovery@psr1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1135">Intel XE#1135</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_feature_discovery@psr1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1135">Intel XE#1135</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired=
-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-v=
blank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired=
-vblank@bc-hdmi-a6-dp5.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-v=
blank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp5:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired=
-vblank@cd-hdmi-a6-dp5.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@kms_flip@2x-flip-vs-rmfb-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1421">Intel XE#1421</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@kms_flip@2x-nonexisting-fb-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/310">Intel XE#310</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_flip@bo-too-big-interrupt=
ible@a-edp1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1504">Intel XE#1504</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_flip@plain-flip-fb-recrea=
te@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">In=
tel XE#1401</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bp=
p-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel=
 XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/324">Intel XE#324</a>) +3 other tests dmesg-fail</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a>) +8 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-=
tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +7 other tests f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-=
tiling@pipe-c-hdmi-a-1-y-to-x.html">DMESG-FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +20 other =
tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_force_connector_basic@p=
rune-stale-modes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_force_connector_basic@pru=
ne-stale-modes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/352">Intel XE#352</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs=
-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +134 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +80 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +226 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_frontbuffer_tracking@dr=
rs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/651">Intel XE#651</a>) +167 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +64 other tests fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fb=
c-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +28 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1151">Intel XE#1151</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +81 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fb=
cdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/658">Intel XE#658</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1469">Intel XE#1469</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +166 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
psr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +79 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcp=
sr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_frontbuffer_tracking@pl=
ane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1158">Intel XE#1158</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_frontbuffer_tracking@pla=
ne-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1158">Intel XE#1158</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_frontbuffer_tracking@plan=
e-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +130 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +225 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@kms_getfb@getfb-reject-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2502">Intel XE#2502</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@kms_getfb@getfb-reject-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1341">Intel XE#1341</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/605">Intel XE#605</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@kms_getfb@getfb-reject-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_getfb@getfb2-accept-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_hdmi_inject@inject-4k.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1470">Intel XE#1470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1470">Intel XE#1470</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3544">Intel XE#3544</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_hdr@invalid-metadata-size=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1503">Intel XE#1503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@algo-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_histogram@algo-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3897">Intel XE#3897</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_histogram@algo-basic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3897">Intel XE#3897</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_histogram@algo-basic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3897">Intel XE#3897</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-6/igt@kms_histogram@algo-basic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3897">Intel XE#3897</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@global-color:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-6/igt@kms_histogram@global-color.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3898">Intel XE#3898</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_histogram@global-color.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3898">Intel XE#3898</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_invalid_mode@clock-too-hi=
gh.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1450">Intel XE#1450</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_invalid_mode@clock-too-hi=
gh@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1450">Intel XE#1450</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/346">Intel XE#346</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_joiner@basic-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/346">Intel XE#346</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@kms_joiner@basic-force-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2925">Intel XE#2925</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2934">Intel XE#2934</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_joiner@basic-force-ultr=
a-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2925">Intel XE#2925</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2934">Intel XE#2934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@kms_joiner@basic-ultra-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2927">Intel XE#2927</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2927">Intel XE#2927</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@kms_joiner@invalid-modeset-b=
ig-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/346">Intel XE#346</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@kms_joiner@invalid-modeset-bi=
g-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_joiner@invalid-modeset-f=
orce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3012">Intel XE#3012</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_joiner@invalid-modeset-=
ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2927">Intel XE#2927</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_joiner@invalid-modeset-ul=
tra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2927">Intel XE#2927</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@kms_multipipe_modeset@basic-=
max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_multipipe_modeset@basic=
-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@kms_panel_fitting@atomic-fast=
set.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@kms_plane@pixel-format.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1035">Intel XE#1035</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@kms_plane@pixel-format-sourc=
e-clamping@pipe-a-plane-0.html">WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>) +3 other tests warn<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_plane_lowres@tiling-x@pip=
e-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/599">Intel XE#599</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2493">Intel XE#2493</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2493">Intel XE#2493</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@kms_plane_scaling@intel-max-s=
rc-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +2 other tests fail</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@kms_plane_scaling@plane-down=
scale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-=
c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_plane_scaling@plane-downs=
cale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +89 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) =
+17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@kms_plane_scaling@planes-uni=
ty-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +26 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_plane_scaling@planes-up=
scale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +26 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +64 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@kms_pm_backlight@brightness-w=
ith-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2938">Intel XE#2938</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@kms_pm_backlight@brightness-=
with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2938">Intel XE#2938</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_pm_backlight@brightness=
-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_pm_backlight@fade.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870=
">Intel XE#870</a>) +3 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_pm_backlight@fade.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
0">Intel XE#870</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_pm_backlight@fade.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
70">Intel XE#870</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@kms_pm_dc@dc5-dpms-negative.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">I=
ntel XE#2392</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@kms_pm_dc@dc5-psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">=
Intel XE#1129</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"=
>Intel XE#1129</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">In=
tel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_pm_dc@dc5-retention-flo=
ps.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3309">Intel XE#3309</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_pm_dc@dc5-retention-flops=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3309">Intel XE#3309</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@kms_pm_dc@dc5-retention-flop=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">I=
ntel XE#1430</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325"=
>Intel XE#3325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_pm_dc@deep-pkgc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007=
">Intel XE#2007</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_pm_dc@deep-pkgc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505"=
>Intel XE#2505</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908=
">Intel XE#908</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029"=
>Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_pm_lpsp@kms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499=
">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_pm_rpm@cursor-dpms.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2446">Intel XE#2446</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@kms_pm_rpm@cursor-dpms.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
46">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@kms_pm_rpm@dpms-mode-unset-no=
n-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_pm_rpm@dpms-non-lpsp.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/836">Intel XE#836</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3141">Intel XE#3141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor=
-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +45 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@kms_psr2_sf@pr-overlay-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +45 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-=
move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-3/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1128">Intel XE#1128</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1122">Intel XE#1122</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@kms_psr2_su@page_flip-p010.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1122">Intel XE#1122</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2387">Intel XE#2387</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_psr@fbc-pr-cursor-blt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a>) +64 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-3/igt@kms_psr@pr-primary-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06">Intel XE#1406</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@kms_psr@psr-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">=
Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/929">Intel XE#929</a>) +79 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_psr@psr-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">=
Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/929">Intel XE#929</a>) +84 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_psr@psr2-primary-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@kms_psr_stress_test@flip-pri=
mary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_psr_stress_test@invalidat=
e-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_psr_stress_test@invalid=
ate-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-fo=
rmat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3414">Intel XE#3414</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2330">Intel XE#2330</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +10 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3414">Intel XE#3414</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1127">Intel XE#1127</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@kms_rotation_crc@sprite-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@kms_scaling_modes@scaling-mod=
e-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2413">Intel XE#2413</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_scaling_modes@scaling-mod=
e-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2413">Intel XE#2413</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/374">Intel XE#374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_scaling_modes@scaling-mod=
e-none@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/374">Intel XE#374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@kms_sequence@get-busy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/300=
7">Intel XE#3007</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_setmode@basic-clone-singl=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_setmode@invalid-clone-sin=
gle-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1435">Intel XE#1435</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@kms_sysfs_edid_timing.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
74">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@kms_tiled_display@basic-test=
-pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/362">Intel XE#362</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_tiled_display@basic-tes=
t-pattern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1729">Intel XE#1729</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/362">Intel XE#362</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_tiled_display@basic-tes=
t-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@kms_tv_load_detect@load-det=
ect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/330">Intel XE#330</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/330">Intel XE#330</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@kms_tv_load_detect@load-dete=
ct.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_universal_plane@cursor-fb=
-leak.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_vblank@ts-continuation-dp=
ms-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3864">Intel XE#3864</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@kms_vrr@cmrr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@kms_vrr@cmrr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Inte=
l XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@kms_vrr@flip-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455=
">Intel XE#455</a>) +136 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@kms_vrr@flip-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499=
">Intel XE#1499</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@kms_vrr@flipline.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">I=
ntel XE#455</a>) +95 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@kms_vrr@lobf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel=
 XE#2168</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@kms_vrr@negative-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
99">Intel XE#1499</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@kms_writeback@writeback-fb-=
id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/756">Intel XE#756</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@kms_writeback@writeback-fb-id=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/756">Intel XE#756</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@kms_writeback@writeback-inva=
lid-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/756">Intel XE#756</a>) +4 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@kms_writeback@writeback-inval=
id-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/756">Intel XE#756</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@sriov_basic@enable-vfs-autopr=
obe-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@sriov_basic@enable-vfs-bind=
-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other=
 test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@sriov_basic@enable-vfs-bind-u=
nbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_ccs@ctrl-surf-copy-new-c=
tx.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1130">Intel XE#1130</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@xe_ccs@large-ctrl-surf-copy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3576">Intel XE#3576</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@xe_ccs@suspend-resume.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/488">Intel XE#488</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@xe_compute@ccs-mode-basic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1447">Intel XE#1447</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@xe_compute@ccs-mode-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1447">Intel XE#1447</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_compute_preempt@compute-=
preempt-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@xe_copy_basic@mem-copy-linea=
r-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1123">Intel XE#1123</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-line=
ar-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1123">Intel XE#1123</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@xe_copy_basic@mem-set-linear=
-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1126">Intel XE#1126</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_copy_basic@mem-set-linea=
r-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1126">Intel XE#1126</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@xe_create@create-big-vram.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1062">Intel XE#1062</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@xe_create@create-big-vram.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1062">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@xe_create@multigpu-create-mas=
sive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-all-full-load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@xe_drm_fdinfo@utilization-al=
l-full-load.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3869">Intel XE#3869</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-full-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_drm_fdinfo@utilization-o=
thers-full-load.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3869">Intel XE#3869</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@xe_drm_fdinfo@utilization-oth=
ers-full-load.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3869">Intel XE#3869</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_eudebug@basic-close.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2905">Intel XE#2905</a>) +58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@xe_eudebug@basic-connect.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2905">Intel XE#2905</a>) +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-uf=
ence-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3889">Intel XE#3889</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-ufen=
ce-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3889">Intel XE#3889</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufen=
ce-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3889">Intel XE#3889</a>) +2 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@xe_eudebug@basic-vm-bind-ufe=
nce-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3889">Intel XE#3889</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@xe_eudebug_online@single-step=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2905">Intel XE#2905</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@xe_eudebug_online@single-ste=
p-one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2905">Intel XE#2905</a>) +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_evict@evict-beng-large-m=
ulti-vm-cm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1600">Intel XE#1600</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-m=
any-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-m=
any-threads-small.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@xe_evict@evict-beng-mixed-thr=
eads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1473">Intel XE#1473</a>) +3 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@xe_evict@evict-beng-threads-l=
arge-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/688">Intel XE#688</a>) +58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@xe_evict@evict-large-multi-vm=
-cm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2364">Intel XE#2364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_evict@evict-mixed-many-t=
hreads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@xe_evict@evict-mixed-threads-=
large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@xe_evict@evict-small-externa=
l-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/688">Intel XE#688</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@xe_evict@evict-threads-large.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@xe_evict_ccs@evict-overcommi=
t-parallel-instantfree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +8 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +38 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exe=
c-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1392">Intel XE#1392</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +50 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@xe_exec_fault_mode@many-bind=
execqueue-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +138 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-us=
erptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/288">Intel XE#288</a>) +137 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@xe_exec_mix_modes@exec-simpl=
e-batch-store-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_exec_mix_modes@exec-simp=
le-batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@xe_exec_reset@cat-error.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.h=
tml">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_huc_copy@huc_copy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
5">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_live_ktest@xe_bo.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/222=
9">Intel XE#2229</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/455">Intel XE#455</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@xe_live_ktest@xe_bo.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229=
">Intel XE#2229</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_ccs_mi=
grate_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3099">Intel XE#3099</a>) +2 other tests fail</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_live_ktest@xe_bo@xe_ccs_=
migrate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@xe_live_ktest@xe_eudebug.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2833">Intel XE#2833</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-6/igt@xe_live_ktest@xe_eudebug.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1192">Intel XE#1192</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3026">Intel XE#3026</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@xe_live_ktest@xe_migrate.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1192">Intel XE#1192</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@xe_live_ktest@xe_migrate@xe_=
validate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@xe_live_ktest@xe_mocs@xe_liv=
e_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_live_ktest@xe_mocs@xe_li=
ve_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_media_fill@media-fill.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/560">Intel XE#560</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@xe_media_fill@media-fill.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@xe_mmap@small-bar.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">I=
ntel XE#512</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@xe_mmap@small-bar.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">In=
tel XE#586</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@xe_mmap@small-bar.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">=
Intel XE#512</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@xe_mmap@small-bar.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">In=
tel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@xe_module_load@force-load.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2457">Intel XE#2457</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@xe_module_load@force-load.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/378">Intel XE#378</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_module_load@force-load.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/378">Intel XE#378</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-3/igt@xe_module_load@force-load.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@xe_module_load@many-reload.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2953">Intel XE#2953</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@xe_module_load@reload.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
546">Intel XE#3546</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@xe_module_load@reload.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/354=
6">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@xe_noexec_ping_pong.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/379"=
>Intel XE#379</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@xe_noexec_ping_pong.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">=
Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@xe_oa@mmio-triggered-reports=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3573">Intel XE#3573</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@xe_oa@oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
248">Intel XE#2248</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-str=
eam-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +40 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@xe_oa@unprivileged-single-ctx=
-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2248">Intel XE#2248</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@xe_pat@display-vs-wb-transie=
nt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1337">Intel XE#1337</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_pat@display-vs-wb-transi=
ent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@xe_pat@pat-index-xe2.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977=
">Intel XE#977</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_pat@pat-index-xe2.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/97=
7">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@xe_pat@pat-index-xehpc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/979">Intel XE#979</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/979">Intel XE#979</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2838">Intel XE#2838</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977=
">Intel XE#977</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
5">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@xe_pat@pat-index-xelpg.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
79">Intel XE#979</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
36">Intel XE#2236</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
979">Intel XE#979</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/97=
9">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@xe_peer2peer@read.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">=
Intel XE#1061</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@xe_peer2peer@read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">I=
ntel XE#2427</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@xe_peer2peer@read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">I=
ntel XE#1061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +3 other tests fail</l=
i>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@xe_pm@d3cold-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">=
Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/366">Intel XE#366</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@xe_pm@d3cold-mmap-system.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@xe_pm@d3cold-mocs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">=
Intel XE#2284</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_pm@d3cold-mocs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"=
>Intel XE#2284</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@xe_pm@d3cold-mocs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">I=
ntel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@xe_pm@d3hot-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/19=
48">Intel XE#1948</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@xe_pm@d3hot-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/194=
8">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@xe_pm@s2idle-d3cold-basic-ex=
ec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/366">Intel XE#366</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@xe_pm@s3-mocs.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel =
XE#584</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">In=
tel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_query@multigpu-query-eng=
ines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@xe_query@multigpu-query-inval=
id-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/igt@xe_query@multigpu-query-inva=
lid-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@xe_query@multigpu-query-inval=
id-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/944">Intel XE#944</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-gt-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@xe_query@query-gt-list.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
30">Intel XE#1130</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_sriov_flr@flr-vf1-clear.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3342">Intel XE#3342</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@xe_sriov_flr@flr-vf1-clear.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3342">Intel XE#3342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_wedged@wedged-mode-toggl=
e.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3075">Intel XE#3075</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-1/igt@xe_modu=
le_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-2/i=
gt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/sha=
rd-lnl-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57=
fb34ea/shard-lnl-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe=
3a0c3bfd57fb34ea/shard-lnl-2/igt@xe_module_load@load.html">DMESG-WARN</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadf=
a0af1d43fe3a0c3bfd57fb34ea/shard-lnl-7/igt@xe_module_load@load.html">DMESG-=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4=
276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-2/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-6/igt@xe_module_lo=
ad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-6/igt@xe=
_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-ln=
l-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34e=
a/shard-lnl-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3=
bfd57fb34ea/shard-lnl-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1=
d43fe3a0c3bfd57fb34ea/shard-lnl-3/igt@xe_module_load@load.html">DMESG-WARN<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276dd=
ceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-3/igt@xe_module_load@load.html">D=
MESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420=
-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-4/igt@xe_module_load@lo=
ad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-4/igt@xe_modu=
le_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-4/i=
gt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/sha=
rd-lnl-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57=
fb34ea/shard-lnl-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe=
3a0c3bfd57fb34ea/shard-lnl-8/igt@xe_module_load@load.html">DMESG-WARN</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadf=
a0af1d43fe3a0c3bfd57fb34ea/shard-lnl-1/igt@xe_module_load@load.html">DMESG-=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4=
276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-1/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-5/igt@xe_module_lo=
ad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-lnl-5/igt@xe=
_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-ln=
l-5/igt@xe_module_load@load.html">DMESG-WARN</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3899">Intel XE#3899</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-5/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14294=
4v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142944v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14294=
4v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142944v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-3/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14294=
4v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142944v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14294=
4v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142944v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-1/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14294=
4v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-8/igt@xe_module_=
load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142944v1/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-lnl-6=
/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-4/igt@xe_modu=
le_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-3/i=
gt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/sha=
rd-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57=
fb34ea/shard-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe=
3a0c3bfd57fb34ea/shard-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadf=
a0af1d43fe3a0c3bfd57fb34ea/shard-bmg-5/igt@xe_module_load@load.html">DMESG-=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4=
276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-8/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-8/igt@xe_module_lo=
ad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-8/igt@xe=
_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bm=
g-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34e=
a/shard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3=
bfd57fb34ea/shard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1=
d43fe3a0c3bfd57fb34ea/shard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276dd=
ceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-1/igt@xe_module_load@load.html">D=
MESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420=
-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-7/igt@xe_module_load@lo=
ad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-7/igt@xe_modu=
le_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-7/i=
gt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/sha=
rd-bmg-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57=
fb34ea/shard-bmg-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe=
3a0c3bfd57fb34ea/shard-bmg-5/igt@xe_module_load@load.html">DMESG-WARN</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadf=
a0af1d43fe3a0c3bfd57fb34ea/shard-bmg-5/igt@xe_module_load@load.html">DMESG-=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4=
276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-5/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-4/igt@xe_module_lo=
ad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bmg-4/igt@xe=
_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-bm=
g-4/igt@xe_module_load@load.html">DMESG-WARN</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3899">Intel XE#3899</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14294=
4v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142944v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14294=
4v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142944v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-1/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14294=
4v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@xe_module_=
load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142944v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-8/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14294=
4v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142944v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-7/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14294=
4v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142944v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#=
2457</a>)</li>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-1/igt@xe_mod=
ule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-1=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/s=
hard-adlp-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bf=
d57fb34ea/shard-adlp-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d=
43fe3a0c3bfd57fb34ea/shard-adlp-4/igt@xe_module_load@load.html">DMESG-WARN<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276dd=
ceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-4/igt@xe_module_load@load.html">=
DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-242=
0-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-3/igt@xe_module_load@=
load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-3/igt@xe_m=
odule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp=
-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea=
/shard-adlp-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3=
bfd57fb34ea/shard-adlp-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af=
1d43fe3a0c3bfd57fb34ea/shard-adlp-2/igt@xe_module_load@load.html">DMESG-WAR=
N</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276=
ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-2/igt@xe_module_load@load.html=
">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-8/igt@xe_module_loa=
d@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-2/igt@xe=
_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-ad=
lp-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34=
ea/shard-adlp-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0=
c3bfd57fb34ea/shard-adlp-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0=
af1d43fe3a0c3bfd57fb34ea/shard-adlp-9/igt@xe_module_load@load.html">DMESG-W=
ARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb42=
76ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-9/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-9/igt@xe_module_l=
oad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-adlp-6/igt@=
xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-=
adlp-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb=
34ea/shard-adlp-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3=
a0c3bfd57fb34ea/shard-adlp-6/igt@xe_module_load@load.html">DMESG-WARN</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3899">Intel=
 XE#3899</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-142944v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-8/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944=
v1/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142944v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adl=
p-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-1/igt@xe_module_load@load.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42944v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shar=
d-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-142944v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142944v1/shard-adlp-9/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944=
v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-4/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142944v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adl=
p-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42944v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-142944v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shar=
d-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-adlp-2/igt@xe_module_load@l=
oad.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/378">Intel XE#378</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-435/igt@xe_mo=
dule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-4=
35/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea=
/shard-dg2-435/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c=
3bfd57fb34ea/shard-dg2-435/igt@xe_module_load@load.html">DMESG-WARN</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0=
af1d43fe3a0c3bfd57fb34ea/shard-dg2-435/igt@xe_module_load@load.html">DMESG-=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4=
276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-435/igt@xe_module_load@load.=
html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-466/igt@xe_modul=
e_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-466/=
igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/sh=
ard-dg2-466/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bf=
d57fb34ea/shard-dg2-466/igt@xe_module_load@load.html">DMESG-WARN</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1=
d43fe3a0c3bfd57fb34ea/shard-dg2-466/igt@xe_module_load@load.html">DMESG-WAR=
N</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276=
ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-466/igt@xe_module_load@load.htm=
l">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-434/igt@xe_module_l=
oad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-434/igt=
@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard=
-dg2-434/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57=
fb34ea/shard-dg2-434/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d4=
3fe3a0c3bfd57fb34ea/shard-dg2-434/igt@xe_module_load@load.html">DMESG-WARN<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276dd=
ceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-434/igt@xe_module_load@load.html"=
>DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-24=
20-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-436/igt@xe_module_loa=
d@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-436/igt@x=
e_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-d=
g2-436/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb=
34ea/shard-dg2-436/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddceadfa0af1d43fe=
3a0c3bfd57fb34ea/shard-dg2-436/igt@xe_module_load@load.html">DMESG-WARN</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-bdb4276ddcea=
dfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-436/igt@xe_module_load@load.html">DM=
ESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2420-=
bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea/shard-dg2-436/igt@xe_module_load@l=
oad.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3899">Intel XE#3899</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142944v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1429=
44v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shar=
d-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-142944v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
944v1/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-142944v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/sha=
rd-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-466/igt@xe_module_loa=
d@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-142944v1/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-46=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2944v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-142944v1/shard-dg2-436/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/sh=
ard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142944v1/shard-dg2-435/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-142944v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#3=
78</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea -&gt; xe-pw-142=
944v1</li>
</ul>
<p>IGT_8172: 9112581619aa198fa03041d5c7e18e02f42ac00f @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2420-bdb4276ddceadfa0af1d43fe3a0c3bfd57fb34ea: bdb4276ddceadfa0af1d43f=
e3a0c3bfd57fb34ea<br />
  xe-pw-142944v1: 142944v1</p>

</body>
</html>

--===============3188949591297732479==--
