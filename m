Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C894FE7717F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 12:57:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901AC10E607;
	Mon, 16 Dec 2024 12:57:47 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2736E10E1C7;
 Mon, 16 Dec 2024 12:57:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8684921583967670899=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/xe3=3A_do_not_con?=
 =?utf-8?q?figure_auto_min_dbuf_for_cursor_WMs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Dec 2024 12:57:47 -0000
Message-ID: <173435386714.3285310.10472838954647238764@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241213120357.300584-1-vinod.govindapillai@intel.com>
In-Reply-To: <20241213120357.300584-1-vinod.govindapillai@intel.com>
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

--===============8684921583967670899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/xe3: do not configure auto min dbuf for cursor WMs (rev2)
URL   : https://patchwork.freedesktop.org/series/142558/
State : failure

== Summary ==

CI Bug Log - changes from xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3_full -> xe-pw-142558v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142558v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142558v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142558v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1:
    - shard-lnl:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4] +9 other tests incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-4/igt@kms_cursor_crc@cursor-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html
    - shard-dg2-set2:     [PASS][5] -> [INCOMPLETE][6] +2 other tests incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-433/igt@kms_fbcon_fbt@fbc-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-436/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][10] -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system:
    - shard-lnl:          [PASS][12] -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-6/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-4/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-bmg:          [PASS][14] -> [TIMEOUT][15] +1 other test timeout
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-4/igt@xe_pm@s4-vm-bind-prefetch.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-8/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_vm@bind-array-enobufs:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@xe_vm@bind-array-enobufs.html

  
#### Warnings ####

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][17] ([Intel XE#3304]) -> [INCOMPLETE][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-435/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  
Known issues
------------

  Here are the changes found in xe-pw-142558v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#3157])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-linear:
    - shard-lnl:          NOTRUN -> [FAIL][20] ([Intel XE#3719])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-linear.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][21] -> [FAIL][22] ([Intel XE#1426]) +3 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1124]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-9/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1407]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][25] ([Intel XE#1725])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][26] -> [DMESG-FAIL][27] ([Intel XE#324])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][28] -> [FAIL][29] ([Intel XE#3600])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-adlp:         [PASS][30] -> [FAIL][31] ([Intel XE#1874]) +1 other test fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-9/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1124]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][33] -> [FAIL][34] ([Intel XE#1231])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1124]) +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1477])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#610])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#610])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#2191])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#2191])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#367])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1512])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-4/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2887]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#787]) +20 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#2887]) +5 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#787]) +8 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#3432])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#2907]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][52] -> [INCOMPLETE][53] ([Intel XE#1727])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][54] -> [DMESG-WARN][55] ([Intel XE#1727] / [Intel XE#3113])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#306])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-1/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#373])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#373]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2252]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-1/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#373]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][61] ([Intel XE#1178])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#3278])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1424]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#308])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2320])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][66] -> [SKIP][67] ([Intel XE#2291]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][68] -> [DMESG-WARN][69] ([Intel XE#877])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#309]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][71] -> [SKIP][72] ([Intel XE#2425])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#2244])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-2/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2374])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-7/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1421]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][76] -> [FAIL][77] ([Intel XE#301]) +13 other tests fail
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][78] ([Intel XE#2597])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#2316]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-7/igt@kms_flip@2x-plain-flip.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-dg2-set2:     [PASS][81] -> [FAIL][82] ([Intel XE#886]) +2 other tests fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-435/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][83] ([Intel XE#2635])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp2:
    - shard-bmg:          [PASS][84] -> [FAIL][85] ([Intel XE#3321])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank@b-dp2.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@b-dp2.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [PASS][86] -> [INCOMPLETE][87] ([Intel XE#2049] / [Intel XE#2597])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html
    - shard-lnl:          [PASS][88] -> [INCOMPLETE][89] ([Intel XE#2049]) +1 other test incomplete
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-1/igt@kms_flip@flip-vs-suspend.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][90] -> [INCOMPLETE][91] ([Intel XE#2597]) +3 other tests incomplete
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [PASS][92] -> [DMESG-WARN][93] ([Intel XE#2953] / [Intel XE#3086]) +1 other test dmesg-warn
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [PASS][94] -> [INCOMPLETE][95] ([Intel XE#2049])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-dp2:
    - shard-bmg:          [PASS][96] -> [FAIL][97] ([Intel XE#2882]) +2 other tests fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-5/igt@kms_flip@plain-flip-ts-check-interruptible@a-dp2.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-5/igt@kms_flip@plain-flip-ts-check-interruptible@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1397] / [Intel XE#1745])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1397])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][100] -> [DMESG-FAIL][101] ([Intel XE#1727] / [Intel XE#324]) +1 other test dmesg-fail
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#455]) +6 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1401]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([i915#5274])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#651]) +6 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#656]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2312]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#656]) +17 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-rte.html

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#651])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [PASS][111] -> [FAIL][112] ([Intel XE#1861]) +1 other test fail
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [FAIL][113] ([Intel XE#2333]) +1 other test fail
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2311]) +6 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#651]) +11 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#653]) +6 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#653]) +4 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2313]) +4 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#2927])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_mmap_write_crc@main:
    - shard-adlp:         [PASS][120] -> [DMESG-WARN][121] ([Intel XE#3086]) +8 other tests dmesg-warn
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-9/igt@kms_mmap_write_crc@main.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-2/igt@kms_mmap_write_crc@main.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-bmg:          [PASS][122] -> [INCOMPLETE][123] ([Intel XE#3663])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-4/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#2763]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2763]) +4 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#2763]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#2763]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          NOTRUN -> [FAIL][130] ([Intel XE#1430])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#1489]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#2893]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#1489]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#1489]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-7/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#1406])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-4/igt@kms_psr@pr-primary-blt.html

  * igt@kms_psr@psr2-cursor-render:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#2850] / [Intel XE#929])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-3/igt@kms_psr@psr2-cursor-render.html

  * igt@kms_setmode@basic:
    - shard-adlp:         [PASS][140] -> [FAIL][141] ([Intel XE#2883]) +2 other tests fail
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-2/igt@kms_setmode@basic.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@kms_setmode@basic.html
    - shard-dg2-set2:     [PASS][142] -> [FAIL][143] ([Intel XE#2883] / [Intel XE#3180])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-436/igt@kms_setmode@basic.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][144] -> [FAIL][145] ([Intel XE#2883]) +4 other tests fail
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-436/igt@kms_setmode@basic@pipe-a-dp-4.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_setmode@basic@pipe-a-dp-4.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][146] -> [FAIL][147] ([Intel XE#3180])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-436/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][148] -> [FAIL][149] ([Intel XE#2159]) +1 other test fail
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#455]) +4 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@kms_vrr@flip-suspend.html
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#1499])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-4/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#756])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-2/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#1091] / [Intel XE#2849])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-2/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_ccs@block-multicopy-inplace:
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#455] / [Intel XE#488])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@xe_ccs@block-multicopy-inplace.html

  * igt@xe_ccs@suspend-resume:
    - shard-lnl:          [PASS][155] -> [INCOMPLETE][156] ([Intel XE#1616] / [Intel XE#2771])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-6/igt@xe_ccs@suspend-resume.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-4/igt@xe_ccs@suspend-resume.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:
    - shard-lnl:          [PASS][157] -> [INCOMPLETE][158] ([Intel XE#2771])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-6/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-4/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#2905]) +4 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-433/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_eudebug_online@interrupt-reconnect:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#2905]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@xe_eudebug_online@interrupt-reconnect.html
    - shard-adlp:         NOTRUN -> [SKIP][162] ([Intel XE#2905])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-9/igt@xe_eudebug_online@interrupt-reconnect.html

  * igt@xe_eudebug_online@pagefault-read:
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#2905]) +3 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-8/igt@xe_eudebug_online@pagefault-read.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-bmg:          NOTRUN -> [TIMEOUT][164] ([Intel XE#1473])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#688]) +5 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-4/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][166] ([Intel XE#1392]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#2322]) +3 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#1392]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-2/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][169] ([Intel XE#288]) +5 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#288]) +7 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-436/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-dg2-set2:     [PASS][171] -> [INCOMPLETE][172] ([Intel XE#3592])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-434/igt@xe_exec_reset@cm-gt-reset.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race:
    - shard-adlp:         [PASS][173] -> [TIMEOUT][174] ([Intel XE#1727] / [Intel XE#402])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-1/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-3/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-cm-userptr-rebind:
    - shard-dg2-set2:     [PASS][175] -> [INCOMPLETE][176] ([Intel XE#1169])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-434/igt@xe_exec_threads@threads-cm-userptr-rebind.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-436/igt@xe_exec_threads@threads-cm-userptr-rebind.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-lnl:          [PASS][177] -> [SKIP][178] ([Intel XE#1192]) +3 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@xe_live_ktest@xe_migrate.html
    - shard-bmg:          [PASS][179] -> [SKIP][180] ([Intel XE#1192])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-7/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_mmap@small-bar:
    - shard-adlp:         NOTRUN -> [SKIP][181] ([Intel XE#512])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-8/igt@xe_mmap@small-bar.html
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#586])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-1/igt@xe_mmap@small-bar.html
    - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#512])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-lnl:          NOTRUN -> [SKIP][184] ([Intel XE#378])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-6/igt@xe_module_load@force-load.html

  * igt@xe_oa@oa-unit-concurrent-oa-buffer-read:
    - shard-adlp:         NOTRUN -> [SKIP][185] ([Intel XE#2541] / [Intel XE#3573])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-2/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][186] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#2284] / [Intel XE#366])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s3-basic:
    - shard-adlp:         [PASS][188] -> [ABORT][189] ([Intel XE#1358] / [Intel XE#1794])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-3/igt@xe_pm@s3-basic.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-8/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [PASS][190] -> [ABORT][191] ([Intel XE#1794])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-3/igt@xe_pm@s4-mocs.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-9/igt@xe_pm@s4-mocs.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][192] ([Intel XE#944])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_vm@large-userptr-split-binds-1073741824:
    - shard-adlp:         [PASS][193] -> [TIMEOUT][194] ([Intel XE#1727])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-3/igt@xe_vm@large-userptr-split-binds-1073741824.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-3/igt@xe_vm@large-userptr-split-binds-1073741824.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][195] ([Intel XE#3701] / [Intel XE#3718]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
    - shard-bmg:          [FAIL][197] ([Intel XE#3802]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:
    - shard-bmg:          [FAIL][199] ([Intel XE#3746]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         [FAIL][201] ([Intel XE#1874]) -> [PASS][202] +4 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][203] ([Intel XE#324]) -> [PASS][204] +1 other test pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][205] ([Intel XE#3052]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][207] ([Intel XE#1231]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][209] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][211] ([Intel XE#2291]) -> [PASS][212] +2 other tests pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][213] ([Intel XE#1340]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][215] -> [PASS][216] +1 other test pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-435/igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-434/igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][217] ([Intel XE#2882]) -> [PASS][218] +3 other tests pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-8/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [SKIP][219] ([Intel XE#2316]) -> [PASS][220] +6 other tests pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          [FAIL][221] ([Intel XE#886]) -> [PASS][222] +1 other test pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][223] ([Intel XE#301]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [FAIL][225] ([Intel XE#3321]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [FAIL][227] ([Intel XE#1861]) -> [PASS][228] +2 other tests pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-lnl:          [INCOMPLETE][229] ([Intel XE#2566]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-3/igt@kms_plane@pixel-format-source-clamping.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-lnl:          [INCOMPLETE][231] -> [PASS][232] +1 other test pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-3/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-adlp:         [INCOMPLETE][233] -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-3/igt@kms_pm_rpm@cursor-dpms.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-9/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][235] ([Intel XE#899]) -> [PASS][236] +1 other test pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@ts-continuation-idle@pipe-d-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][237] ([Intel XE#877]) -> [PASS][238] +1 other test pass
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-8/igt@kms_vblank@ts-continuation-idle@pipe-d-hdmi-a-3.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-7/igt@kms_vblank@ts-continuation-idle@pipe-d-hdmi-a-3.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][239] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][240] +2 other tests pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_exec_balancer@twice-parallel-userptr-invalidate:
    - shard-dg2-set2:     [DMESG-FAIL][241] -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-434/igt@xe_exec_balancer@twice-parallel-userptr-invalidate.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-436/igt@xe_exec_balancer@twice-parallel-userptr-invalidate.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-adlp:         [DMESG-WARN][243] ([Intel XE#3086]) -> [PASS][244] +6 other tests pass
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-4/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-9/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [ABORT][245] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-9/igt@xe_pm@s4-basic.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-1/igt@xe_pm@s4-basic.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [FAIL][247] ([Intel XE#958]) -> [PASS][248]
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-3/igt@xe_pm_residency@toggle-gt-c6.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html
    - shard-lnl:          [FAIL][249] ([Intel XE#958]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          [INCOMPLETE][251] -> [FAIL][252] ([Intel XE#3719])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-WARN][253] ([Intel XE#3818]) -> [DMESG-FAIL][254] ([Intel XE#3818])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][255] ([Intel XE#2341]) -> [FAIL][256] ([Intel XE#1178])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][257] ([Intel XE#1178]) -> [INCOMPLETE][258] ([Intel XE#2715])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-435/igt@kms_content_protection@lic-type-0.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-433/igt@kms_content_protection@lic-type-0.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][259] ([Intel XE#2882]) -> [SKIP][260] ([Intel XE#2316])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][261] ([Intel XE#2316]) -> [INCOMPLETE][262] ([Intel XE#2635])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          [TIMEOUT][263] ([Intel XE#1504]) -> [INCOMPLETE][264] ([Intel XE#1504]) +1 other test incomplete
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-7/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][265] ([Intel XE#2311]) -> [SKIP][266] ([Intel XE#2312]) +5 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][267] ([Intel XE#2312]) -> [SKIP][268] ([Intel XE#2311]) +14 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [FAIL][269] ([Intel XE#2333]) -> [SKIP][270] ([Intel XE#2312]) +3 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][271] ([Intel XE#2312]) -> [FAIL][272] ([Intel XE#2333]) +5 other tests fail
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][273] ([Intel XE#2312]) -> [SKIP][274] ([Intel XE#2313]) +11 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][275] ([Intel XE#2313]) -> [SKIP][276] ([Intel XE#2312]) +5 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-adlp:         [SKIP][277] ([Intel XE#455]) -> [TIMEOUT][278] ([Intel XE#1727])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-1/igt@kms_hdr@bpc-switch-dpms.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-3/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][279] ([Intel XE#3544]) -> [SKIP][280] ([Intel XE#3374] / [Intel XE#3544])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][281] ([Intel XE#1729]) -> [SKIP][282] ([Intel XE#362])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-adlp:         [SKIP][283] ([Intel XE#1126]) -> [TIMEOUT][284] ([Intel XE#1727])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-6/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-3/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [TIMEOUT][285] ([Intel XE#1473]) -> [FAIL][286] ([Intel XE#1000])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-8/igt@xe_evict@evict-beng-threads-large.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          [TIMEOUT][287] ([Intel XE#1473]) -> [INCOMPLETE][288] ([Intel XE#1473]) +1 other test incomplete
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][289] ([Intel XE#2833]) -> [SKIP][290] ([Intel XE#1192])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-7/igt@xe_live_ktest@xe_eudebug.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-5/igt@xe_live_ktest@xe_eudebug.html
    - shard-lnl:          [SKIP][291] ([Intel XE#2833]) -> [SKIP][292] ([Intel XE#1192] / [Intel XE#3026])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-8/igt@xe_live_ktest@xe_eudebug.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@xe_live_ktest@xe_eudebug.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2771
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026
  [Intel XE#3052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#3180]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3180
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3592]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3592
  [Intel XE#3600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3600
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#3663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3663
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3746]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3746
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3802]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3802
  [Intel XE#3818]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3818
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_8156 -> IGT_8157
  * Linux: xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3 -> xe-pw-142558v2

  IGT_8156: edf352a96646c8d793f0c1eb11795112f9bde725 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8157: 48a70f6795e6d68b9fae275261ae3b09d3401fe1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3: 63be16e210b1c3e43b43d8ca9b7e17f15142d2c3
  xe-pw-142558v2: 142558v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/index.html

--===============8684921583967670899==
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
<tr><td><b>Series:</b></td><td>drm/i915/xe3: do not configure auto min dbuf for cursor WMs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142558/">https://patchwork.freedesktop.org/series/142558/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3_full -&gt; xe-pw-142558v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142558v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-142558v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-142558v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-4/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> +9 other tests incomplete</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-433/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-436/igt@kms_fbcon_fbt@fbc-suspend.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-6/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-4/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-4/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-8/igt@xe_pm@s4-vm-bind-prefetch.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-enobufs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@xe_vm@bind-array-enobufs.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-435/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142558v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-linear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719">Intel XE#3719</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-9/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3600">Intel XE#3600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-9/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-4/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-1/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-1/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-4/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-2/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-7/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +13 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-7/igt@kms_flip@2x-plain-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-435/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank@b-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@b-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-1/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-8/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-5/igt@kms_flip@plain-flip-ts-check-interruptible@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-5/igt@kms_flip@plain-flip-ts-check-interruptible@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mmap_write_crc@main:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-9/igt@kms_mmap_write_crc@main.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-2/igt@kms_mmap_write_crc@main.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-4/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3663">Intel XE#3663</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-7/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-4/igt@kms_psr@pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-3/igt@kms_psr@psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-2/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-436/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3180">Intel XE#3180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-436/igt@kms_setmode@basic@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_setmode@basic@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-436/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3180">Intel XE#3180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-4/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-2/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-2/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@xe_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-6/igt@xe_ccs@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-4/igt@xe_ccs@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2771">Intel XE#2771</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-6/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-4/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2771">Intel XE#2771</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-433/igt@xe_eudebug_online@debugger-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-reconnect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@xe_eudebug_online@interrupt-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-9/igt@xe_eudebug_online@interrupt-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-8/igt@xe_eudebug_online@pagefault-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-4/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-2/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-436/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-434/igt@xe_exec_reset@cm-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@xe_exec_reset@cm-gt-reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3592">Intel XE#3592</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-1/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-3/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-434/igt@xe_exec_threads@threads-cm-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-436/igt@xe_exec_threads@threads-cm-userptr-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +3 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-7/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-8/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-1/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-6/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-concurrent-oa-buffer-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-2/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-3/igt@xe_pm@s3-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-8/igt@xe_pm@s3-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-3/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-1073741824:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-3/igt@xe_vm@large-userptr-split-binds-1073741824.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-3/igt@xe_vm@large-userptr-split-binds-1073741824.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701">Intel XE#3701</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3802">Intel XE#3802</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3746">Intel XE#3746</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052">Intel XE#3052</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-435/igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-434/igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-8/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-3/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@kms_plane@pixel-format-source-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-3/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-3/igt@kms_pm_rpm@cursor-dpms.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-9/igt@kms_pm_rpm@cursor-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-8/igt@kms_vblank@ts-continuation-idle@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-7/igt@kms_vblank@ts-continuation-idle@pipe-d-hdmi-a-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-434/igt@xe_exec_balancer@twice-parallel-userptr-invalidate.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-436/igt@xe_exec_balancer@twice-parallel-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-4/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-9/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-1/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719">Intel XE#3719</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3818">Intel XE#3818</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3818">Intel XE#3818</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-435/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-433/igt@kms_content_protection@lic-type-0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-7/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-1/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-3/igt@kms_hdr@bpc-switch-dpms.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-adlp-6/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-adlp-3/igt@xe_copy_basic@mem-set-linear-0xfd.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-8/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-bmg-7/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-bmg-5/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3/shard-lnl-8/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142558v2/shard-lnl-5/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026">Intel XE#3026</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8156 -&gt; IGT_8157</li>
<li>Linux: xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3 -&gt; xe-pw-142558v2</li>
</ul>
<p>IGT_8156: edf352a96646c8d793f0c1eb11795112f9bde725 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8157: 48a70f6795e6d68b9fae275261ae3b09d3401fe1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3: 63be16e210b1c3e43b43d8ca9b7e17f15142d2c3<br />
  xe-pw-142558v2: 142558v2</p>

</body>
</html>

--===============8684921583967670899==--
