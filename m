Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152A0C197BF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 21:12:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C256910E127;
	Thu, 27 Feb 2025 21:12:08 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF6C10E111;
 Thu, 27 Feb 2025 21:12:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8250303338430035626=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Allow_scratch_page_under_f?=
 =?utf-8?q?ault_mode_for_certain_platform_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Feb 2025 21:12:08 -0000
Message-ID: <174069072828.2869859.13046073390542225974@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250227160952.807885-1-oak.zeng@intel.com>
In-Reply-To: <20250227160952.807885-1-oak.zeng@intel.com>
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

--===============8250303338430035626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Allow scratch page under fault mode for certain platform (rev2)
URL   : https://patchwork.freedesktop.org/series/145539/
State : failure

== Summary ==

CI Bug Log - changes from xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176_full -> xe-pw-145539v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-145539v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-145539v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-145539v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-d:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][2] +1 other test dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-d.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_vblank@query-forked@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][4] -> [DMESG-WARN][5] +1 other test dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-1/igt@kms_vblank@query-forked@pipe-a-hdmi-a-1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@kms_vblank@query-forked@pipe-a-hdmi-a-1.html

  * igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_copy0:
    - shard-bmg:          [PASS][6] -> [INCOMPLETE][7] +3 other tests incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-7/igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_copy0.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-1/igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_copy0.html

  * igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_video_decode0:
    - shard-dg2-set2:     [PASS][8] -> [INCOMPLETE][9] +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_video_decode0.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-434/igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_video_decode0.html

  
