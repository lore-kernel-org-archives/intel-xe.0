Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217DBC197BF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 19:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D372D10EB75;
	Thu, 27 Feb 2025 19:36:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1162110EB73;
 Thu, 27 Feb 2025 19:36:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8434116148793954135=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Only_probe_stole?=
 =?utf-8?q?n_memory_when_display_support_is_enabled=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Feb 2025 19:36:38 -0000
Message-ID: <174068499805.2832425.519550871149097178@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250227145556.428738-1-dev@lankhorst.se>
In-Reply-To: <20250227145556.428738-1-dev@lankhorst.se>
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

--===============8434116148793954135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Only probe stolen memory when display support is enabled.
URL   : https://patchwork.freedesktop.org/series/145581/
State : failure

== Summary ==

CI Bug Log - changes from xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176_full -> xe-pw-145581v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-145581v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-145581v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-145581v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@xe_module_load@reload-no-display:
    - shard-lnl:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-lnl-6/igt@xe_module_load@reload-no-display.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-6/igt@xe_module_load@reload-no-display.html

  * igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_video_decode0:
    - shard-dg2-set2:     [PASS][5] -> [INCOMPLETE][6] +4 other tests incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_video_decode0.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-436/igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_video_decode0.html

  
Known issues
------------

  Here are the changes found in xe-pw-145581v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [PASS][7] -> [DMESG-WARN][8] ([Intel XE#4330]) +3 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          NOTRUN -> [FAIL][9] ([Intel XE#3719] / [Intel XE#911]) +3 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#3768])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-432/igt@kms_async_flips@invalid-async-flip-atomic.html
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#3768])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-4/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#3279])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2370])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#316]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#3658]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1124]) +14 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#316]) +6 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-270.html
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1407]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-3/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2327]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2328])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb.html
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1467])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#607])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1477])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1124]) +11 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][25] -> [DMESG-FAIL][26] ([Intel XE#4330]) +6 other tests dmesg-fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1124]) +10 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#619]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#607])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#1124]) +11 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#367]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2191]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2314] / [Intel XE#2894]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#2191]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#2191]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1512]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#367]) +4 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#367])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#367])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#787]) +71 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#2907]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#2669]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#455] / [Intel XE#787]) +47 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#2887]) +18 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2887]) +14 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#787]) +130 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][47] ([Intel XE#3862]) +1 other test incomplete
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#3432]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#3432]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#3442])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#3442])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#455] / [Intel XE#787]) +33 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#2907]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#4417] / [Intel XE#455])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-2/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#4417]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-2/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2325]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_chamelium_color@degamma.html
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#306]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@kms_chamelium_color@degamma.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#306]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#306]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-3/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#373]) +11 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-436/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#373]) +10 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2252]) +9 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#373]) +7 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][64] ([Intel XE#877]) +1 other test dmesg-warn
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2390])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#307])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@kms_content_protection@dp-mst-type-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#307])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#307])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-6/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#455]) +28 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_content_protection@legacy.html
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2341])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_content_protection@legacy.html
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][71] ([Intel XE#4330]) +2 other tests dmesg-fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-435/igt@kms_content_protection@legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#3278])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1424]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2320]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-128x128:
    - shard-dg2-set2:     [PASS][75] -> [INCOMPLETE][76] ([Intel XE#4148]) +1 other test incomplete
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-128x128.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-128x128.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#308])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#2321])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][79] -> [DMESG-WARN][80] ([Intel XE#2953])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#309]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2291]) +4 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-dg2-set2:     [PASS][83] -> [SKIP][84] ([Intel XE#309]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#2291]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#309]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#4302])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@kms_display_modes@extended-mode-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#4302])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2-set2:     [PASS][90] -> [SKIP][91] ([Intel XE#455])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_aux_dev:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#3009])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#4354])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-3/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#4356])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@kms_dp_link_training@uhbr-sst.html
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#4354])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@kms_dp_link_training@uhbr-sst.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#4356])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@kms_dp_link_training@uhbr-sst.html
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#4354])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#4331])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#4294])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-5/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#2244]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-3/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2244])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#776])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@kms_fbcon_fbt@psr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#776])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2373])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#703])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-435/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#310]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][107] -> [FAIL][108] ([Intel XE#301] / [Intel XE#3321])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2316]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1421]) +7 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#310]) +8 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [PASS][112] -> [SKIP][113] ([Intel XE#2316]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-8/igt@kms_flip@2x-plain-flip-interruptible.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2-set2:     [PASS][114] -> [SKIP][115] ([Intel XE#310]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-dg2-set2:     [PASS][116] -> [FAIL][117] ([Intel XE#2882])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-436/igt@kms_flip@blocking-wf_vblank.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@kms_flip@blocking-wf_vblank.html
    - shard-lnl:          [PASS][118] -> [FAIL][119] ([Intel XE#886]) +4 other tests fail
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-lnl-2/igt@kms_flip@blocking-wf_vblank.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][120] -> [FAIL][121] ([Intel XE#886])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-436/igt@kms_flip@blocking-wf_vblank@a-hdmi-a6.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@kms_flip@blocking-wf_vblank@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:
    - shard-bmg:          [PASS][122] -> [FAIL][123] ([Intel XE#2882]) +1 other test fail
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-2/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-2/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][124] -> [FAIL][125] ([Intel XE#301])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][126] ([Intel XE#2955]) +2 other tests dmesg-warn
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-bmg:          NOTRUN -> [FAIL][127] ([Intel XE#2882]) +2 other tests fail
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-2/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#1401]) +5 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [PASS][130] -> [DMESG-FAIL][131] ([Intel XE#324] / [Intel XE#4330]) +1 other test dmesg-fail
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][132] -> [DMESG-FAIL][133] ([Intel XE#324]) +1 other test dmesg-fail
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1401] / [Intel XE#1745]) +5 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][135] ([Intel XE#324] / [Intel XE#4330]) +1 other test dmesg-fail
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2293]) +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][137] ([Intel XE#4330]) +8 other tests dmesg-fail
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
    - shard-adlp:         NOTRUN -> [FAIL][138] ([Intel XE#1874])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#651]) +37 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#656]) +59 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#4141]) +15 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][142] -> [SKIP][143] ([Intel XE#656]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#651]) +24 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2311]) +27 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2312]) +23 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#651]) +22 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#1151])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#656]) +6 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#653]) +29 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#656]) +46 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#653]) +18 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#2313]) +27 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2502])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#1341])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@kms_getfb@getfb-reject-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#605])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#605])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-6/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#1503])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#1503])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-5/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#2934])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][161] ([Intel XE#2925])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#4090])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#4329])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#4359])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-432/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#4329])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][166] ([Intel XE#1035])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-3/igt@kms_plane@pixel-format.html

  * igt@kms_plane@pixel-format@pipe-a-plane-3:
    - shard-adlp:         NOTRUN -> [WARN][167] ([Intel XE#2078]) +1 other test warn
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-3/igt@kms_plane@pixel-format@pipe-a-plane-3.html

  * igt@kms_plane_alpha_blend@constant-alpha-mid:
    - shard-adlp:         [PASS][168] -> [DMESG-WARN][169] ([Intel XE#4173]) +3 other tests dmesg-warn
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-3/igt@kms_plane_alpha_blend@constant-alpha-mid.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@kms_plane_alpha_blend@constant-alpha-mid.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][170] -> [FAIL][171] ([Intel XE#616]) +1 other test fail
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][172] ([Intel XE#616]) +2 other tests fail
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#2393])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@kms_plane_lowres@tiling-yf.html
    - shard-lnl:          NOTRUN -> [SKIP][174] ([Intel XE#599])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-8/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#2493])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-3/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][176] ([Intel XE#2566] / [Intel XE#2705] / [Intel XE#4212])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#3307])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][178] ([Intel XE#2566] / [Intel XE#4212])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][179] ([Intel XE#2566] / [Intel XE#4330]) +1 other test dmesg-warn
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-d:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][180] ([Intel XE#2566] / [Intel XE#4330]) +1 other test dmesg-warn
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#2763]) +7 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html
    - shard-adlp:         NOTRUN -> [SKIP][182] ([Intel XE#2763]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][183] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - shard-dg2-set2:     [PASS][184] -> [DMESG-WARN][185] ([Intel XE#2566] / [Intel XE#4330]) +1 other test dmesg-warn
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][186] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#2763]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][188] ([Intel XE#2763]) +9 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][189] ([Intel XE#2938])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][190] ([Intel XE#870])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-7/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][191] ([Intel XE#2391])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-adlp:         NOTRUN -> [SKIP][192] ([Intel XE#1122])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#1122])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-lnl:          NOTRUN -> [SKIP][194] ([Intel XE#736])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][195] ([Intel XE#1129])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][196] ([Intel XE#3309])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-lnl:          NOTRUN -> [SKIP][197] ([Intel XE#3309])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-adlp:         NOTRUN -> [SKIP][198] ([Intel XE#3309])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-bmg:          NOTRUN -> [SKIP][199] ([Intel XE#3309])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][200] ([Intel XE#908])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html
    - shard-lnl:          NOTRUN -> [FAIL][201] ([Intel XE#1430])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
    - shard-adlp:         NOTRUN -> [FAIL][202] ([Intel XE#718])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@kms_pm_dc@dc6-dpms.html
    - shard-bmg:          NOTRUN -> [FAIL][203] ([Intel XE#1430])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][204] ([Intel XE#836]) +2 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-4/igt@kms_pm_rpm@dpms-non-lpsp.html
    - shard-lnl:          NOTRUN -> [SKIP][205] ([Intel XE#1439] / [Intel XE#3141]) +2 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-8/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [PASS][206] -> [DMESG-WARN][207] ([Intel XE#2042] / [Intel XE#4330])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_pm_rpm@system-suspend-modeset.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][208] ([Intel XE#1489]) +14 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][209] ([Intel XE#1489]) +16 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][210] ([Intel XE#2893]) +6 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][211] ([Intel XE#1489]) +11 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-sprite-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][212] ([Intel XE#1406]) +5 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-5/igt@kms_psr@fbc-pr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][213] ([Intel XE#2850] / [Intel XE#929]) +21 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][214] ([Intel XE#2850] / [Intel XE#929]) +23 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][215] ([Intel XE#2234] / [Intel XE#2850]) +18 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-2/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][216] ([Intel XE#3414] / [Intel XE#3904])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][217] ([Intel XE#3414])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][218] ([Intel XE#2330]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][219] ([Intel XE#3414] / [Intel XE#3904])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][220] ([Intel XE#1127])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-adlp:         NOTRUN -> [SKIP][221] ([Intel XE#1127]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][222] ([Intel XE#1127])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][223] ([Intel XE#3414])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][224] ([Intel XE#2413]) +2 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][225] ([Intel XE#1435])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html
    - shard-lnl:          NOTRUN -> [SKIP][226] ([Intel XE#1435])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-4/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-adlp:         NOTRUN -> [SKIP][227] ([Intel XE#362])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][228] ([Intel XE#330])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html
    - shard-lnl:          NOTRUN -> [SKIP][229] ([Intel XE#330])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-2/igt@kms_tv_load_detect@load-detect.html
    - shard-adlp:         NOTRUN -> [SKIP][230] ([Intel XE#330])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@kms_tv_load_detect@load-detect.html
    - shard-bmg:          NOTRUN -> [SKIP][231] ([Intel XE#2450])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [PASS][232] -> [DMESG-WARN][233] ([Intel XE#4330]) +10 other tests dmesg-warn
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][234] ([Intel XE#4330]) +9 other tests dmesg-warn
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@kms_vblank@query-busy@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][235] -> [DMESG-WARN][236] ([Intel XE#4330]) +11 other tests dmesg-warn
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-2/igt@kms_vblank@query-busy@pipe-d-hdmi-a-3.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_vblank@query-busy@pipe-d-hdmi-a-3.html

  * igt@kms_vrr@cmrr:
    - shard-adlp:         NOTRUN -> [SKIP][237] ([Intel XE#2168])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-3/igt@kms_vrr@cmrr.html
    - shard-bmg:          NOTRUN -> [SKIP][238] ([Intel XE#2168])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-8/igt@kms_vrr@cmrr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][239] ([Intel XE#2168])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-436/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][240] ([Intel XE#455]) +15 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_vrr@flipline.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][241] ([Intel XE#1499]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][242] ([Intel XE#1499])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-3/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][243] ([Intel XE#756]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_writeback@writeback-fb-id.html
    - shard-lnl:          NOTRUN -> [SKIP][244] ([Intel XE#756]) +2 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-3/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][245] ([Intel XE#756]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-bmg:          NOTRUN -> [SKIP][246] ([Intel XE#756]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][247] ([Intel XE#1091] / [Intel XE#2849])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-lnl:          NOTRUN -> [SKIP][248] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_ccs@suspend-resume:
    - shard-adlp:         NOTRUN -> [SKIP][249] ([Intel XE#455] / [Intel XE#488]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@xe_ccs@suspend-resume.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][250] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][251] ([Intel XE#1126])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-3/igt@xe_copy_basic@mem-set-linear-0x3fff.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][252] ([Intel XE#1126])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-isolation:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][253] ([Intel XE#4330]) +6 other tests dmesg-warn
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          NOTRUN -> [SKIP][254] ([Intel XE#2905]) +16 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-adlp:         NOTRUN -> [SKIP][255] ([Intel XE#3889])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
    - shard-bmg:          NOTRUN -> [SKIP][256] ([Intel XE#3889])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][257] ([Intel XE#3889])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
    - shard-lnl:          NOTRUN -> [SKIP][258] ([Intel XE#3889])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug@discovery-empty:
    - shard-adlp:         NOTRUN -> [SKIP][259] ([Intel XE#2905]) +17 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-lnl:          NOTRUN -> [SKIP][260] ([Intel XE#2905]) +13 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][261] ([Intel XE#2905]) +11 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][262] ([Intel XE#261] / [Intel XE#688]) +4 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][263] ([Intel XE#688]) +4 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
    - shard-adlp:         NOTRUN -> [SKIP][264] ([Intel XE#688]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-dg2-set2:     [PASS][265] -> [SKIP][266] ([Intel XE#1392]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][267] ([Intel XE#1392]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][268] ([Intel XE#1392]) +11 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][269] ([Intel XE#2322]) +10 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-7/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][270] ([Intel XE#1392]) +14 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][271] ([Intel XE#288]) +33 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][272] ([Intel XE#288]) +28 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][273] ([Intel XE#2360])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][274] ([Intel XE#2360])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][275] ([Intel XE#2833])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_oa@non-zero-reason:
    - shard-adlp:         NOTRUN -> [SKIP][276] ([Intel XE#2541] / [Intel XE#3573]) +8 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@xe_oa@non-zero-reason.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][277] ([Intel XE#2541] / [Intel XE#3573]) +6 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-432/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-adlp:         NOTRUN -> [SKIP][278] ([Intel XE#2838] / [Intel XE#979])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][279] ([Intel XE#977])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@xe_pat@pat-index-xelp.html
    - shard-bmg:          NOTRUN -> [SKIP][280] ([Intel XE#2245])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][281] ([Intel XE#2236])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][282] ([Intel XE#2284])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][283] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-8/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [PASS][284] -> [DMESG-WARN][285] ([Intel XE#4330] / [Intel XE#569]) +4 other tests dmesg-warn
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-436/igt@xe_pm@s3-basic-exec.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][286] ([Intel XE#2284] / [Intel XE#366]) +2 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-2/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-lnl:          NOTRUN -> [SKIP][287] ([Intel XE#584])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-5/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          [PASS][288] -> [DMESG-WARN][289] ([Intel XE#4330] / [Intel XE#569]) +1 other test dmesg-warn
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-4/igt@xe_pm@s3-multiple-execs.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][290] ([Intel XE#4330] / [Intel XE#569])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [ABORT][291] ([Intel XE#4268])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@xe_pm@s4-d3hot-basic-exec.html
    - shard-bmg:          NOTRUN -> [ABORT][292] ([Intel XE#4268]) +1 other test abort
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-lnl:          NOTRUN -> [SKIP][293] ([Intel XE#944])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@xe_query@multigpu-query-mem-usage.html
    - shard-adlp:         NOTRUN -> [SKIP][294] ([Intel XE#944])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     NOTRUN -> [SKIP][295] ([Intel XE#944])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@xe_query@multigpu-query-oa-units.html
    - shard-bmg:          NOTRUN -> [SKIP][296] ([Intel XE#944])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-2/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          NOTRUN -> [SKIP][297] ([Intel XE#4130]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-lnl:          NOTRUN -> [SKIP][298] ([Intel XE#4130]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][299] ([Intel XE#4130])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-lnl:          NOTRUN -> [SKIP][300] ([Intel XE#3342])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-5/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          NOTRUN -> [SKIP][301] ([Intel XE#4273])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Possible fixes ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-adlp:         [DMESG-WARN][302] -> [PASS][303] +2 other tests pass
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [DMESG-FAIL][304] ([Intel XE#4330]) -> [PASS][305] +6 other tests pass
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][306] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][307]
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][308] -> [PASS][309] +1 other test pass
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [DMESG-WARN][310] ([Intel XE#4199]) -> [PASS][311]
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#309]) -> [PASS][313] +3 other tests pass
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][314] ([Intel XE#2291]) -> [PASS][315] +3 other tests pass
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#4354]) -> [PASS][317]
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][318] ([Intel XE#3321]) -> [PASS][319] +3 other tests pass
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#310]) -> [PASS][321] +3 other tests pass
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][322] ([Intel XE#2316]) -> [PASS][323] +2 other tests pass
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          [FAIL][324] ([Intel XE#886]) -> [PASS][325] +1 other test pass
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-adlp:         [FAIL][326] ([Intel XE#301]) -> [PASS][327] +1 other test pass
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [DMESG-WARN][328] ([Intel XE#2955]) -> [PASS][329]
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
    - shard-dg2-set2:     [INCOMPLETE][330] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][331]
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-dg2-set2:     [FAIL][332] ([Intel XE#2882]) -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_flip@plain-flip-fb-recreate.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@a-dp4:
    - shard-dg2-set2:     [FAIL][334] -> [PASS][335] +2 other tests pass
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_flip@plain-flip-fb-recreate@a-dp4.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@kms_flip@plain-flip-fb-recreate@a-dp4.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
    - shard-adlp:         [FAIL][336] ([Intel XE#886]) -> [PASS][337] +2 other tests pass
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-2/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#656]) -> [PASS][339] +4 other tests pass
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-adlp:         [DMESG-WARN][340] ([Intel XE#2953]) -> [PASS][341]
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#4328]) -> [PASS][343]
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_lease@lease-uevent:
    - shard-bmg:          [DMESG-WARN][344] ([Intel XE#4330]) -> [PASS][345] +17 other tests pass
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-8/igt@kms_lease@lease-uevent.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_lease@lease-uevent.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [DMESG-WARN][346] ([Intel XE#2566] / [Intel XE#4330]) -> [PASS][347] +1 other test pass
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][348] ([Intel XE#718]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2-set2:     [DMESG-WARN][350] ([Intel XE#2042] / [Intel XE#4330]) -> [PASS][351]
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-434/igt@kms_pm_rpm@drm-resources-equal.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [DMESG-WARN][352] -> [PASS][353]
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html
    - shard-dg2-set2:     [DMESG-WARN][354] -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-dg2-set2:     [DMESG-WARN][356] ([Intel XE#4330]) -> [PASS][357] +26 other tests pass
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#1392]) -> [PASS][359] +3 other tests pass
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][360], [PASS][361], [SKIP][362], [PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374], [PASS][375], [PASS][376], [PASS][377], [PASS][378], [PASS][379], [PASS][380], [PASS][381], [PASS][382], [PASS][383], [PASS][384], [PASS][385]) ([Intel XE#378]) -> ([PASS][386], [PASS][387], [PASS][388], [PASS][389], [PASS][390], [PASS][391], [PASS][392], [PASS][393], [PASS][394], [PASS][395], [PASS][396], [PASS][397], [PASS][398], [PASS][399], [PASS][400], [PASS][401], [PASS][402], [PASS][403], [PASS][404], [PASS][405], [PASS][406], [PASS][407], [PASS][408], [PASS][409], [PASS][410])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@xe_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@xe_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-436/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-436/igt@xe_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-436/igt@xe_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@xe_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@xe_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-434/igt@xe_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@xe_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@xe_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-436/igt@xe_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432/igt@xe_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432/igt@xe_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432/igt@xe_module_load@load.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432/igt@xe_module_load@load.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-434/igt@xe_module_load@load.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@xe_module_load@load.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@xe_module_load@load.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@xe_module_load@load.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-434/igt@xe_module_load@load.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@xe_module_load@load.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@xe_module_load@load.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@xe_module_load@load.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@xe_module_load@load.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@xe_module_load@load.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@xe_module_load@load.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@xe_module_load@load.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-436/igt@xe_module_load@load.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-436/igt@xe_module_load@load.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-436/igt@xe_module_load@load.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-435/igt@xe_module_load@load.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-435/igt@xe_module_load@load.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-432/igt@xe_module_load@load.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@xe_module_load@load.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-435/igt@xe_module_load@load.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@xe_module_load@load.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@xe_module_load@load.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@xe_module_load@load.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@xe_module_load@load.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@xe_module_load@load.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@xe_module_load@load.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@xe_module_load@load.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@xe_module_load@load.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@xe_module_load@load.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@xe_module_load@load.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-432/igt@xe_module_load@load.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@xe_module_load@load.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@xe_module_load@load.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@xe_module_load@load.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@xe_module_load@load.html

  * igt@xe_pm@s2idle-mocs:
    - shard-adlp:         [DMESG-WARN][411] ([Intel XE#4173]) -> [PASS][412]
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-8/igt@xe_pm@s2idle-mocs.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s3-basic:
    - shard-bmg:          [DMESG-WARN][413] ([Intel XE#4330] / [Intel XE#569]) -> [PASS][414] +1 other test pass
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-1/igt@xe_pm@s3-basic.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@xe_pm@s3-basic.html
    - shard-dg2-set2:     [DMESG-WARN][415] ([Intel XE#4330] / [Intel XE#569]) -> [PASS][416] +1 other test pass
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@xe_pm@s3-basic.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@xe_pm@s3-basic.html

  
#### Warnings ####

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][418] ([Intel XE#787]) +6 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#787]) -> [SKIP][420] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][421] ([Intel XE#1178]) -> [SKIP][422] ([Intel XE#2341])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-7/igt@kms_content_protection@atomic.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_content_protection@atomic.html
    - shard-dg2-set2:     [FAIL][423] ([Intel XE#1178]) -> [SKIP][424] ([Intel XE#455])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_content_protection@atomic.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [DMESG-FAIL][425] ([Intel XE#4330]) -> [FAIL][426] ([Intel XE#1178]) +1 other test fail
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          [DMESG-FAIL][427] ([Intel XE#4330]) -> [FAIL][428] ([Intel XE#1178]) +1 other test fail
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-8/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-dg2-set2:     [DMESG-WARN][429] ([Intel XE#4330]) -> [SKIP][430] ([Intel XE#309])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][431] ([Intel XE#877]) -> [SKIP][432] ([Intel XE#2291])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][433] ([i915#3804]) -> [SKIP][434] ([Intel XE#455] / [i915#3804])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-bmg:          [DMESG-WARN][435] ([Intel XE#4330]) -> [SKIP][436] ([Intel XE#2316])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-1/igt@kms_flip@2x-flip-vs-modeset.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-bmg:          [DMESG-WARN][437] ([Intel XE#2955]) -> [SKIP][438] ([Intel XE#2316])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-1/igt@kms_flip@2x-flip-vs-rmfb.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][439] ([Intel XE#4330]) -> [FAIL][440] ([Intel XE#301])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#656]) -> [SKIP][442] ([Intel XE#651]) +7 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#651]) -> [SKIP][444] ([Intel XE#656]) +5 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][445] ([Intel XE#2312]) -> [SKIP][446] ([Intel XE#4141]) +1 other test skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][447] ([Intel XE#4141]) -> [SKIP][448] ([Intel XE#2312]) +4 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][449] ([Intel XE#2311]) -> [SKIP][450] ([Intel XE#2312]) +9 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][451] ([Intel XE#2312]) -> [SKIP][452] ([Intel XE#2311]) +7 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][453] ([Intel XE#2312]) -> [SKIP][454] ([Intel XE#2313]) +5 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#653]) -> [SKIP][456] ([Intel XE#656]) +5 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#656]) -> [SKIP][458] ([Intel XE#653]) +4 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][459] ([Intel XE#2313]) -> [SKIP][460] ([Intel XE#2312]) +9 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][461] ([Intel XE#3544]) -> [SKIP][462] ([Intel XE#3374] / [Intel XE#3544])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][463], [PASS][464], [DMESG-WARN][465], [PASS][466], [PASS][467], [PASS][468], [PASS][469], [PASS][470], [PASS][471], [SKIP][472], [PASS][473], [PASS][474], [PASS][475], [PASS][476], [PASS][477], [PASS][478], [PASS][479], [PASS][480], [PASS][481], [PASS][482], [PASS][483], [PASS][484], [PASS][485], [PASS][486], [PASS][487], [PASS][488]) ([Intel XE#378] / [Intel XE#4173]) -> ([PASS][489], [PASS][490], [PASS][491], [PASS][492], [PASS][493], [PASS][494], [PASS][495], [PASS][496], [SKIP][497], [PASS][498], [PASS][499], [PASS][500], [PASS][501], [PASS][502], [PASS][503], [PASS][504], [PASS][505], [PASS][506], [PASS][507], [PASS][508], [PASS][509], [PASS][510], [PASS][511], [PASS][512], [PASS][513], [PASS][514]) ([Intel XE#378])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-1/igt@xe_module_load@load.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-1/igt@xe_module_load@load.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-6/igt@xe_module_load@load.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-4/igt@xe_module_load@load.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-4/igt@xe_module_load@load.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-8/igt@xe_module_load@load.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-8/igt@xe_module_load@load.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-2/igt@xe_module_load@load.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-4/igt@xe_module_load@load.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-4/igt@xe_module_load@load.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-6/igt@xe_module_load@load.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-6/igt@xe_module_load@load.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-6/igt@xe_module_load@load.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-3/igt@xe_module_load@load.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-2/igt@xe_module_load@load.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-2/igt@xe_module_load@load.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-3/igt@xe_module_load@load.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-3/igt@xe_module_load@load.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-8/igt@xe_module_load@load.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-4/igt@xe_module_load@load.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-8/igt@xe_module_load@load.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-9/igt@xe_module_load@load.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-1/igt@xe_module_load@load.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-9/igt@xe_module_load@load.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-9/igt@xe_module_load@load.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-3/igt@xe_module_load@load.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@xe_module_load@load.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@xe_module_load@load.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@xe_module_load@load.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@xe_module_load@load.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@xe_module_load@load.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-2/igt@xe_module_load@load.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-2/igt@xe_module_load@load.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-2/igt@xe_module_load@load.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-2/igt@xe_module_load@load.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-4/igt@xe_module_load@load.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-4/igt@xe_module_load@load.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-3/igt@xe_module_load@load.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@xe_module_load@load.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@xe_module_load@load.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@xe_module_load@load.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@xe_module_load@load.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-4/igt@xe_module_load@load.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@xe_module_load@load.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@xe_module_load@load.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@xe_module_load@load.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@xe_module_load@load.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@xe_module_load@load.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@xe_module_load@load.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-3/igt@xe_module_load@load.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-3/igt@xe_module_load@load.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-3/igt@xe_module_load@load.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
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
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4148]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4148
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4199]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4199
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8250 -> IGT_8251
  * Linux: xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176 -> xe-pw-145581v1

  IGT_8250: 43a53635da9a5ecb1a9ca189cb15df2c0b78bd38 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8251: f0b66883398b4a07bb8fcaa3663a2140129d9a58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176: 2a3ff290a74cd6294c39faafae2f6033694f1176
  xe-pw-145581v1: 145581v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/index.html

--===============8434116148793954135==
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
<tr><td><b>Series:</b></td><td>drm/xe: Only probe stolen memory when displa=
y support is enabled.</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/145581/">https://patchwork.freedesktop.org/series/145581/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-145581v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-145581v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2725-2a3ff290a74cd6294c39faafae2f60336=
94f1176_full -&gt; xe-pw-145581v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-145581v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-145581v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1455=
81v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-=
9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html">DMESG-=
WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-lnl-6/igt@xe_modul=
e_load@reload-no-display.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-6/igt@xe_module_load@reloa=
d-no-display.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_video_decode0=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@xe_pmu=
@engine-activity-idle@engine-drm_xe_engine_class_video_decode0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v=
1/shard-dg2-436/igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_=
video_decode0.html">INCOMPLETE</a> +4 other tests incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-145581v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-9/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@km=
s_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#433=
0</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-5/igt@kms_async_flips@async-flip-wi=
th-page-flip-events-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3719">Intel XE#3719</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 othe=
r tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-432/igt@kms_async_flips@invalid-asy=
nc-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3768">Intel XE#3768</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-4/igt@kms_async_flips@invalid-async=
-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-6/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-7/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>) +6 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-3/igt@kms_big_fb@linear-32bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@kms_big_fb@x-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2328">Intel XE#2328</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-si=
ze-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size=
-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-3/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/s=
hard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-asy=
nc-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4330">Intel XE#4330</a>) +6 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-8bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/619">Intel XE#619</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb-si=
ze-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@kms_bw@connected-linear-tili=
ng-1-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_bw@connected-linear-tilin=
g-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_bw@connected-linear-tilin=
g-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +3 other=
 tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_bw@connected-linear-tili=
ng-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +4 other tests skip</=
li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_bw@connected-linear-til=
ing-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</=
li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_bw@connected-linear-tilin=
g-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@kms_bw@linear-tiling-1-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@kms_bw@linear-tiling-3-disp=
lays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_bw@linear-tiling-3-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-t=
iled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +71 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-t=
iled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-til=
ed-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-3/igt@kms_ccs@ccs-on-another-bo-4-=
tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +47 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-5/igt@kms_ccs@ccs-on-another-bo-4-t=
iled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-t=
iled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +130 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4=
-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend=
-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-2/igt@kms_cdclk@mode-transition.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4417">Intel XE#4417</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-2/igt@kms_cdclk@mode-transition@pi=
pe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4417">Intel XE#4417</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_chamelium_color@degamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2325">Intel XE#2325</a>) +2 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@kms_chamelium_color@degamma.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_chamelium_color@degamma=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-3/igt@kms_chamelium_color@gamma.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-436/igt@kms_chamelium_edid@hdmi-mod=
e-timings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/373">Intel XE#373</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-afte=
r-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-ena=
ble-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_color@ctm-0-75@pipe-b-hdm=
i-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_content_protection@dp-mst=
-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2390">Intel XE#2390</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@kms_content_protection@dp-ms=
t-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@kms_content_protection@dp-m=
st-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-6/igt@kms_content_protection@dp-mst=
-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_content_protection@legac=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a>) +28 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_content_protection@legacy=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2341">Intel XE#2341</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-435/igt@kms_content_protection@lega=
cy.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4330">Intel XE#4330</a>) +2 other tests dmesg-fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@kms_content_protection@legacy=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-m=
ovement-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1424">Intel XE#1424</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-m=
ovement-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x128:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@kms_cu=
rsor_crc@cursor-sliding-128x128.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-436/igt@kms_cursor_=
crc@cursor-sliding-128x128.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4148">Intel XE#4148</a>) +1 other test=
 incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_cursor_crc@cursor-slidin=
g-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-1/igt@kms_cur=
sor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@kms_c=
ursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@kms_cursor_legacy@2x-nonblock=
ing-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_cu=
rsor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@k=
ms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-1/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@kms_cursor_=
legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs=
-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@kms_display_modes@extended-m=
ode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4302">Intel XE#4302</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-6/igt@kms_display_modes@extended-mo=
de-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_dither@fb-8b=
pc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_dp_aux_dev.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Int=
el XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-3/igt@kms_dp_link_training@non-uhb=
r-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@kms_dp_link_training@uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4356">Intel XE#4356</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@kms_dp_link_training@uhbr-sst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@kms_dp_link_training@uhbr-s=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4356">Intel XE#4356</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_dp_link_training@uhbr-sst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-2/igt@kms_dp_linktrain_fallback@dp=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4331">Intel XE#4331</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-5/igt@kms_dp_linktrain_fallback@dp-=
fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-3/igt@kms_dsc@dsc-with-formats.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_dsc@dsc-with-output-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@kms_fbcon_fbt@psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">I=
ntel XE#776</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_fbcon_fbt@psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">=
Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_feature_discovery@display=
-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-435/igt@kms_feature_discovery@displ=
ay-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-of=
f-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/sha=
rd-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset-v=
s-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-3/igt@kms_flip@2x-flip-vs-suspend-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1421">Intel XE#1421</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@kms_flip@2x-plain-flip.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
10">Intel XE#310</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-8/igt@kms_flip=
@2x-plain-flip-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@kms_flip@2x-plai=
n-flip-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_fl=
ip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464=
/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel X=
E#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-436/igt@kms_fl=
ip@blocking-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@kms_flip@blocking-wf_=
vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2882">Intel XE#2882</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-lnl-2/igt@kms_flip=
@blocking-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@kms_flip@blocking-wf_vbla=
nk.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/886">Intel XE#886</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-436/igt@kms_fl=
ip@blocking-wf_vblank@a-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@kms_flip@bl=
ocking-wf_vblank@a-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-2/igt@kms_flip=
@flip-vs-blocking-wf-vblank@a-dp2.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-2/igt@kms_flip@fl=
ip-vs-blocking-wf-vblank@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-4=
63/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Int=
el XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend-in=
terruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2955">Intel XE#2955</a>) +2 other tests dmesg-warn</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-2/igt@kms_flip@plain-flip-ts-check.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-8/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shar=
d-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscalin=
g.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/324">Intel XE#324</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +1 other test dmesg-fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-9/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-145581v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bp=
p-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 o=
ther test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>) +5 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#43=
30</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-=
tiling@pipe-b-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +8 other t=
ests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-=
tiling@pipe-c-hdmi-a-1-x-to-y.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +37 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +59 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +15 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/sha=
rd-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap=
-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +24 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +27 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +23 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc=
drrs-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-435/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +29 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +46 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-3/igt@kms_frontbuffer_tracking@psr=
-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/653">Intel XE#653</a>) +18 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-=
rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2502">Intel XE#2502</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@kms_getfb@getfb-reject-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1341">Intel XE#1341</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/605">Intel XE#605</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-6/igt@kms_getfb@getfb-reject-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"=
>Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-5/igt@kms_hdr@static-toggle.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/150=
3">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@kms_joiner@switch-modeset-ul=
tra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-2/igt@kms_joiner@switch-modeset-ult=
ra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-8/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4329">Intel XE#4329</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-432/igt@kms_pipe_stress@stress-xrgb=
8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4359">Intel XE#4359</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-4/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-3/igt@kms_plane@pixel-format.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-a-plane-3:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-3/igt@kms_plane@pixel-format@pipe-=
a-plane-3.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2078">Intel XE#2078</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-3/igt@kms_pla=
ne_alpha_blend@constant-alpha-mid.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@kms_plane_=
alpha_blend@constant-alpha-mid.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +3 other =
tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_pl=
ane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-436/igt@=
kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)=
 +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2393">Intel XE#2393</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-8/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-3/igt@kms_plane_multiple@tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_plane_scaling@intel-max=
-src-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</l=
i>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_plane_scaling@intel-max-s=
rc-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-435/igt@kms_plane_scaling@plane-dow=
nscale-factor-0-75-with-pixel-format.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE=
#4330</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe=
-d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_plane_scaling@plane-downs=
cale-factor-0-75-with-pixel-format@pipe-d.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Int=
el XE#4330</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_plane_scaling@planes-down=
scale-factor-0-25-upscale-20x20@pipe-a.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 othe=
r tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-25-upscale-20x20@pipe-a.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_pl=
ane_scaling@planes-upscale-20x20.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@kms_plane_=
scaling@planes-upscale-20x20.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a=
>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-435/igt@kms_plane_scaling@planes-up=
scale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-435/igt@kms_plane_scaling@planes-up=
scale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_pm_backlight@brightness-=
with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-7/igt@kms_pm_backlight@fade.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870=
">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2391">Intel XE#2391</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_pm_dc@dc3co-vpb-simulati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1122">Intel XE#1122</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulat=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1122">Intel XE#1122</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_pm_dc@dc5-psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"=
>Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flo=
ps.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3309">Intel XE#3309</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@kms_pm_dc@dc5-retention-flops=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3309">Intel XE#3309</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_pm_dc@dc5-retention-flop=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3309">Intel XE#3309</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908"=
>Intel XE#908</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">=
Intel XE#1430</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@kms_pm_dc@dc6-dpms.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">=
Intel XE#718</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_pm_dc@dc6-dpms.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">=
Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-4/igt@kms_pm_rpm@dpms-non-lpsp.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/836">Intel XE#836</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-8/igt@kms_pm_rpm@dpms-non-lpsp.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3141">Intel XE#3141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_pm=
_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_pm_rpm@syst=
em-suspend-modeset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2042">Intel XE#2042</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@kms_psr2_sf@pr-overlay-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +16 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_psr2_sf@pr-plane-move-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2893">Intel XE#2893</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-pr=
imary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +11 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-5/igt@kms_psr@fbc-pr-sprite-plane-m=
ove.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1406">Intel XE#1406</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-re=
nder.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@kms_psr@pr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929">Intel XE#929</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-2/igt@kms_psr@psr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-2/igt@kms_rotation_crc@primary-4-ti=
led-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_rotation_crc@primary-ro=
tation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-7/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2330">Intel XE#2330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_rotation_crc@sprite-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-2/igt@kms_scaling_modes@scaling-mod=
e-center.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2413">Intel XE#2413</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-8/igt@kms_setmode@basic-clone-singl=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1435">Intel XE#1435</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-4/igt@kms_setmode@basic-clone-singl=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-4/igt@kms_tiled_display@basic-test=
-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@kms_tv_load_detect@load-det=
ect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/330">Intel XE#330</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-2/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/330">Intel XE#330</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@kms_tv_load_detect@load-dete=
ct.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/330">Intel XE#330</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432/igt@kms_un=
iversal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_universal_=
plane@cursor-fb-leak.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +10 other tests dme=
sg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_universal_plane@cursor-=
fb-leak@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +9 other tests d=
mesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-2/igt@kms_vbla=
nk@query-busy@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_vblank@quer=
y-busy@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +11 other tests d=
mesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-3/igt@kms_vrr@cmrr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel=
 XE#2168</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-8/igt@kms_vrr@cmrr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-436/igt@kms_vrr@cmrr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Inte=
l XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_vrr@flipline.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">I=
ntel XE#455</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@kms_vrr@max-min.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-3/igt@kms_vrr@negative-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
99">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_writeback@writeback-fb-=
id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/756">Intel XE#756</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-3/igt@kms_writeback@writeback-fb-id=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/756">Intel XE#756</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@kms_writeback@writeback-inva=
lid-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/756">Intel XE#756</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_writeback@writeback-inval=
id-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@sriov_basic@enable-vfs-bind=
-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@sriov_basic@enable-vfs-bind-u=
nbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@xe_ccs@suspend-resume.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/488">Intel XE#488</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@xe_compute_preempt@compute-=
preempt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-3/igt@xe_copy_basic@mem-set-linear=
-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1126">Intel XE#1126</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linea=
r-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-isolation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@xe_drm_fdinfo@utilization-sin=
gle-full-load-isolation.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +6 other tests d=
mesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@xe_eudebug@basic-read-event.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2905">Intel XE#2905</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@xe_eudebug@basic-vm-bind-ufe=
nce-sigint-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufen=
ce-sigint-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-uf=
ence-sigint-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-ufen=
ce-sigint-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@xe_eudebug@discovery-empty.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2905">Intel XE#2905</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@xe_eudebug@discovery-empty-cl=
ients.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2905">Intel XE#2905</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@xe_eudebug_online@writes-ca=
ching-sram-bb-vram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +11 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@xe_evict@evict-small-externa=
l-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit=
-parallel-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-4/igt@xe_evict_ccs@evict-overcommi=
t-parallel-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-null.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-432/=
igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#=
1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many=
-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exe=
c-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-7/igt@xe_exec_basic@multigpu-once-b=
asic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2322">Intel XE#2322</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +14 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-2/igt@xe_exec_fault_mode@many-user=
ptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +33 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-in=
valid-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/288">Intel XE#288</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@xe_exec_mix_modes@exec-spinn=
er-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-spin=
ner-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@xe_live_ktest@xe_eudebug.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@xe_oa@non-zero-reason.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
41">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3573">Intel XE#3573</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-432/igt@xe_oa@syncs-userptr-wait-cf=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3573">Intel XE#3573</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@xe_pat@pat-index-xehpc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977=
">Intel XE#977</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
5">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
36">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@xe_pm@d3cold-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">=
Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-8/igt@xe_pm@d3cold-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-436/igt@xe_pm@=
s3-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@xe_pm@s3-basic-exec.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4330">Intel XE#4330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/569">Intel XE#569</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-2/igt@xe_pm@s3-d3cold-basic-exec.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/366">Intel XE#366</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-5/igt@xe_pm@s3-exec-after.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">=
Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-4/igt@xe_pm@s3=
-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-1/igt@xe_pm@s3-multiple-execs.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4330">Intel XE#4330</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/569">Intel XE#569</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@xe_pm@s3-vm-bind-prefetch.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4330">Intel XE#4330</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@xe_pm@s4-d3hot-basic-exec.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4268">Intel XE#4268</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@xe_pm@s4-d3hot-basic-exec.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4268">Intel XE#4268</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@xe_query@multigpu-query-mem-u=
sage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@xe_query@multigpu-query-mem-=
usage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@xe_query@multigpu-query-oa-=
units.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-2/igt@xe_query@multigpu-query-oa-un=
its.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@xe_sriov_auto_provisioning@ex=
clusive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-7/igt@xe_sriov_auto_provisioning@fa=
ir-allocation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@xe_sriov_auto_provisioning@=
selfconfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-lnl-5/igt@xe_sriov_flr@flr-each-isolati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@xe_sriov_flr@flr-vfs-parallel=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-2/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">DMESG-WARN</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-ad=
lp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</=
a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-6/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#433=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145=
581v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hfli=
p.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-145581v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-436/igt@kms_cc=
s@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shar=
d-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4199">Intel XE#4199</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/=
shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel=
 XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-145581v1/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-tra=
nsitions-varying-size.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-145581v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-trans=
itions-varying-size.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_dp=
_link_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@k=
ms_dp_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#=
3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
145581v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@b=
c-dp2-hdmi-a3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_fl=
ip@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_flip@2=
x-nonexisting-fb.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-4/igt@kms_flip=
@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel=
 XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-145581v1/shard-bmg-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-=
modeset-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-lnl-8/igt@kms_flip=
@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-6/ig=
t@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-8/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp=
-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-1/igt@kms_flip=
@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_flip=
@flip-vs-suspend.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@kms_fl=
ip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg=
2-464/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_fl=
ip@plain-flip-fb-recreate.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@kms=
_flip@plain-flip-fb-recreate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_fl=
ip@plain-flip-fb-recreate@a-dp4.html">FAIL</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@kms_flip@pl=
ain-flip-fb-recreate@a-dp4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-2/igt@kms_fli=
p@wf_vblank-ts-check@a-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@k=
ms_flip@wf_vblank-ts-check@a-hdmi-a1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581=
v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-=
blt.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-=
2/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_jo=
iner@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4328">Intel XE#4328</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@k=
ms_joiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-8/igt@kms_leas=
e@lease-uevent.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_lease@=
lease-uevent.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@kms_pl=
ane_scaling@plane-upscale-factor-0-25-with-rotation.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel X=
E#2566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4330">Intel XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@kms_plane_scaling@plane-upscale-=
factor-0-25-with-rotation.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-lnl-4/igt@kms_pm_d=
c@dc5-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-145581v1/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-434/igt@kms_pm=
_rpm@drm-resources-equal.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/sh=
ard-dg2-433/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-8/igt@kms_pm_r=
pm@modeset-stress-extra-wait.html">DMESG-WARN</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-4/igt@kms_pm_rpm=
@modeset-stress-extra-wait.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_pm=
_rpm@modeset-stress-extra-wait.html">DMESG-WARN</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@kms_pm=
_rpm@modeset-stress-extra-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@xe_evi=
ct_ccs@evict-overcommit-standalone-instantfree-reopen.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel=
 XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-145581v1/shard-dg2-434/igt@xe_evict_ccs@evict-overcommit-standalone-ins=
tantfree-reopen.html">PASS</a> +26 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel X=
E#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-145581v1/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-basic-defer-bind.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-4=
32/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard=
-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176=
/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f603369=
4f1176/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f=
6033694f1176/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39f=
aafae2f6033694f1176/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd62=
94c39faafae2f6033694f1176/shard-dg2-434/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a=
74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3=
ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-27=
25-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-436/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-d=
g2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/s=
hard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f=
1176/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f60=
33694f1176/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faaf=
ae2f6033694f1176/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c=
39faafae2f6033694f1176/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74c=
d6294c39faafae2f6033694f1176/shard-dg2-464/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff2=
90a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-=
2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-145581v1/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-43=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-436/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
5581v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-435/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-145581v1/shard-dg2-435/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/sh=
ard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-145581v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-4=
34/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
45581v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/s=
hard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-145581v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-=
464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
145581v1/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/=
shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-463/igt@xe_module_=
load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-8/igt@xe_pm@s=
2idle-mocs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@xe_pm@s2idle-=
mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-1/igt@xe_pm@s3=
-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4330">Intel XE#4330</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@xe_pm@=
s3-basic.html">PASS</a> +1 other test pass</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@xe_pm@=
s3-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4330">Intel XE#4330</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-433/igt@xe=
_pm@s3-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_cc=
s@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-145581v1/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@=
pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_cc=
s@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#=
787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
45581v1/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pi=
pe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-7/igt@kms_cont=
ent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_conte=
nt_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_co=
ntent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-464/igt@kms_c=
ontent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_co=
ntent_protection@atomic-dpms.html">DMESG-FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-dg2-43=
3/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 ot=
her test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-8/igt@kms_cont=
ent_protection@atomic-dpms@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/sh=
ard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Inte=
l XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432/igt@kms_cu=
rsor_legacy@cursora-vs-flipb-atomic.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard=
-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#30=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-7/igt@kms_curs=
or_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/sha=
rd-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Inte=
l XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shar=
d-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-modeset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_f=
lip@2x-flip-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-rmfb.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-rmfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/s=
hard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Int=
el XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE=
#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
145581v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-sh=
rfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581=
v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1455=
81v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
45581v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1455=
81v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-145581v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
145581v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581=
v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
45581v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
5581v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-4/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-bmg-2/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-6/=
igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/sh=
ard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f11=
76/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f60336=
94f1176/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f=
6033694f1176/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39f=
aafae2f6033694f1176/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd629=
4c39faafae2f6033694f1176/shard-adlp-4/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74=
cd6294c39faafae2f6033694f1176/shard-adlp-4/igt@xe_module_load@load.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff2=
90a74cd6294c39faafae2f6033694f1176/shard-adlp-6/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2=
a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-6/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-6/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard=
-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/=
shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f=
1176/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f603=
3694f1176/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae=
2f6033694f1176/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39f=
aafae2f6033694f1176/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd629=
4c39faafae2f6033694f1176/shard-adlp-9/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74=
cd6294c39faafae2f6033694f1176/shard-adlp-9/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff2=
90a74cd6294c39faafae2f6033694f1176/shard-adlp-3/igt@xe_module_load@load.htm=
l">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/378">Intel XE#378</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4173">Intel XE#4173</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-145581v1/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-145581v1/shard-adlp-9/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/sh=
ard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-145581v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-2/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-145581v1/shard-adlp-2/igt@xe_module_load@load.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581=
v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-4/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-145581v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adl=
p-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
45581v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-145581v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shar=
d-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-145581v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-145581v1/shard-adlp-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581=
v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adlp-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-145581v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145581v1/shard-adl=
p-3/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8250 -&gt; IGT_8251</li>
<li>Linux: xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176 -&gt; xe-pw-145=
581v1</li>
</ul>
<p>IGT_8250: 43a53635da9a5ecb1a9ca189cb15df2c0b78bd38 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8251: f0b66883398b4a07bb8fcaa3663a2140129d9a58 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176: 2a3ff290a74cd6294c39faa=
fae2f6033694f1176<br />
  xe-pw-145581v1: 145581v1</p>

</body>
</html>

--===============8434116148793954135==--