Known issues
------------

  Here are the changes found in xe-pw-145539v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [PASS][10] -> [DMESG-WARN][11] ([Intel XE#4330]) +3 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          NOTRUN -> [FAIL][12] ([Intel XE#3719] / [Intel XE#911]) +3 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#3768])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@kms_async_flips@invalid-async-flip-atomic.html
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#3768])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#3279])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#316]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1407]) +4 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#3658]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1124]) +14 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#316]) +6 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2327]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][22] ([Intel XE#4330]) +5 other tests dmesg-fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2328])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb.html
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1467])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#607])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1477])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1124]) +11 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][28] -> [DMESG-FAIL][29] ([Intel XE#4330]) +5 other tests dmesg-fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#1124]) +9 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1124]) +9 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#619]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#607])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#367]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#2191]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2314] / [Intel XE#2894]) +4 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#2191]) +4 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#2191]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1512]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#367]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#367])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#367])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#787]) +71 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#2907])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#2669]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#455] / [Intel XE#787]) +47 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-9/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#2887]) +18 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#455] / [Intel XE#787]) +33 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][49] ([Intel XE#3862]) +1 other test incomplete
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#3432])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#3432]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#3442])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#3442])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2652] / [Intel XE#787]) +9 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#787]) +153 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2887]) +15 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][57] -> [INCOMPLETE][58] ([Intel XE#2705] / [Intel XE#3113]) +1 other test incomplete
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][59] -> [INCOMPLETE][60] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][61] -> [DMESG-WARN][62] ([Intel XE#1727] / [Intel XE#3113])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][63] -> [INCOMPLETE][64] ([Intel XE#3124])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#2907]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#4417] / [Intel XE#455])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#4417]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2325]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@kms_chamelium_color@degamma.html
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#306]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#306]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_chamelium_color@gamma.html
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#306]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-6/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2252]) +10 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#373]) +9 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#373]) +10 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#373]) +8 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_color@ctm-signed:
    - shard-bmg:          [PASS][76] -> [DMESG-WARN][77] ([Intel XE#877]) +1 other test dmesg-warn
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-6/igt@kms_color@ctm-signed.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-1/igt@kms_color@ctm-signed.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#307])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@kms_content_protection@dp-mst-type-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#307])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#307])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-1/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#455]) +28 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@kms_content_protection@legacy.html
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][82] ([Intel XE#4330]) +1 other test dmesg-fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_content_protection@legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#3278])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-3/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][84] ([Intel XE#4330]) +2 other tests dmesg-fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#455]) +15 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_content_protection@uevent.html
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2341])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1424]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2320]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#308])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-4/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#2321])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#309])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#309]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2291]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#309]) +5 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][95] -> [SKIP][96] ([Intel XE#2291]) +4 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
    - shard-dg2-set2:     [PASS][97] -> [SKIP][98] ([Intel XE#309]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#4302])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@kms_display_modes@extended-mode-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#4302])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_aux_dev:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#3009])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#4354])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-4/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#4356])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@kms_dp_link_training@uhbr-sst.html
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#4354])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_dp_link_training@uhbr-sst.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#4356])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@kms_dp_link_training@uhbr-sst.html
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#4354])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#4331])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#4294])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#2244]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-6/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2244])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#4156])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#776])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-4/igt@kms_fbcon_fbt@psr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#776])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-433/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2373]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_feature_discovery@display-3x.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#703])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#1138])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_feature_discovery@display-4x.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#1138])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2316]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#310]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][120] -> [SKIP][121] ([Intel XE#310]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][122] ([Intel XE#301]) +2 other tests fail
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a2-dp2.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][123] ([Intel XE#2955] / [Intel XE#4330])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-rmfb@cd-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][124] ([Intel XE#4330]) +5 other tests dmesg-warn
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-rmfb@cd-hdmi-a2-dp2.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#1421]) +7 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#310]) +8 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [PASS][127] -> [SKIP][128] ([Intel XE#2316]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-adlp:         NOTRUN -> [FAIL][129] ([Intel XE#2882]) +1 other test fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-9/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][130] ([Intel XE#886]) +2 other tests fail
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][131] -> [FAIL][132] ([Intel XE#301]) +2 other tests fail
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
    - shard-bmg:          [PASS][133] -> [FAIL][134] ([Intel XE#3321]) +3 other tests fail
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][135] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [PASS][136] -> [FAIL][137] ([Intel XE#886]) +1 other test fail
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-lnl-8/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#1401]) +5 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [PASS][140] -> [DMESG-FAIL][141] ([Intel XE#324] / [Intel XE#4330]) +1 other test dmesg-fail
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][142] -> [DMESG-FAIL][143] ([Intel XE#324]) +1 other test dmesg-fail
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#1401] / [Intel XE#1745]) +5 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][145] ([Intel XE#324] / [Intel XE#4330]) +1 other test dmesg-fail
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2293]) +4 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2311]) +24 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#656]) +59 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#651]) +37 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#4141]) +12 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][151] -> [SKIP][152] ([Intel XE#656]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#651]) +24 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#656]) +4 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#2312]) +28 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#651]) +22 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#1151])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#2313]) +26 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#653]) +30 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#656]) +47 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][161] ([Intel XE#653]) +18 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][162] ([Intel XE#1341])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@kms_getfb@getfb-reject-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#605])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#605])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-1/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#1503])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#1503])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_hdr@static-toggle.html

  * igt@kms_invalid_mode@zero-vdisplay:
    - shard-dg2-set2:     [PASS][167] -> [DMESG-WARN][168] ([Intel XE#4330]) +13 other tests dmesg-warn
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_invalid_mode@zero-vdisplay.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@kms_invalid_mode@zero-vdisplay.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#2934])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][170] ([Intel XE#2925])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#4090])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][172] ([Intel XE#3663] / [Intel XE#4016])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#4329])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][174] ([Intel XE#4359])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#4329])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][176] ([Intel XE#1035])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-9/igt@kms_plane@pixel-format.html

  * igt@kms_plane@pixel-format@pipe-a-plane-3:
    - shard-adlp:         NOTRUN -> [WARN][177] ([Intel XE#2078]) +1 other test warn
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-9/igt@kms_plane@pixel-format@pipe-a-plane-3.html

  * igt@kms_plane_cursor@overlay:
    - shard-dg2-set2:     [PASS][178] -> [FAIL][179] ([Intel XE#616])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_plane_cursor@overlay.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][180] ([Intel XE#616]) +3 other tests fail
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg2-set2:     [PASS][181] -> [INCOMPLETE][182] ([Intel XE#4392]) +1 other test incomplete
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_plane_lowres@tiling-4.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#2393])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html
    - shard-lnl:          NOTRUN -> [SKIP][184] ([Intel XE#599])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-4/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][185] ([Intel XE#2493])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#2493])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-6/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          NOTRUN -> [SKIP][187] ([Intel XE#3307])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][188] ([Intel XE#2566] / [Intel XE#4212]) +2 other tests dmesg-warn
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][189] ([Intel XE#2566] / [Intel XE#4330]) +1 other test dmesg-warn
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-d:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][190] ([Intel XE#2566] / [Intel XE#4330]) +1 other test dmesg-warn
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][191] ([Intel XE#2763]) +7 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html
    - shard-adlp:         NOTRUN -> [SKIP][192] ([Intel XE#2763]) +2 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][193] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - shard-dg2-set2:     [PASS][194] -> [DMESG-WARN][195] ([Intel XE#2566] / [Intel XE#4330]) +1 other test dmesg-warn
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][196] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][197] ([Intel XE#2763]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][198] ([Intel XE#2763]) +14 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][199] ([Intel XE#2938])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][200] ([Intel XE#2391])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-adlp:         NOTRUN -> [SKIP][201] ([Intel XE#1122])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][202] ([Intel XE#1122])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-lnl:          NOTRUN -> [SKIP][203] ([Intel XE#736])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][204] ([Intel XE#1129])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][205] ([Intel XE#3309])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-lnl:          NOTRUN -> [SKIP][206] ([Intel XE#3309])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-3/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-adlp:         NOTRUN -> [SKIP][207] ([Intel XE#3309])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-bmg:          NOTRUN -> [SKIP][208] ([Intel XE#3309])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][209] ([Intel XE#908])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html
    - shard-lnl:          NOTRUN -> [FAIL][210] ([Intel XE#1430])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html
    - shard-adlp:         NOTRUN -> [FAIL][211] ([Intel XE#718])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html
    - shard-bmg:          NOTRUN -> [FAIL][212] ([Intel XE#1430])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [PASS][213] -> [SKIP][214] ([Intel XE#836])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][215] ([Intel XE#836]) +2 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.html
    - shard-lnl:          NOTRUN -> [SKIP][216] ([Intel XE#1439] / [Intel XE#3141]) +2 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [PASS][217] -> [DMESG-WARN][218] ([Intel XE#2042] / [Intel XE#4330])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_pm_rpm@system-suspend-modeset.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][219] ([Intel XE#1489]) +14 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][220] ([Intel XE#1489]) +10 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][221] ([Intel XE#1489]) +16 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][222] ([Intel XE#2893]) +6 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-sprite-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][223] ([Intel XE#1406]) +5 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_psr@fbc-pr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][224] ([Intel XE#2850] / [Intel XE#929]) +20 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][225] ([Intel XE#2850] / [Intel XE#929]) +23 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][226] ([Intel XE#2234] / [Intel XE#2850]) +18 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][227] ([Intel XE#3414] / [Intel XE#3904])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][228] ([Intel XE#3414])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][229] ([Intel XE#3414] / [Intel XE#3904])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][230] ([Intel XE#1127])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-adlp:         NOTRUN -> [SKIP][231] ([Intel XE#1127]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-bmg:          NOTRUN -> [SKIP][232] ([Intel XE#2330])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][233] ([Intel XE#1127])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][234] ([Intel XE#3414])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][235] ([Intel XE#2413]) +2 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][236] ([Intel XE#1435])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html
    - shard-lnl:          NOTRUN -> [SKIP][237] ([Intel XE#1435])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][238] -> [SKIP][239] ([Intel XE#1435]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-adlp:         NOTRUN -> [SKIP][240] ([Intel XE#362])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][241] ([Intel XE#330])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html
    - shard-lnl:          NOTRUN -> [SKIP][242] ([Intel XE#330])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_tv_load_detect@load-detect.html
    - shard-adlp:         NOTRUN -> [SKIP][243] ([Intel XE#330])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@kms_tv_load_detect@load-detect.html
    - shard-bmg:          NOTRUN -> [SKIP][244] ([Intel XE#2450])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@query-busy:
    - shard-bmg:          [PASS][245] -> [DMESG-WARN][246] ([Intel XE#4330]) +10 other tests dmesg-warn
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-2/igt@kms_vblank@query-busy.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_vblank@query-busy.html

  * igt@kms_vrr@cmrr:
    - shard-adlp:         NOTRUN -> [SKIP][247] ([Intel XE#2168])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-9/igt@kms_vrr@cmrr.html
    - shard-bmg:          NOTRUN -> [SKIP][248] ([Intel XE#2168])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-2/igt@kms_vrr@cmrr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][249] ([Intel XE#2168])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][250] ([Intel XE#1499]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][251] ([Intel XE#1499])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-1/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-lnl:          NOTRUN -> [SKIP][252] ([Intel XE#756]) +2 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-1/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][253] ([Intel XE#756]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-bmg:          NOTRUN -> [SKIP][254] ([Intel XE#756])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][255] ([Intel XE#756])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][256] ([Intel XE#1091] / [Intel XE#2849])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-lnl:          NOTRUN -> [SKIP][257] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-bmg:          NOTRUN -> [SKIP][258] ([Intel XE#1091] / [Intel XE#2849])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_ccs@suspend-resume:
    - shard-adlp:         NOTRUN -> [SKIP][259] ([Intel XE#455] / [Intel XE#488]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@xe_ccs@suspend-resume.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][260] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][261] ([Intel XE#1126])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-9/igt@xe_copy_basic@mem-set-linear-0x3fff.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][262] ([Intel XE#1126])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-isolation:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][263] ([Intel XE#4330]) +2 other tests dmesg-warn
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@xe_drm_fdinfo@utilization-single-full-load-isolation.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          NOTRUN -> [SKIP][264] ([Intel XE#2905]) +11 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-adlp:         NOTRUN -> [SKIP][265] ([Intel XE#3889])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
    - shard-bmg:          NOTRUN -> [SKIP][266] ([Intel XE#3889])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][267] ([Intel XE#3889])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
    - shard-lnl:          NOTRUN -> [SKIP][268] ([Intel XE#3889])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug@discovery-empty:
    - shard-adlp:         NOTRUN -> [SKIP][269] ([Intel XE#2905]) +17 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-lnl:          NOTRUN -> [SKIP][270] ([Intel XE#2905]) +14 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][271] ([Intel XE#2905]) +9 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][272] ([Intel XE#261] / [Intel XE#688]) +4 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-4/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][273] ([Intel XE#688]) +5 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
    - shard-adlp:         NOTRUN -> [SKIP][274] ([Intel XE#688]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-dg2-set2:     [PASS][275] -> [SKIP][276] ([Intel XE#1392]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][277] ([Intel XE#1392]) +11 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][278] ([Intel XE#1392])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][279] ([Intel XE#2322]) +12 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-8/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][280] ([Intel XE#1392]) +14 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][281] ([Intel XE#288]) +33 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][282] ([Intel XE#288]) +29 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][283] ([Intel XE#2360])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][284] ([Intel XE#2360])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:
    - shard-adlp:         [PASS][285] -> [DMESG-FAIL][286] ([Intel XE#3868])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-6/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-adlp:         [PASS][287] -> [DMESG-WARN][288] ([Intel XE#4173])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][289] ([Intel XE#2833])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-5/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_oa@non-zero-reason:
    - shard-adlp:         NOTRUN -> [SKIP][290] ([Intel XE#2541] / [Intel XE#3573]) +8 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@xe_oa@non-zero-reason.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][291] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-adlp:         NOTRUN -> [SKIP][292] ([Intel XE#2838] / [Intel XE#979])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-4/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][293] ([Intel XE#977])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@xe_pat@pat-index-xelp.html
    - shard-bmg:          NOTRUN -> [SKIP][294] ([Intel XE#2245])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][295] ([Intel XE#2236])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][296] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-4/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-adlp:         [PASS][297] -> [DMESG-WARN][298] ([Intel XE#2953])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-9/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [PASS][299] -> [DMESG-WARN][300] ([Intel XE#4330] / [Intel XE#569]) +4 other tests dmesg-warn
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-436/igt@xe_pm@s3-basic-exec.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][301] ([Intel XE#2284] / [Intel XE#366]) +2 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-lnl:          NOTRUN -> [SKIP][302] ([Intel XE#584])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-1/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][303] ([Intel XE#4330] / [Intel XE#569])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [PASS][304] -> [DMESG-WARN][305] ([Intel XE#4330] / [Intel XE#569]) +1 other test dmesg-warn
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-8/igt@xe_pm@s3-vm-bind-userptr.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [ABORT][306] ([Intel XE#4268])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-bmg:          NOTRUN -> [ABORT][307] ([Intel XE#4268])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          NOTRUN -> [SKIP][308] ([Intel XE#944])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-adlp:         NOTRUN -> [SKIP][309] ([Intel XE#944])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     NOTRUN -> [SKIP][310] ([Intel XE#944])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          NOTRUN -> [SKIP][311] ([Intel XE#4130])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-lnl:          NOTRUN -> [SKIP][312] ([Intel XE#4130]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-3/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-lnl:          NOTRUN -> [SKIP][313] ([Intel XE#3342])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-1/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          NOTRUN -> [SKIP][314] ([Intel XE#4273])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Possible fixes ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-adlp:         [DMESG-WARN][315] -> [PASS][316] +2 other tests pass
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [DMESG-FAIL][317] ([Intel XE#4330]) -> [PASS][318] +6 other tests pass
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][319] -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [DMESG-WARN][321] ([Intel XE#4199]) -> [PASS][322]
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#309]) -> [PASS][324] +3 other tests pass
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][325] ([Intel XE#2291]) -> [PASS][326] +1 other test pass
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#4354]) -> [PASS][328]
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#310]) -> [PASS][330] +4 other tests pass
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][331] ([Intel XE#2316]) -> [PASS][332] +2 other tests pass
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-adlp:         [FAIL][333] ([Intel XE#301]) -> [PASS][334] +1 other test pass
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
    - shard-dg2-set2:     [FAIL][335] ([Intel XE#301]) -> [PASS][336]
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [DMESG-WARN][337] ([Intel XE#2955]) -> [PASS][338]
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-dg2-set2:     [FAIL][339] ([Intel XE#2882]) -> [PASS][340]
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_flip@plain-flip-fb-recreate.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@a-dp4:
    - shard-dg2-set2:     [FAIL][341] -> [PASS][342] +1 other test pass
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_flip@plain-flip-fb-recreate@a-dp4.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@kms_flip@plain-flip-fb-recreate@a-dp4.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
    - shard-adlp:         [FAIL][343] ([Intel XE#886]) -> [PASS][344] +2 other tests pass
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-2/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#656]) -> [PASS][346] +6 other tests pass
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-adlp:         [DMESG-WARN][347] ([Intel XE#2953]) -> [PASS][348]
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#4328]) -> [PASS][350]
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_lease@lease-uevent:
    - shard-bmg:          [DMESG-WARN][351] ([Intel XE#4330]) -> [PASS][352] +17 other tests pass
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-8/igt@kms_lease@lease-uevent.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_lease@lease-uevent.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [DMESG-WARN][353] ([Intel XE#2566] / [Intel XE#4330]) -> [PASS][354] +1 other test pass
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-433/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][355] ([Intel XE#718]) -> [PASS][356]
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2-set2:     [DMESG-WARN][357] ([Intel XE#2042] / [Intel XE#4330]) -> [PASS][358]
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-434/igt@kms_pm_rpm@drm-resources-equal.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [DMESG-WARN][359] -> [PASS][360]
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html
    - shard-dg2-set2:     [DMESG-WARN][361] -> [PASS][362]
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][363] ([Intel XE#899]) -> [PASS][364]
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-dg2-set2:     [DMESG-WARN][365] ([Intel XE#4330]) -> [PASS][366] +24 other tests pass
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#1392]) -> [PASS][368] +1 other test pass
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_threads@threads-hang-rebind-err:
    - shard-dg2-set2:     [DMESG-WARN][369] ([Intel XE#3876]) -> [PASS][370]
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@xe_exec_threads@threads-hang-rebind-err.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@xe_exec_threads@threads-hang-rebind-err.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][371], [PASS][372], [SKIP][373], [PASS][374], [PASS][375], [PASS][376], [PASS][377], [PASS][378], [PASS][379], [PASS][380], [PASS][381], [PASS][382], [PASS][383], [PASS][384], [PASS][385], [PASS][386], [PASS][387], [PASS][388], [PASS][389], [PASS][390], [PASS][391], [PASS][392], [PASS][393], [PASS][394], [PASS][395], [PASS][396]) ([Intel XE#378]) -> ([PASS][397], [PASS][398], [PASS][399], [PASS][400], [PASS][401], [PASS][402], [PASS][403], [PASS][404], [PASS][405], [PASS][406], [PASS][407], [PASS][408], [PASS][409], [PASS][410], [PASS][411], [PASS][412], [PASS][413], [PASS][414], [PASS][415], [PASS][416], [PASS][417], [PASS][418], [PASS][419], [PASS][420], [PASS][421])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@xe_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@xe_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432/igt@xe_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-436/igt@xe_module_load@load.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-436/igt@xe_module_load@load.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-436/igt@xe_module_load@load.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@xe_module_load@load.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@xe_module_load@load.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-434/igt@xe_module_load@load.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@xe_module_load@load.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@xe_module_load@load.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-436/igt@xe_module_load@load.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432/igt@xe_module_load@load.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432/igt@xe_module_load@load.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432/igt@xe_module_load@load.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432/igt@xe_module_load@load.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-434/igt@xe_module_load@load.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@xe_module_load@load.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@xe_module_load@load.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@xe_module_load@load.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-434/igt@xe_module_load@load.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@xe_module_load@load.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@xe_module_load@load.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@xe_module_load@load.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@xe_module_load@load.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@xe_module_load@load.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@xe_module_load@load.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@xe_module_load@load.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@xe_module_load@load.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-434/igt@xe_module_load@load.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-433/igt@xe_module_load@load.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-434/igt@xe_module_load@load.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@xe_module_load@load.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@xe_module_load@load.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@xe_module_load@load.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@xe_module_load@load.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@xe_module_load@load.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@xe_module_load@load.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-433/igt@xe_module_load@load.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@xe_module_load@load.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-433/igt@xe_module_load@load.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@xe_module_load@load.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@xe_module_load@load.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-434/igt@xe_module_load@load.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@xe_module_load@load.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@xe_module_load@load.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-434/igt@xe_module_load@load.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@xe_module_load@load.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@xe_module_load@load.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@xe_module_load@load.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@xe_module_load@load.html

  * igt@xe_pm@s2idle-mocs:
    - shard-adlp:         [DMESG-WARN][422] ([Intel XE#4173]) -> [PASS][423] +1 other test pass
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-8/igt@xe_pm@s2idle-mocs.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s3-basic:
    - shard-bmg:          [DMESG-WARN][424] ([Intel XE#4330] / [Intel XE#569]) -> [PASS][425]
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-1/igt@xe_pm@s3-basic.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@xe_pm@s3-basic.html
    - shard-dg2-set2:     [DMESG-WARN][426] ([Intel XE#4330] / [Intel XE#569]) -> [PASS][427]
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@xe_pm@s3-basic.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@xe_pm@s3-basic.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][428] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][429] ([Intel XE#787]) +3 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][430] ([Intel XE#787]) -> [SKIP][431] ([Intel XE#455] / [Intel XE#787]) +4 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [FAIL][432] ([Intel XE#1178]) -> [SKIP][433] ([Intel XE#455])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_content_protection@atomic.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][434] ([Intel XE#4330]) -> [SKIP][435] ([Intel XE#309]) +1 other test skip
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          [DMESG-WARN][436] ([Intel XE#4330]) -> [SKIP][437] ([Intel XE#2291])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][438] ([Intel XE#877]) -> [SKIP][439] ([Intel XE#2291])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-bmg:          [DMESG-WARN][440] ([Intel XE#4330]) -> [SKIP][441] ([Intel XE#2316])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-1/igt@kms_flip@2x-flip-vs-modeset.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-bmg:          [DMESG-WARN][442] ([Intel XE#2955]) -> [SKIP][443] ([Intel XE#2316])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-1/igt@kms_flip@2x-flip-vs-rmfb.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [DMESG-FAIL][444] ([Intel XE#4330]) -> [FAIL][445] ([Intel XE#301])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][446] ([Intel XE#4330]) -> [FAIL][447] ([Intel XE#301])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][448] ([Intel XE#2311]) -> [SKIP][449] ([Intel XE#2312]) +14 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
    - shard-dg2-set2:     [SKIP][450] ([Intel XE#651]) -> [SKIP][451] ([Intel XE#656]) +5 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][452] ([Intel XE#656]) -> [SKIP][453] ([Intel XE#651]) +6 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][454] ([Intel XE#2312]) -> [SKIP][455] ([Intel XE#4141]) +2 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][456] ([Intel XE#4141]) -> [SKIP][457] ([Intel XE#2312]) +7 other tests skip
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][458] ([Intel XE#2312]) -> [SKIP][459] ([Intel XE#2311]) +6 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][460] ([Intel XE#2312]) -> [SKIP][461] ([Intel XE#2313]) +6 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][462] ([Intel XE#2313]) -> [SKIP][463] ([Intel XE#2312]) +17 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#653]) -> [SKIP][465] ([Intel XE#656]) +9 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#656]) -> [SKIP][467] ([Intel XE#653]) +5 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][468] ([Intel XE#3544]) -> [SKIP][469] ([Intel XE#3374] / [Intel XE#3544])
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][470] ([Intel XE#362]) -> [SKIP][471] ([Intel XE#1500])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][472], [PASS][473], [DMESG-WARN][474], [PASS][475], [PASS][476], [PASS][477], [PASS][478], [PASS][479], [PASS][480], [SKIP][481], [PASS][482], [PASS][483], [PASS][484], [PASS][485], [PASS][486], [PASS][487], [PASS][488], [PASS][489], [PASS][490], [PASS][491], [PASS][492], [PASS][493], [PASS][494], [PASS][495], [PASS][496], [PASS][497]) ([Intel XE#378] / [Intel XE#4173]) -> ([PASS][498], [PASS][499], [PASS][500], [PASS][501], [PASS][502], [PASS][503], [PASS][504], [PASS][505], [PASS][506], [PASS][507], [PASS][508], [PASS][509], [PASS][510], [PASS][511], [PASS][512], [PASS][513], [PASS][514], [SKIP][515], [PASS][516], [PASS][517], [PASS][518], [PASS][519], [PASS][520], [PASS][521], [PASS][522], [PASS][523]) ([Intel XE#378])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-1/igt@xe_module_load@load.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-1/igt@xe_module_load@load.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-6/igt@xe_module_load@load.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-4/igt@xe_module_load@load.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-4/igt@xe_module_load@load.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-8/igt@xe_module_load@load.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-8/igt@xe_module_load@load.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-2/igt@xe_module_load@load.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-4/igt@xe_module_load@load.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-4/igt@xe_module_load@load.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-6/igt@xe_module_load@load.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-6/igt@xe_module_load@load.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-6/igt@xe_module_load@load.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-3/igt@xe_module_load@load.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-2/igt@xe_module_load@load.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-2/igt@xe_module_load@load.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-3/igt@xe_module_load@load.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-3/igt@xe_module_load@load.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-8/igt@xe_module_load@load.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-4/igt@xe_module_load@load.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-8/igt@xe_module_load@load.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-9/igt@xe_module_load@load.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-1/igt@xe_module_load@load.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-9/igt@xe_module_load@load.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-9/igt@xe_module_load@load.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-3/igt@xe_module_load@load.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-4/igt@xe_module_load@load.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-4/igt@xe_module_load@load.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@xe_module_load@load.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@xe_module_load@load.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@xe_module_load@load.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@xe_module_load@load.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@xe_module_load@load.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@xe_module_load@load.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@xe_module_load@load.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@xe_module_load@load.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@xe_module_load@load.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@xe_module_load@load.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@xe_module_load@load.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@xe_module_load@load.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@xe_module_load@load.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-4/igt@xe_module_load@load.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@xe_module_load@load.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@xe_module_load@load.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@xe_module_load@load.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@xe_module_load@load.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@xe_module_load@load.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-4/igt@xe_module_load@load.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@xe_module_load@load.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@xe_module_load@load.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-9/igt@xe_module_load@load.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-9/igt@xe_module_load@load.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][524] ([Intel XE#1173]) -> [SKIP][525] ([Intel XE#1061])
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@xe_peer2peer@write.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@xe_peer2peer@write.html

  * igt@xe_pm@s4-basic-exec:
    - shard-bmg:          [ABORT][526] ([Intel XE#4268]) -> [ABORT][527] ([Intel XE#4054] / [Intel XE#4268])
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-8/igt@xe_pm@s4-basic-exec.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-1/igt@xe_pm@s4-basic-exec.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
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
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
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
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
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
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
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
  [Intel XE#3663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3663
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4016]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4016
  [Intel XE#4054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4054
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
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
  [Intel XE#4392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4392
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
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8250 -> IGT_8251
  * Linux: xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176 -> xe-pw-145539v2

  IGT_8250: 43a53635da9a5ecb1a9ca189cb15df2c0b78bd38 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8251: f0b66883398b4a07bb8fcaa3663a2140129d9a58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176: 2a3ff290a74cd6294c39faafae2f6033694f1176
  xe-pw-145539v2: 145539v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/index.html

--===============8250303338430035626==
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
<tr><td><b>Series:</b></td><td>Allow scratch page under fault mode for cert=
ain platform (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/145539/">https://patchwork.freedesktop.org/series/145539/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-145539v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-145539v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2725-2a3ff290a74cd6294c39faafae2f60336=
94f1176_full -&gt; xe-pw-145539v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-145539v2_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-145539v2_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1455=
39v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-=
read-crc@pipe-d-hdmi-a-2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-d:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@kms_plane_scaling@plane-down=
scale-factor-0-75-with-modifiers@pipe-d.html">DMESG-WARN</a> +1 other test =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-sf.html">INCOMPLETE</a> +1 other test incomplet=
e</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-1/igt@kms_vbl=
ank@query-forked@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@kms_vblank@=
query-forked@pipe-a-hdmi-a-1.html">DMESG-WARN</a> +1 other test dmesg-warn<=
/li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_copy0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-7/igt@xe_pmu@e=
ngine-activity-idle@engine-drm_xe_engine_class_copy0.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bm=
g-1/igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_copy0.html">=
INCOMPLETE</a> +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_video_decode0=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@xe_pmu=
@engine-activity-idle@engine-drm_xe_engine_class_video_decode0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v=
2/shard-dg2-434/igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_=
video_decode0.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-145539v2_full that come from known i=
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
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@km=
s_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#433=
0</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-3/igt@kms_async_flips@async-flip-wi=
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
/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@kms_async_flips@invalid-asy=
nc-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3768">Intel XE#3768</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_async_flips@invalid-async=
-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-2/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-2/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@kms_big_fb@linear-32bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_big_fb@x-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-st=
ride-32bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +5 other =
tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2328">Intel XE#2328</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-si=
ze-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb-size=
-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-str=
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
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/s=
hard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-asy=
nc-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4330">Intel XE#4330</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-8bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/619">Intel XE#619</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb-si=
ze-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_bw@connected-linear-tili=
ng-1-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_bw@connected-linear-tilin=
g-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-1/igt@kms_bw@connected-linear-tilin=
g-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +4 other=
 tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@kms_bw@connected-linear-tili=
ng-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +4 other tests skip</=
li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-434/igt@kms_bw@connected-linear-til=
ing-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</=
li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_bw@connected-linear-tilin=
g-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_bw@linear-tiling-1-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@kms_bw@linear-tiling-3-disp=
lays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_bw@linear-tiling-3-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-t=
iled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +71 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-t=
iled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-til=
ed-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-9/igt@kms_ccs@ccs-on-another-bo-4-=
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
/tree/intel-xe/xe-pw-145539v2/shard-lnl-1/igt@kms_ccs@ccs-on-another-bo-4-t=
iled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-434/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4=
-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@kms_ccs@crc-primary-suspend=
-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_ccs@crc-primary-suspend=
-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +153 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_ccs@missing-ccs-buffer-y-=
tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">In=
tel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard=
-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard=
-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@kms_ccs@random-ccs-data-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@kms_cdclk@mode-transition.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4417">Intel XE#4417</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@kms_cdclk@mode-transition@pi=
pe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4417">Intel XE#4417</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@kms_chamelium_color@degamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2325">Intel XE#2325</a>) +2 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_chamelium_color@degamma.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_chamelium_color@gamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-6/igt@kms_chamelium_color@gamma.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_chamelium_edid@hdmi-edid-=
change-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +10 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_chamelium_edid@hdmi-mod=
e-timings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-ena=
ble-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-6/igt@kms_colo=
r@ctm-signed.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-145539v2/shard-bmg-1/igt@kms_color@ctm-signed.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
77">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@kms_content_protection@dp-ms=
t-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@kms_content_protection@dp-m=
st-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-1/igt@kms_content_protection@dp-mst=
-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@kms_content_protection@legac=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a>) +28 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_content_protection@legacy=
.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4330">Intel XE#4330</a>) +1 other test dmesg-fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-3/igt@kms_content_protection@legacy=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_content_protection@lega=
cy@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +2 other tests dmesg-fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_content_protection@ueve=
nt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/455">Intel XE#455</a>) +15 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_content_protection@uevent=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-m=
ovement-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1424">Intel XE#1424</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding=
-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-4/igt@kms_cursor_crc@cursor-slidin=
g-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_cursor_legacy@2x-long-f=
lip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-5/igt@kms_cursor_legacy@2x-nonblock=
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
/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs=
-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-8/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_cursor_=
legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other tests =
skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-legacy.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_cur=
sor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@kms_display_modes@extended-m=
ode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4302">Intel XE#4302</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-1/igt@kms_display_modes@extended-mo=
de-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@kms_dp_aux_dev.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Int=
el XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-4/igt@kms_dp_link_training@non-uhb=
r-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@kms_dp_link_training@uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4356">Intel XE#4356</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_dp_link_training@uhbr-sst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@kms_dp_link_training@uhbr-s=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4356">Intel XE#4356</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_dp_link_training@uhbr-sst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@kms_dp_linktrain_fallback@dp=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4331">Intel XE#4331</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_dp_linktrain_fallback@dp-=
fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-6/igt@kms_dsc@dsc-with-formats.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_dsc@dsc-with-output-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4156">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-4/igt@kms_fbcon_fbt@psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">I=
ntel XE#776</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-433/igt@kms_fbcon_fbt@psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">=
Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_feature_discovery@display=
-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2373">Intel XE#2373</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_feature_discovery@displ=
ay-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1138">Intel XE#1138</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_feature_discovery@displ=
ay-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblan=
k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2316">Intel XE#2316</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vbl=
ank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_fl=
ip@2x-flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_flip@2=
x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@ac-hdmi-a2-dp2.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-rmfb.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2955">Intel XE#2955</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb@cd-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-rmfb@cd=
-hdmi-a2-dp2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +5 other tests dmesg-warn</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-6/igt@kms_flip@2x-flip-vs-suspend-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1421">Intel XE#1421</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@kms_flip@2x-plain-flip.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
10">Intel XE#310</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-8/igt@kms_flip=
@2x-wf_vblank-ts-check.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_flip@2x-wf_vblank-=
ts-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-9/igt@kms_flip@flip-vs-absolute-wf=
_vblank-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_=
vblank-interruptible@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-4=
35/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Int=
el XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-6/igt@kms_flip=
@flip-vs-expired-vblank@a-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_flip@fl=
ip-vs-expired-vblank@a-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other tests =
fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@kms_flip@flip-vs-suspend-in=
terruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test =
incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-lnl-8/igt@kms_flip=
@plain-flip-ts-check@a-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-3/igt@kms_flip@plain-fl=
ip-ts-check@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bp=
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
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shar=
d-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscalin=
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
e-pw-145539v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bp=
p-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 o=
ther test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>) +5 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64b=
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
/tree/intel-xe/xe-pw-145539v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +24 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +59 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-433/igt@kms_frontbuffer_tracking@dr=
rs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +37 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +12 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Int=
el XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +24 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +28 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
drrs-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcp=
sr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +26 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +30 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +47 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr=
-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/653">Intel XE#653</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@kms_getfb@getfb-reject-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1341">Intel XE#1341</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/605">Intel XE#605</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-1/igt@kms_getfb@getfb-reject-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"=
>Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_hdr@static-toggle.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/150=
3">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_in=
valid_mode@zero-vdisplay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@kms_invalid_mode@z=
ero-vdisplay.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +13 other tests dmesg-warn<=
/li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_joiner@switch-modeset-ul=
tra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-6/igt@kms_joiner@switch-modeset-ult=
ra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-=
read-crc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3663">Intel XE#3663</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4016">Intel XE#4016</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-8/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4329">Intel XE#4329</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@kms_pipe_stress@stress-xrgb=
8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4359">Intel XE#4359</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-9/igt@kms_plane@pixel-format.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-a-plane-3:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-9/igt@kms_plane@pixel-format@pipe-=
a-plane-3.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2078">Intel XE#2078</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_pl=
ane_cursor@overlay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_plane_cursor@overlay=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_pl=
ane_lowres@tiling-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@kms_plane_lowres@tiling=
-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4392">Intel XE#4392</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2393">Intel XE#2393</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-4/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_plane_multiple@tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2493">Intel XE#2493</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-6/igt@kms_plane_multiple@tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_plane_scaling@intel-max-s=
rc-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-434/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>) =
+2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_plane_scaling@plane-dow=
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
/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_plane_scaling@plane-downs=
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
/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_plane_scaling@planes-down=
scale-factor-0-25-upscale-20x20@pipe-a.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 othe=
r tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@kms_plane_scaling@planes-dow=
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
/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@kms_plane_scaling@planes-dow=
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
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@kms_plane_=
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
/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_plane_scaling@planes-up=
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
/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_plane_scaling@planes-up=
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
/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +14 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@kms_pm_backlight@brightness-=
with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2391">Intel XE#2391</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@kms_pm_dc@dc3co-vpb-simulati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1122">Intel XE#1122</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulat=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1122">Intel XE#1122</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"=
>Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_pm_dc@dc5-retention-flo=
ps.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3309">Intel XE#3309</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-3/igt@kms_pm_dc@dc5-retention-flops=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3309">Intel XE#3309</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@kms_pm_dc@dc5-retention-flop=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3309">Intel XE#3309</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_pm_dc@dc5-retention-flops=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908"=
>Intel XE#908</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">=
Intel XE#1430</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">=
Intel XE#718</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">=
Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_pm=
_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_pm_rpm@dp=
ms-mode-unset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/836">Intel XE#836</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-4/igt@kms_pm_rpm@dpms-non-lpsp.html=
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
fx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-433/igt@kms_pm_rpm@syst=
em-suspend-modeset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2042">Intel XE#2042</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-=
plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +10 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_psr2_sf@pr-overlay-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +16 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_psr2_sf@pr-plane-move-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2893">Intel XE#2893</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_psr@fbc-pr-sprite-plane-m=
ove.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1406">Intel XE#1406</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-re=
nder.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@kms_psr@pr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929">Intel XE#929</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_psr@pr-sprite-plane-onoff=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_rotation_crc@primary-4-ti=
led-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_rotation_crc@primary-ro=
tation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-8/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@kms_rotation_crc@sprite-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-2/igt@kms_scaling_modes@scaling-mod=
e-center.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2413">Intel XE#2413</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-8/igt@kms_setmode@basic-clone-singl=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1435">Intel XE#1435</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_setmode@basic-clone-singl=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-7/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@kms_tiled_display@basic-test=
-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-434/igt@kms_tv_load_detect@load-det=
ect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/330">Intel XE#330</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-8/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/330">Intel XE#330</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@kms_tv_load_detect@load-dete=
ct.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/330">Intel XE#330</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-2/igt@kms_vbla=
nk@query-busy.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_vblank@query-busy.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4330">Intel XE#4330</a>) +10 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-9/igt@kms_vrr@cmrr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel=
 XE#2168</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-2/igt@kms_vrr@cmrr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_vrr@cmrr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Inte=
l XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@kms_vrr@max-min.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-1/igt@kms_vrr@negative-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
99">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-1/igt@kms_writeback@writeback-fb-id=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/756">Intel XE#756</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@kms_writeback@writeback-inva=
lid-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/756">Intel XE#756</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_writeback@writeback-inval=
id-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/756">Intel XE#756</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@kms_writeback@writeback-inv=
alid-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-433/igt@sriov_basic@enable-vfs-bind=
-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-5/igt@sriov_basic@enable-vfs-bind-u=
nbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other t=
est skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-u=
nbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@xe_ccs@suspend-resume.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/488">Intel XE#488</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@xe_compute_preempt@compute-=
preempt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-9/igt@xe_copy_basic@mem-set-linear=
-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1126">Intel XE#1126</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@xe_copy_basic@mem-set-linea=
r-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-isolation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@xe_drm_fdinfo@utilization-sin=
gle-full-load-isolation.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +2 other tests d=
mesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@xe_eudebug@basic-read-event.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2905">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@xe_eudebug@basic-vm-bind-ufe=
nce-sigint-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-ufen=
ce-sigint-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-uf=
ence-sigint-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-ufen=
ce-sigint-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@xe_eudebug@discovery-empty.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2905">Intel XE#2905</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@xe_eudebug@discovery-empty-cl=
ients.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2905">Intel XE#2905</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@xe_eudebug_online@writes-ca=
ching-sram-bb-vram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +9 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-4/igt@xe_evict@evict-small-externa=
l-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit=
-parallel-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +5 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@xe_evict_ccs@evict-overcommi=
t-parallel-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v=
2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexec=
queue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exe=
c-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-e=
xec-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-8/igt@xe_exec_basic@multigpu-once-b=
asic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2322">Intel XE#2322</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +14 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@xe_exec_fault_mode@many-user=
ptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +33 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-in=
valid-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/288">Intel XE#288</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@xe_exec_mix_modes@exec-spinn=
er-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@xe_exec_mix_modes@exec-spin=
ner-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-6/igt@xe_exec=
_threads@threads-bal-mixed-fd-userptr-invalidate.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-3=
/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate.html">DMESG-FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868=
">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-3/igt@xe_faul=
t_injection@vm-bind-fail-xe_pt_update_ops_run.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/i=
gt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Int=
el XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-5/igt@xe_live_ktest@xe_eudebug.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@xe_oa@non-zero-reason.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
41">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3573">Intel XE#3573</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@xe_oa@syncs-userptr-wait-cf=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-4/igt@xe_pat@pat-index-xehpc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977=
">Intel XE#977</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-1/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
5">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
36">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-4/igt@xe_pm@d3cold-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-9/igt@xe_pm@s=
2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@xe_pm@s2idle-vm-bin=
d-unbind-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2953">Intel XE#2953</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-436/igt@xe_pm@=
s3-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@xe_pm@s3-basic-exec.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4330">Intel XE#4330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/569">Intel XE#569</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@xe_pm@s3-d3cold-basic-exec.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/366">Intel XE#366</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-1/igt@xe_pm@s3-exec-after.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">=
Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@xe_pm@s3-vm-bind-prefetch.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4330">Intel XE#4330</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-8/igt@xe_pm@s3=
-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@xe_pm@s3-vm-bind-userptr.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4330">Intel XE#4330</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/569">Intel XE#569</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-exec.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4268">Intel XE#4268</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-2/igt@xe_pm@s4-vm-bind-userptr.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4268">Intel XE#4268</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@xe_query@multigpu-query-inval=
id-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@xe_query@multigpu-query-mem-=
usage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@xe_query@multigpu-query-oa-=
units.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-7/igt@xe_sriov_auto_provisioning@ex=
clusive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-3/igt@xe_sriov_auto_provisioning@fa=
ir-allocation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-lnl-1/igt@xe_sriov_flr@flr-each-isolati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@xe_sriov_flr@flr-vfs-parallel=
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
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-ad=
lp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</=
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
539v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hfli=
p.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-436/igt@kms_cc=
s@crc-primary-basic-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/=
igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4199">Intel XE#4199</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/=
shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">PASS=
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
pw-145539v2/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-tra=
nsitions-varying-size.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-145539v2/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-trans=
itions-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_dp=
_link_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@k=
ms_dp_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_fl=
ip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-=
463/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">PASS</a> +4 othe=
r tests pass</li>
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
-pw-145539v2/shard-bmg-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-=
modeset-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-8/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp=
-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-434/igt@kms_fl=
ip@flip-vs-expired-vblank@d-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464=
/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-1/igt@kms_flip=
@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-6/igt@kms_flip=
@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_fl=
ip@plain-flip-fb-recreate.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@kms=
_flip@plain-flip-fb-recreate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_fl=
ip@plain-flip-fb-recreate@a-dp4.html">FAIL</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@kms_flip@pl=
ain-flip-fb-recreate@a-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-2/igt@kms_fli=
p@wf_vblank-ts-check@a-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@k=
ms_flip@wf_vblank-ts-check@a-hdmi-a1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1455=
39v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-d=
raw-blt.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-=
1/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_jo=
iner@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4328">Intel XE#4328</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@k=
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
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_lease@=
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
/intel-xe/xe-pw-145539v2/shard-dg2-433/igt@kms_plane_scaling@plane-upscale-=
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
.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.htm=
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
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/sh=
ard-dg2-432/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-8/igt@kms_pm_r=
pm@modeset-stress-extra-wait.html">DMESG-WARN</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_pm_rpm=
@modeset-stress-extra-wait.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_pm=
_rpm@modeset-stress-extra-wait.html">DMESG-WARN</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@kms_pm=
_rpm@modeset-stress-extra-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-lnl-3/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-lnl=
-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
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
-pw-145539v2/shard-dg2-436/igt@xe_evict_ccs@evict-overcommit-standalone-ins=
tantfree-reopen.html">PASS</a> +24 other tests pass</li>
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
w-145539v2/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-basic-defer-bind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind-err:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@xe_exe=
c_threads@threads-hang-rebind-err.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-d=
g2-464/igt@xe_exec_threads@threads-hang-rebind-err.html">PASS</a></li>
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
-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-145539v2/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-43=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-434/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
5539v2/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-434/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/sh=
ard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-145539v2/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-4=
35/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
45539v2/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-463/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-145539v2/shard-dg2-433/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/s=
hard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-145539v2/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-=
463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-435/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
145539v2/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/=
shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-436/igt@xe_module_=
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
l-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@xe_pm@s2idle-=
mocs.html">PASS</a> +1 other test pass</li>
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
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@xe_pm@=
s3-basic.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@xe_pm@=
s3-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4330">Intel XE#4330</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@xe=
_pm@s3-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_cc=
s@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
87">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-145539v2/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mt=
l-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@kms_cc=
s@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel X=
E#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-145539v2/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-cc=
s@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_co=
ntent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/igt@kms_c=
ontent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-434/igt@kms_cu=
rsor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2=
/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309"=
>Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-1/igt@kms_curs=
or_legacy@2x-long-flip-vs-cursor-atomic.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/s=
hard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">In=
tel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-7/igt@kms_curs=
or_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/sha=
rd-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Inte=
l XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-modeset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_f=
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
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-rmfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-434/igt@kms_fl=
ip@flip-vs-expired-vblank.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-464/=
igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-435/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/s=
hard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Int=
el XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
145539v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +14 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
145539v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
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
145539v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-sh=
rfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
145539v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
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
45539v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
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
pw-145539v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/=
shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1455=
39v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539=
v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>) +9 other tests skip</li>
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
45539v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-4/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-2/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-464/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/sha=
rd-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500=
">Intel XE#1500</a>)</li>
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
ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-145539v2/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/sh=
ard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-145539v2/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-6/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539=
v2/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-145539v2/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adl=
p-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
45539v2/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-4/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-145539v2/shard-adlp-1/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shar=
d-adlp-6/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-3/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-145539v2/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-2/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-145539v2/shard-adlp-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539=
v2/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adlp-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-145539v2/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-adl=
p-9/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-dg2-463/igt@xe_pee=
r2peer@write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-dg2-432/igt@xe_peer2peer@wri=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176/shard-bmg-8/igt@xe_pm@s4=
-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4268">Intel XE#4268</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-145539v2/shard-bmg-1/igt@xe_pm@s4-basic-exe=
c.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4054">Intel XE#4054</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4268">Intel XE#4268</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8250 -&gt; IGT_8251</li>
<li>Linux: xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176 -&gt; xe-pw-145=
539v2</li>
</ul>
<p>IGT_8250: 43a53635da9a5ecb1a9ca189cb15df2c0b78bd38 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8251: f0b66883398b4a07bb8fcaa3663a2140129d9a58 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2725-2a3ff290a74cd6294c39faafae2f6033694f1176: 2a3ff290a74cd6294c39faa=
fae2f6033694f1176<br />
  xe-pw-145539v2: 145539v2</p>

</body>
</html>

--===============8250303338430035626==--
