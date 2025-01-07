Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF5AE77197
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 23:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DFB10E253;
	Tue,  7 Jan 2025 23:28:03 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B34410E350;
 Tue,  7 Jan 2025 23:28:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1679476368267179069=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Add_PXP_HWDRM_support_=28r?=
 =?utf-8?q?ev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Jan 2025 23:28:01 -0000
Message-ID: <173629248160.1001743.15077858132000624572@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250106211212.3418231-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250106211212.3418231-1-daniele.ceraolospurio@intel.com>
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

--===============1679476368267179069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add PXP HWDRM support (rev4)
URL   : https://patchwork.freedesktop.org/series/136052/
State : failure

== Summary ==

CI Bug Log - changes from xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd_full -> xe-pw-136052v4_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136052v4_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136052v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136052v4_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_interruptible@universal-setplane-cursor:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +3 other tests incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_atomic_interruptible@universal-setplane-cursor.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_atomic_interruptible@universal-setplane-cursor.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3:
    - shard-bmg:          [PASS][3] -> [FAIL][4] +2 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html

  * igt@xe_create@create-invalid-mbz:
    - shard-adlp:         [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-3/igt@xe_create@create-invalid-mbz.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-8/igt@xe_create@create-invalid-mbz.html

  * igt@xe_exec_queue_property@invalid-property:
    - shard-lnl:          [PASS][7] -> [FAIL][8] +2 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-4/igt@xe_exec_queue_property@invalid-property.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-6/igt@xe_exec_queue_property@invalid-property.html

  * igt@xe_vm@bind-flag-invalid:
    - shard-bmg:          NOTRUN -> [FAIL][9] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@xe_vm@bind-flag-invalid.html
    - shard-adlp:         NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-6/igt@xe_vm@bind-flag-invalid.html

  
#### Warnings ####

  * igt@xe_create@create-invalid-mbz:
    - shard-dg2-set2:     [SKIP][11] ([Intel XE#1130]) -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_create@create-invalid-mbz.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@xe_create@create-invalid-mbz.html

  
Known issues
------------

  Here are the changes found in xe-pw-136052v4_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getstats:
    - shard-dg2-set2:     [PASS][13] -> [SKIP][14] ([Intel XE#2423]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@core_getstats.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@core_getstats.html

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [PASS][15] -> [FAIL][16] ([Intel XE#3440])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@core_getversion@all-cards.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-adlp:         NOTRUN -> [ABORT][17] ([Intel XE#3914])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-6/igt@core_hotunplug@hotunplug-rescan.html

  * igt@core_hotunplug@unplug-rescan:
    - shard-dg2-set2:     [PASS][18] -> [SKIP][19] ([Intel XE#1885]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@core_hotunplug@unplug-rescan.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@core_hotunplug@unplug-rescan.html

  * igt@fbdev@unaligned-write:
    - shard-dg2-set2:     [PASS][20] -> [SKIP][21] ([Intel XE#2134])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@fbdev@unaligned-write.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@fbdev@unaligned-write.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][22] ([Intel XE#3781])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-6.html

  * igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][23] -> [DMESG-WARN][24] ([Intel XE#1033]) +1 other test dmesg-warn
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-1/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-8/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#2423] / [i915#2575]) +11 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2370])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2327]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#316]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#607])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [PASS][30] -> [SKIP][31] ([Intel XE#2136]) +40 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#3658])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1124]) +7 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1407])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-6/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#316])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#1124]) +12 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][39] -> [DMESG-FAIL][40] ([Intel XE#1033]) +8 other tests dmesg-fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2328]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#610])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1124]) +5 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1124])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#2191])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#2191]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1512])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#367]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#787]) +26 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#2887]) +9 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2887]) +14 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#3432]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#3432])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][57] -> [INCOMPLETE][58] ([Intel XE#2705])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#2907]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2652] / [Intel XE#787]) +17 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#787]) +146 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1152]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2252]) +7 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2325])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#306]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-1/igt@kms_chamelium_color@ctm-blue-to-red.html
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#306])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-4/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#306])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#373]) +10 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-1/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#373]) +8 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#373]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@content-type-change:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#3278])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-4/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#307])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#307]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][74] ([Intel XE#1178]) +1 other test fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2341])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2320]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2321])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1424]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     [PASS][79] -> [SKIP][80] ([Intel XE#2423] / [i915#2575]) +115 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#309]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#309])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][83] -> [DMESG-WARN][84] ([Intel XE#877])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2244]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#2244])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2372])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_feature_discovery@chamelium.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#701])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#701])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-4/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1138])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-6/igt@kms_feature_discovery@display-4x.html
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1138])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1137])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@kms_feature_discovery@dp-mst.html
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1137])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1421]) +7 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-5/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][95] ([Intel XE#2882] / [Intel XE#3288]) +1 other test fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][96] -> [FAIL][97] ([Intel XE#3321]) +2 other tests fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][98] -> [FAIL][99] ([Intel XE#2882]) +1 other test fail
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][100] ([Intel XE#3879]) +6 other tests fail
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#310]) +6 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][102] -> [SKIP][103] ([Intel XE#3007]) +10 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [PASS][104] -> [INCOMPLETE][105] ([Intel XE#2049])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][106] -> [FAIL][107] ([Intel XE#301]) +5 other tests fail
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     [PASS][108] -> [FAIL][109] ([Intel XE#301] / [Intel XE#3321])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][110] ([Intel XE#2597])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [PASS][111] -> [FAIL][112] ([Intel XE#886]) +2 other tests fail
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [PASS][113] -> [SKIP][114] ([Intel XE#2136] / [Intel XE#2351]) +17 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2293]) +4 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1401]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#1397] / [Intel XE#1745])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1397])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-adlp:         [PASS][120] -> [DMESG-FAIL][121] ([Intel XE#1033] / [Intel XE#324]) +1 other test dmesg-fail
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#352])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-4/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#2311]) +31 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#651]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [FAIL][126] ([Intel XE#2333]) +14 other tests fail
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#656]) +21 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#651]) +8 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2136] / [Intel XE#2231]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#651]) +7 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#653]) +6 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#653]) +2 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2313]) +25 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#656]) +27 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_histogram@algo-color:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#3897])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-6/igt@kms_histogram@algo-color.html

  * igt@kms_histogram@global-basic:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#3898])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-1/igt@kms_histogram@global-basic.html

  * igt@kms_histogram@global-color:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#3898])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_histogram@global-color.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#455]) +5 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_panel_fitting@atomic-fastset.html
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2486])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#599]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2393])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-y@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][142] ([Intel XE#1033]) +4 other tests dmesg-fail
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@kms_plane_lowres@tiling-y@pipe-b-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][143] ([Intel XE#1874])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html

  * igt@kms_plane_multiple@tiling-x:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#3007]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_plane_multiple@tiling-x.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2493])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#455]) +16 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-4/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#3307])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-2/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][148] ([Intel XE#361])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#2763]) +11 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#2763]) +19 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#870])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#2392])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#1129])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          NOTRUN -> [FAIL][154] ([Intel XE#2029])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#2499])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#2446])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [PASS][158] -> [SKIP][159] ([Intel XE#2446]) +5 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#2446])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#2893]) +3 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][162] ([Intel XE#1489]) +4 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-1/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#1489])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#1489]) +8 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#2234] / [Intel XE#2850]) +15 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#2136]) +11 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#1406]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-5/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-adlp:         NOTRUN -> [SKIP][169] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#2414])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#1435])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][173] -> [FAIL][174] ([Intel XE#899])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#1499])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][176] ([Intel XE#1499])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-adlp:         NOTRUN -> [SKIP][177] ([Intel XE#455] / [Intel XE#488])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01:
    - shard-bmg:          [PASS][178] -> [FAIL][179] ([Intel XE#3664]) +1 other test fail
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-5/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html

  * igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-vram01:
    - shard-bmg:          [PASS][180] -> [INCOMPLETE][181] ([Intel XE#3918])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-5/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-vram01.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-vram01.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][182] ([Intel XE#1126])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][183] ([Intel XE#1130]) +24 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-close:
    - shard-lnl:          NOTRUN -> [SKIP][184] ([Intel XE#2905]) +5 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-6/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-bmg:          NOTRUN -> [SKIP][185] ([Intel XE#2905]) +11 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-adlp:         NOTRUN -> [SKIP][186] ([Intel XE#2905]) +7 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-bmg:          NOTRUN -> [TIMEOUT][187] ([Intel XE#1473])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][188] -> [TIMEOUT][189] ([Intel XE#1473])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][190] ([Intel XE#261] / [Intel XE#688]) +3 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-adlp:         NOTRUN -> [SKIP][191] ([Intel XE#688]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][192] ([Intel XE#688]) +4 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [PASS][193] -> [SKIP][194] ([Intel XE#1130]) +215 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@xe_exec_basic@many-null-rebind.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][195] ([Intel XE#1392]) +5 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][196] ([Intel XE#2322]) +7 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][197] ([Intel XE#1392]) +7 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][198] ([Intel XE#288])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][199] ([Intel XE#1130]) +4 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - shard-adlp:         NOTRUN -> [SKIP][200] ([Intel XE#288]) +17 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-9/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
    - shard-bmg:          [PASS][201] -> [SKIP][202] ([Intel XE#1130]) +23 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-5/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][203] ([Intel XE#2360])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-1/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][204] ([Intel XE#2459] / [Intel XE#2596])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-lnl:          NOTRUN -> [SKIP][205] ([Intel XE#512])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-8/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     NOTRUN -> [FAIL][206] ([Intel XE#3546])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [PASS][207] -> [FAIL][208] ([Intel XE#3546])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@xe_module_load@reload-no-display.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@xe_module_load@reload-no-display.html

  * igt@xe_noexec_ping_pong:
    - shard-lnl:          NOTRUN -> [SKIP][209] ([Intel XE#379])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-5/igt@xe_noexec_ping_pong.html

  * igt@xe_oa@create-destroy-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][210] ([Intel XE#2541] / [Intel XE#3573]) +4 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-1/igt@xe_oa@create-destroy-userspace-config.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][211] ([Intel XE#2541] / [Intel XE#3573])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][212] ([Intel XE#2248])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][213] ([Intel XE#2284] / [Intel XE#366])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html
    - shard-adlp:         NOTRUN -> [SKIP][214] ([Intel XE#2284] / [Intel XE#366])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-4/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          NOTRUN -> [SKIP][215] ([Intel XE#2284]) +4 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][216] -> [ABORT][217] ([Intel XE#1358] / [Intel XE#1607])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-4/igt@xe_pm@s4-basic.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-lnl:          NOTRUN -> [SKIP][218] ([Intel XE#579])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-4/igt@xe_pm@vram-d3cold-threshold.html
    - shard-adlp:         NOTRUN -> [SKIP][219] ([Intel XE#579])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-6/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-adlp:         [PASS][220] -> [DMESG-WARN][221] ([Intel XE#2953]) +4 other tests dmesg-warn
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][222] -> [FAIL][223] ([Intel XE#958])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][224] ([Intel XE#944])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-lnl:          NOTRUN -> [SKIP][225] ([Intel XE#944]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
    - shard-adlp:         NOTRUN -> [SKIP][226] ([Intel XE#944]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-9/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  
#### Possible fixes ####

  * igt@core_getversion@basic:
    - shard-dg2-set2:     [FAIL][227] ([Intel XE#3440]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@core_getversion@basic.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@core_getversion@basic.html

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1885]) -> [PASS][230] +1 other test pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@core_hotunplug@hotreplug-lateclose.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#2134]) -> [PASS][232] +1 other test pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@fbdev@info.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@fbdev@info.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          [FAIL][233] ([Intel XE#3719]) -> [PASS][234] +3 other tests pass
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][235] ([Intel XE#1033]) -> [PASS][236] +6 other tests pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][238] +11 other tests pass
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][239] ([Intel XE#1033]) -> [PASS][240] +8 other tests pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [FAIL][241] -> [PASS][242] +4 other tests pass
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][243] ([Intel XE#2882]) -> [PASS][244] +3 other tests pass
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend@ad-dp2-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][245] -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend@ad-dp2-hdmi-a3.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend@ad-dp2-hdmi-a3.html

  * igt@kms_flip@blocking-absolute-wf_vblank@d-hdmi-a1:
    - shard-adlp:         [INCOMPLETE][247] -> [PASS][248] +1 other test pass
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-1/igt@kms_flip@blocking-absolute-wf_vblank@d-hdmi-a1.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-1/igt@kms_flip@blocking-absolute-wf_vblank@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [INCOMPLETE][249] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp2:
    - shard-bmg:          [INCOMPLETE][251] ([Intel XE#2597]) -> [PASS][252]
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible@c-dp2.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp2.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][253] ([Intel XE#2049]) -> [PASS][254]
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:
    - shard-adlp:         [FAIL][255] ([Intel XE#2882]) -> [PASS][256] +1 other test pass
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-3/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [FAIL][257] ([Intel XE#886]) -> [PASS][258] +1 other test pass
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#2351]) -> [PASS][260]
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#2136]) -> [PASS][262] +33 other tests pass
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_getfb@getfb-addfb-different-handles:
    - shard-bmg:          [SKIP][263] ([Intel XE#3007]) -> [PASS][264] +1 other test pass
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-5/igt@kms_getfb@getfb-addfb-different-handles.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_getfb@getfb-addfb-different-handles.html

  * igt@kms_lease@setcrtc-implicit-plane:
    - shard-bmg:          [DMESG-WARN][265] ([Intel XE#877]) -> [PASS][266] +3 other tests pass
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@kms_lease@setcrtc-implicit-plane.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_lease@setcrtc-implicit-plane.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2:
    - shard-bmg:          [FAIL][267] ([Intel XE#3974]) -> [PASS][268]
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#2423] / [i915#2575]) -> [PASS][270] +108 other tests pass
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][271] ([Intel XE#718]) -> [PASS][272]
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@cursor:
    - shard-adlp:         [DMESG-WARN][273] ([Intel XE#2953]) -> [PASS][274] +11 other tests pass
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-3/igt@kms_pm_rpm@cursor.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-3/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#2446]) -> [PASS][276] +4 other tests pass
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_pm_rpm@i2c.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_pm_rpm@i2c.html

  * igt@kms_setmode@basic:
    - shard-adlp:         [FAIL][277] ([Intel XE#2883]) -> [PASS][278] +1 other test pass
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-1/igt@kms_setmode@basic.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][279] ([Intel XE#899]) -> [PASS][280]
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_exec_threads@threads-hang-fd-basic:
    - shard-lnl:          [ABORT][281] -> [PASS][282]
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-basic.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-basic.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-adlp:         [DMESG-WARN][283] ([Intel XE#2953] / [Intel XE#3343]) -> [PASS][284]
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [SKIP][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309], [PASS][310]) ([Intel XE#378]) -> ([PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [PASS][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-5/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-5/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-5/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-4/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-4/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-2/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-2/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-2/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-4/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-4/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-4/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-5/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-1/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-6/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-8/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-6/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-1/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-1/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-1/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-8/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-8/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-3/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-3/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-3/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-3/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-6/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-1/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-2/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-2/igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-8/igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-4/igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-8/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-6/igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-6/igt@xe_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-8/igt@xe_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-5/igt@xe_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-2/igt@xe_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-1/igt@xe_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-4/igt@xe_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-6/igt@xe_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-6/igt@xe_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-5/igt@xe_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-5/igt@xe_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-1/igt@xe_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-4/igt@xe_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@xe_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@xe_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-4/igt@xe_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-1/igt@xe_module_load@load.html
    - shard-adlp:         ([PASS][336], [PASS][337], [PASS][338], [PASS][339], [SKIP][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349], [PASS][350], [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360], [PASS][361]) ([Intel XE#378]) -> ([PASS][362], [PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374], [PASS][375], [PASS][376], [PASS][377], [PASS][378], [PASS][379], [PASS][380], [PASS][381], [PASS][382], [PASS][383], [PASS][384], [PASS][385], [PASS][386])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-1/igt@xe_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-1/igt@xe_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-8/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-2/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-3/igt@xe_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-6/igt@xe_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-6/igt@xe_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-3/igt@xe_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-9/igt@xe_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-8/igt@xe_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-9/igt@xe_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-9/igt@xe_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-9/igt@xe_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-8/igt@xe_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-8/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-6/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-3/igt@xe_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-4/igt@xe_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-4/igt@xe_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-2/igt@xe_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-4/igt@xe_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-4/igt@xe_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-2/igt@xe_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-3/igt@xe_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-1/igt@xe_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-1/igt@xe_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-4/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-8/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-8/igt@xe_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-6/igt@xe_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@xe_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-1/igt@xe_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@xe_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-1/igt@xe_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-1/igt@xe_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-9/igt@xe_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-4/igt@xe_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-4/igt@xe_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-3/igt@xe_module_load@load.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-3/igt@xe_module_load@load.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-6/igt@xe_module_load@load.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-6/igt@xe_module_load@load.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-6/igt@xe_module_load@load.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@xe_module_load@load.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-4/igt@xe_module_load@load.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-3/igt@xe_module_load@load.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-8/igt@xe_module_load@load.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-9/igt@xe_module_load@load.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-9/igt@xe_module_load@load.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-9/igt@xe_module_load@load.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@xe_module_load@load.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][387] ([Intel XE#3546]) -> [PASS][388]
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_module_load@reload.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@xe_module_load@reload.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [ABORT][389] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][390]
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-9/igt@xe_pm@s4-basic.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-4/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [ABORT][391] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][392]
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#1130]) -> [PASS][394] +189 other tests pass
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  
#### Warnings ####

  * igt@kms_async_flips@crc-atomic:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][396] ([Intel XE#3781] / [Intel XE#3946])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_async_flips@crc-atomic.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_async_flips@crc-atomic.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          [SKIP][397] ([Intel XE#2385]) -> [SKIP][398] ([Intel XE#3007])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#316]) -> [SKIP][400] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#2136]) -> [SKIP][402] ([Intel XE#316]) +2 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#316]) -> [SKIP][404] ([Intel XE#2136]) +4 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#610]) -> [SKIP][406] ([Intel XE#2136])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#1124]) -> [SKIP][408] ([Intel XE#2136]) +9 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][410] ([Intel XE#1124]) +1 other test skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][411] ([Intel XE#1124]) -> [SKIP][412] ([Intel XE#2136] / [Intel XE#2231])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#1124]) -> [SKIP][414] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#2136]) -> [SKIP][416] ([Intel XE#1124]) +7 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][418] ([Intel XE#619]) +1 other test skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#607]) -> [SKIP][420] ([Intel XE#2136])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#2191]) -> [SKIP][422] ([Intel XE#2423] / [i915#2575])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#2423] / [i915#2575]) -> [SKIP][424] ([Intel XE#2191]) +2 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#367]) -> [SKIP][426] ([Intel XE#2423] / [i915#2575]) +8 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#2423] / [i915#2575]) -> [SKIP][428] ([Intel XE#367]) +3 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][430] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][432] ([Intel XE#2136]) +16 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][434] ([Intel XE#455] / [Intel XE#787])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          [SKIP][435] ([Intel XE#2887]) -> [SKIP][436] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#2136]) -> [SKIP][438] ([Intel XE#2907])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#2136]) -> [SKIP][440] ([Intel XE#3442]) +1 other test skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#2907]) -> [SKIP][442] ([Intel XE#2136])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#2136]) -> [SKIP][444] ([Intel XE#455] / [Intel XE#787]) +18 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#314]) -> [SKIP][446] ([Intel XE#2136] / [Intel XE#2351])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#2423] / [i915#2575]) -> [SKIP][448] ([Intel XE#373]) +11 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_chamelium_audio@dp-audio.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#306]) -> [SKIP][450] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_chamelium_color@degamma.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#2423] / [i915#2575]) -> [SKIP][452] ([Intel XE#306]) +1 other test skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_chamelium_color@gamma.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-bmg:          [SKIP][453] ([Intel XE#2252]) -> [SKIP][454] ([Intel XE#3007])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#373]) -> [SKIP][456] ([Intel XE#2423] / [i915#2575]) +12 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_color@ctm-0-25:
    - shard-dg2-set2:     [INCOMPLETE][457] -> [SKIP][458] ([Intel XE#2423] / [i915#2575])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_color@ctm-0-25.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_color@ctm-0-25.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [FAIL][459] ([Intel XE#1178]) -> [SKIP][460] ([Intel XE#2423] / [i915#2575])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_content_protection@atomic.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#2423] / [i915#2575]) -> [SKIP][462] ([Intel XE#307]) +1 other test skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_content_protection@dp-mst-type-0.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#307]) -> [SKIP][464] ([Intel XE#2423] / [i915#2575])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [INCOMPLETE][465] ([Intel XE#2715]) -> [SKIP][466] ([Intel XE#2423] / [i915#2575])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_content_protection@lic-type-0.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#2423] / [i915#2575]) -> [SKIP][468] ([Intel XE#455]) +9 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_cursor_crc@cursor-random-32x10.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          [SKIP][469] ([Intel XE#2320]) -> [SKIP][470] ([Intel XE#3007])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#308]) -> [SKIP][472] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#323]) -> [SKIP][474] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#2423] / [i915#2575]) -> [SKIP][476] ([Intel XE#323]) +1 other test skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#2351]) -> [SKIP][478] ([Intel XE#455])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_dsc@dsc-basic.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#455]) -> [SKIP][480] ([Intel XE#2136]) +6 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][482] ([Intel XE#455]) +1 other test skip
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_dsc@dsc-with-formats.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#2423] / [i915#2575]) -> [SKIP][484] ([Intel XE#1137])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#1135]) -> [SKIP][486] ([Intel XE#2423] / [i915#2575])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_feature_discovery@psr1.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][487] ([Intel XE#301]) -> [SKIP][488] ([Intel XE#2423] / [i915#2575])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][489] ([Intel XE#2597]) -> [FAIL][490] ([Intel XE#3879]) +1 other test fail
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][492] ([Intel XE#2049] / [Intel XE#2597])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#455]) -> [SKIP][494] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#2136]) -> [SKIP][496] ([Intel XE#455]) +3 other tests skip
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][497] ([Intel XE#2380]) -> [SKIP][498] ([Intel XE#2136] / [Intel XE#2231])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][499] ([i915#5274]) -> [SKIP][500] ([Intel XE#2423] / [i915#2575])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][501] ([Intel XE#2311]) -> [SKIP][502] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#651]) -> [SKIP][504] ([Intel XE#2136]) +18 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-bmg:          [FAIL][505] ([Intel XE#2333]) -> [SKIP][506] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][507] ([Intel XE#2136]) -> [SKIP][508] ([Intel XE#651]) +21 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][509] ([Intel XE#651]) -> [SKIP][510] ([Intel XE#2136] / [Intel XE#2351]) +13 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][512] ([Intel XE#651]) +8 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][513] ([Intel XE#2136]) -> [SKIP][514] ([Intel XE#653]) +30 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][515] ([Intel XE#2313]) -> [SKIP][516] ([Intel XE#2136] / [Intel XE#2231]) +5 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][517] ([Intel XE#653]) -> [SKIP][518] ([Intel XE#2136] / [Intel XE#2351]) +11 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][519] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][520] ([Intel XE#653]) +8 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][521] ([Intel XE#653]) -> [SKIP][522] ([Intel XE#2136]) +35 other tests skip
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][523] ([Intel XE#2423] / [i915#2575]) -> [SKIP][524] ([Intel XE#605])
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][525] ([Intel XE#455]) -> [SKIP][526] ([Intel XE#2423] / [i915#2575]) +17 other tests skip
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_hdr@invalid-hdr.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_hdr@invalid-hdr.html

  * igt@kms_histogram@algo-basic:
    - shard-dg2-set2:     [SKIP][527] ([Intel XE#3897]) -> [SKIP][528] ([Intel XE#2423] / [i915#2575])
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_histogram@algo-basic.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_histogram@algo-basic.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][529] ([Intel XE#2136]) -> [SKIP][530] ([Intel XE#346])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_joiner@basic-big-joiner.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][531] ([Intel XE#2136]) -> [SKIP][532] ([Intel XE#2925])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][533] ([Intel XE#346]) -> [SKIP][534] ([Intel XE#2136])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][535] ([Intel XE#2136]) -> [SKIP][536] ([Intel XE#2927])
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][537] ([Intel XE#356]) -> [SKIP][538] ([Intel XE#2423] / [i915#2575])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [SKIP][539] ([Intel XE#2423] / [i915#2575]) -> [FAIL][540] ([Intel XE#361])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][541] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][542] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][543] ([Intel XE#2136]) -> [SKIP][544] ([Intel XE#870]) +1 other test skip
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_pm_backlight@fade.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][545] ([Intel XE#1129]) -> [SKIP][546] ([Intel XE#2136])
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][547] ([Intel XE#3309]) -> [SKIP][548] ([Intel XE#2136])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_pm_dc@dc5-retention-flops.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][549] ([Intel XE#908]) -> [SKIP][550] ([Intel XE#2136] / [Intel XE#2351])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][551] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][552] ([Intel XE#1129])
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][553] ([Intel XE#1439] / [Intel XE#836]) -> [SKIP][554] ([Intel XE#2446])
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][555] ([Intel XE#2136]) -> [SKIP][556] ([Intel XE#1489]) +11 other tests skip
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][557] ([Intel XE#1489]) -> [SKIP][558] ([Intel XE#2136]) +11 other tests skip
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][559] ([Intel XE#1489]) -> [SKIP][560] ([Intel XE#2136] / [Intel XE#2231])
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][561] ([Intel XE#2136]) -> [SKIP][562] ([Intel XE#1122])
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][563] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][564] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][565] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][566] ([Intel XE#2136]) +15 other tests skip
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-cursor-render:
    - shard-bmg:          [SKIP][567] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][568] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@kms_psr@pr-cursor-render.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_psr@pr-cursor-render.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][569] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][570] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_psr@psr-dpms.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][571] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][572] ([Intel XE#2351])
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][573] ([Intel XE#2351]) -> [SKIP][574] ([Intel XE#2850] / [Intel XE#929])
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_psr@psr-sprite-plane-onoff.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][575] ([Intel XE#2136]) -> [SKIP][576] ([Intel XE#2850] / [Intel XE#929]) +10 other tests skip
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_psr@psr2-sprite-plane-move.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][577] ([Intel XE#2939]) -> [SKIP][578] ([Intel XE#2136] / [Intel XE#2351])
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][579] ([Intel XE#1127]) -> [SKIP][580] ([Intel XE#2423] / [i915#2575])
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][581] ([Intel XE#2423] / [i915#2575]) -> [SKIP][582] ([Intel XE#3414]) +1 other test skip
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-270.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][583] ([Intel XE#3414]) -> [SKIP][584] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          [SKIP][585] ([Intel XE#2413]) -> [SKIP][586] ([Intel XE#3007])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][587] ([Intel XE#1729]) -> [SKIP][588] ([Intel XE#2423] / [i915#2575])
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][589] ([Intel XE#2168]) -> [SKIP][590] ([Intel XE#2423] / [i915#2575])
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_vrr@cmrr.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][591] ([Intel XE#2423] / [i915#2575]) -> [SKIP][592] ([Intel XE#2168])
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_vrr@lobf.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][593] ([Intel XE#2423] / [i915#2575]) -> [SKIP][594] ([Intel XE#756]) +1 other test skip
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-bmg:          [SKIP][595] ([Intel XE#756]) -> [SKIP][596] ([Intel XE#3007])
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-dg2-set2:     [SKIP][597] ([Intel XE#756]) -> [SKIP][598] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][599] ([Intel XE#2423] / [i915#2575]) -> [SKIP][600] ([Intel XE#1091] / [Intel XE#2849])
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][601] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][602] ([Intel XE#1130]) +1 other test skip
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][603] ([Intel XE#1130]) -> [SKIP][604] ([Intel XE#1123])
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][605] ([Intel XE#1123]) -> [SKIP][606] ([Intel XE#1130])
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][607] ([Intel XE#1130]) -> [SKIP][608] ([Intel XE#1126])
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x369.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][609] ([Intel XE#1126]) -> [SKIP][610] ([Intel XE#1130])
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][611] ([Intel XE#1130]) -> [SKIP][612] ([Intel XE#2905]) +11 other tests skip
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_eudebug@basic-close.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     [SKIP][613] ([Intel XE#3889]) -> [SKIP][614] ([Intel XE#1130])
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-dg2-set2:     [SKIP][615] ([Intel XE#1130]) -> [SKIP][616] ([Intel XE#3889])
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     [SKIP][617] ([Intel XE#2905]) -> [SKIP][618] ([Intel XE#1130]) +14 other tests skip
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@xe_eudebug_online@resume-dss.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@xe_eudebug_online@resume-dss.html
    - shard-bmg:          [SKIP][619] ([Intel XE#2905]) -> [SKIP][620] ([Intel XE#1130])
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@xe_eudebug_online@resume-dss.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-bmg:          [FAIL][621] ([Intel XE#1000]) -> [TIMEOUT][622] ([Intel XE#1473])
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@xe_evict@evict-beng-mixed-threads-large.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [TIMEOUT][623] ([Intel XE#1473]) -> [FAIL][624] ([Intel XE#1000])
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [SKIP][625] ([Intel XE#1130]) -> [FAIL][626] ([Intel XE#1600])
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
    - shard-bmg:          [SKIP][627] ([Intel XE#2322]) -> [SKIP][628] ([Intel XE#1130])
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][629] ([Intel XE#288]) -> [SKIP][630] ([Intel XE#1130]) +35 other tests skip
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][631] ([Intel XE#1130]) -> [SKIP][632] ([Intel XE#288]) +30 other tests skip
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     [SKIP][633] ([Intel XE#1130]) -> [SKIP][634] ([Intel XE#2360])
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_oa@missing-sample-flags:
    - shard-dg2-set2:     [SKIP][635] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][636] ([Intel XE#1130]) +7 other tests skip
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@xe_oa@missing-sample-flags.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@xe_oa@missing-sample-flags.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][637] ([Intel XE#1130]) -> [SKIP][638] ([Intel XE#2541] / [Intel XE#3573]) +7 other tests skip
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][639] ([Intel XE#1130]) -> [SKIP][640] ([Intel XE#2838] / [Intel XE#979])
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][641] ([Intel XE#1173]) -> [SKIP][642] ([Intel XE#1061]) +1 other test skip
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@xe_peer2peer@read.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][643] ([Intel XE#1130]) -> [SKIP][644] ([Intel XE#2284])
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_pm@d3cold-mocs.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][645] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][646] ([Intel XE#1130]) +1 other test skip
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][647] ([Intel XE#1130]) -> [SKIP][648] ([Intel XE#2284] / [Intel XE#366])
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][649] ([Intel XE#944]) -> [SKIP][650] ([Intel XE#1130]) +4 other tests skip
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@xe_query@multigpu-query-engines.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][651] ([Intel XE#1130]) -> [SKIP][652] ([Intel XE#944]) +2 other tests skip
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-topology:
    - shard-bmg:          [SKIP][653] ([Intel XE#944]) -> [SKIP][654] ([Intel XE#1130])
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-3/igt@xe_query@multigpu-query-topology.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@xe_query@multigpu-query-topology.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [SKIP][655] ([Intel XE#1130]) -> [ABORT][656] ([Intel XE#3075] / [Intel XE#3084])
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#3664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3664
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#3879]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3879
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3897]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3897
  [Intel XE#3898]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3898
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914
  [Intel XE#3918]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3918
  [Intel XE#3946]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3946
  [Intel XE#3974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3974
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_8175 -> IGT_8176
  * Linux: xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd -> xe-pw-136052v4

  IGT_8175: c982ba23a3a3cfda0abe57e18ab16f719ef5de79 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8176: 5e65135d3d7cf5298a58bcd6137c77205704bcf9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd: bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd
  xe-pw-136052v4: 136052v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/index.html

--===============1679476368267179069==
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
<tr><td><b>Series:</b></td><td>Add PXP HWDRM support (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/136052/">https://patchwork.freedesktop.org/series/136052/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-136052v4/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-136052v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2=
bcdf3bd_full -&gt; xe-pw-136052v4_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136052v4_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-136052v4_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1360=
52v4_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_at=
omic_interruptible@universal-setplane-cursor.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/=
igt@kms_atomic_interruptible@universal-setplane-cursor.html">INCOMPLETE</a>=
 +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-5/igt@kms_pipe=
_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@k=
ms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html">FAIL</a> +2 other =
tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-invalid-mbz:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-3/igt@xe_crea=
te@create-invalid-mbz.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-8/igt@xe_create@create-inval=
id-mbz.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_queue_property@invalid-property:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-4/igt@xe_exec_=
queue_property@invalid-property.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-6/igt@xe_exec_queue=
_property@invalid-property.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-flag-invalid:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@xe_vm@bind-flag-invalid.html"=
>FAIL</a> +1 other test fail</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-6/igt@xe_vm@bind-flag-invalid.html=
">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_create@create-invalid-mbz:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_cre=
ate@create-invalid-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@xe_cre=
ate@create-invalid-mbz.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136052v4_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getstats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@core_g=
etstats.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-136052v4/shard-dg2-466/igt@core_getstats.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#24=
23</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@core_g=
etversion@all-cards.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@core_getversion@all-car=
ds.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3440">Intel XE#3440</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-6/igt@core_hotunplug@hotunplug-res=
can.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3914">Intel XE#3914</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@core_h=
otunplug@unplug-rescan.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@core_hotunplug@unplu=
g-rescan.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1885">Intel XE#1885</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@fbdev@=
unaligned-write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@fbdev@unaligned-write.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_async_flips@crc-atomic@=
pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3781">Intel XE#3781</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-1/igt@kms_asy=
nc_flips@invalid-async-flip@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-8/igt@=
kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE=
#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_atomic_transition@modes=
et-transition-nonblocking-fencing.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>=
) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_bi=
g_fb@4-tiled-addfb-size-overflow.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_big_fb=
@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +40 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-str=
ide-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-6/igt@kms_big_fb@linear-8bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@kms_big_=
fb@linear-max-hw-stride-64bpp-rotate-180.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_=
big_fb@linear-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel =
XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@kms_big_fb@x-tiled-32bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-8/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/sha=
rd-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-f=
lip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1033">Intel XE#1033</a>) +8 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2328">Intel XE#2328</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@kms_bw@connected-linear-tilin=
g-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-3/igt@kms_bw@connected-linear-tili=
ng-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</l=
i>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@kms_bw@connected-linear-tilin=
g-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_bw@linear-tiling-2-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-t=
iled-mtl-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-8/igt@kms_ccs@bad-rotation-90-y-til=
ed-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-=
180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +14 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-ba=
sic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-t=
iled-mtl-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +146 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-5/igt@kms_cdclk@plane-scaling.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_chamelium_audio@hdmi-audi=
o-edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2252">Intel XE#2252</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_chamelium_color@ctm-0-25.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-1/igt@kms_chamelium_color@ctm-blue-=
to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/306">Intel XE#306</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-4/igt@kms_chamelium_color@ctm-blue=
-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_chamelium_color@ctm-lim=
ited-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-1/igt@kms_chamelium_edid@dp-edid-r=
esolution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-fo=
r-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-w=
ith-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-4/igt@kms_content_protection@conten=
t-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-8/igt@kms_content_protection@dp-ms=
t-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_content_protection@type1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_cursor_crc@cursor-offscre=
en-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_cursor_crc@cursor-offscre=
en-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-m=
ovement-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1424">Intel XE#1424</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_cu=
rsor_crc@cursor-sliding-64x64.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_cursor_cr=
c@cursor-sliding-64x64.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +115 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@kms_cursor_legacy@2x-cursor-v=
s-flip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-3/igt@kms_cursor_legacy@2x-long-cu=
rsor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/sh=
ard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying=
-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2372">Intel XE#2372</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_feature_discovery@chame=
lium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/701">Intel XE#701</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-4/igt@kms_feature_discovery@chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-6/igt@kms_feature_discovery@displa=
y-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1138">Intel XE#1138</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-4/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@kms_feature_discovery@dp-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1137">Intel XE#1137</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-6/igt@kms_feature_discovery@dp-mst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-5/igt@kms_flip@2x-blocking-absolute=
-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +7 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288">Intel XE#3288</a=
>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/sha=
rd-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms=
_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)=
 +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend@b=
c-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3879">Intel XE#3879</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-1/igt@kms_flip@2x-plain-flip.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
10">Intel XE#310</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_flip@2x-plain-=
flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3007">Intel XE#3007</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_fl=
ip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt=
@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE=
#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_fl=
ip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_fli=
p@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +5 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_fl=
ip@flip-vs-expired-vblank@c-dp4.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_flip@fl=
ip-vs-expired-vblank@c-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_flip@flip-vs-suspend-in=
terruptible@c-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-6/igt@kms_flip=
@plain-flip-fb-recreate@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-8/igt@kms_flip@plain=
-flip-fb-recreate@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/sha=
rd-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscal=
ing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bp=
p-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bp=
p-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bp=
p-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE=
#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-2/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shar=
d-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscalin=
g.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)=
 +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-4/igt@kms_force_connector_basic@for=
ce-connector-state.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs=
-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +31 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-indfb-pgflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +14 other tests f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +21 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc=
drrs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-6/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +25 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-8/igt@kms_frontbuffer_tracking@psr=
-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +27 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@algo-color:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-6/igt@kms_histogram@algo-color.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3897">Intel XE#3897</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@global-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-1/igt@kms_histogram@global-basic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3898">Intel XE#3898</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@global-color:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_histogram@global-color.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3898">Intel XE#3898</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_panel_fitting@atomic-fa=
stset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a>) +5 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_panel_fitting@atomic-fast=
set.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@kms_plane_lowres@tiling-4.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/599">Intel XE#599</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_plane_lowres@tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@kms_plane_lowres@tiling-y@pi=
pe-b-hdmi-a-1.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +4 other tests dmesg-fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@kms_plane_lowres@tiling-y@pi=
pe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_plane_multiple@tiling-x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3007">Intel XE#3007</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-4/igt@kms_plane_scaling@intel-max-=
src-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/455">Intel XE#455</a>) +16 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-2/igt@kms_plane_scaling@intel-max-s=
rc-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-4/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +19 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_pm_backlight@fade-with-su=
spend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">I=
ntel XE#2392</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-1/igt@kms_pm_dc@dc5-psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">=
Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029"=
>Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_pm_lpsp@kms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499=
">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_pm=
_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_pm_rpm@syst=
em-suspend-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_pm_rpm@universal-planes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@kms_psr2_sf@pr-plane-move-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2893">Intel XE#2893</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-1/igt@kms_psr2_sf@psr2-overlay-pla=
ne-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-pl=
ane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_psr2_sf@psr2-primary-plan=
e-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-blt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-re=
nder.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-5/igt@kms_psr@pr-no-drrs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@kms_psr@psr2-no-drrs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/285=
0">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@kms_psr_stress_test@invalidat=
e-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-fo=
rmat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@kms_setmode@basic-clone-singl=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-4/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-8/igt@kms_u=
niversal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@kms_vrr@negative-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
99">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-vi=
rtual.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@xe_ccs@ctrl-surf-copy-new-ct=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-5/igt@xe_ccs@s=
uspend-resume@linear-compressed-compfmt0-vram01-vram01.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-=
bmg-5/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3664">Intel XE#3664</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-vram01:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-5/igt@xe_ccs@s=
uspend-resume@tile4-compressed-compfmt0-system-vram01.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-b=
mg-5/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-vram01.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3918">Intel XE#3918</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@xe_copy_basic@mem-set-linear=
-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@xe_copy_basic@mem-set-linea=
r-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1130">Intel XE#1130</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-6/igt@xe_eudebug@basic-close.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
05">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufen=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2905">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@xe_eudebug_online@interrupt-=
other.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@xe_evict@evict-beng-mixed-man=
y-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@xe_evict@evict-beng-mixed-th=
reads-large.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@xe_evict_ccs@evict-overcommi=
t-simple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit=
-standalone-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@xe_exe=
c_basic@many-null-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@xe_exec_basic@many=
-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1130">Intel XE#1130</a>) +215 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +7 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exe=
c-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@xe_exec_fault_mode@many-bin=
dexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefet=
ch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@xe_exec_fault_mode@once-binde=
xecqueue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-9/igt@xe_exec_fault_mode@twice-use=
rptr-invalidate-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-5/igt@xe_exec_=
fault_mode@twice-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/ig=
t@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1=
130</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-1/igt@xe_exec_mix_modes@exec-simpl=
e-batch-store-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@xe_media_fill@media-fill.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2459">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-8/igt@xe_mmap@small-bar.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">In=
tel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@xe_module_load@many-reload.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@xe_mod=
ule_load@reload-no-display.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@xe_module_load@r=
eload-no-display.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-5/igt@xe_noexec_ping_pong.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">=
Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-1/igt@xe_oa@create-destroy-userspa=
ce-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@xe_oa@invalid-create-usersp=
ace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-4/igt@xe_pm@d3cold-mmap-vram.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@xe_pm@d3cold-mocs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">I=
ntel XE#2284</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-4/igt@xe_pm@s4=
-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-136052v4/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#135=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607=
">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-4/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-6/igt@xe_pm@vram-d3cold-threshold.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-8/igt@xe_pm_r=
esidency@gt-c6-freeze@gt0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-8/igt@xe_pm_residency@gt=
-c6-freeze@gt0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +4 other tests dmesg-warn=
</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-1/igt@xe_pm_re=
sidency@toggle-gt-c6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-2/igt@xe_pm_residency@toggle-g=
t-c6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@xe_query@multigpu-query-mem-u=
sage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@xe_query@multigpu-query-topol=
ogy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-136052v4/shard-adlp-9/igt@xe_query@multigpu-query-topo=
logy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@core_g=
etversion@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3440">Intel XE#3440</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@core_getversi=
on@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@core_h=
otunplug@hotreplug-lateclose.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@=
core_hotunplug@hotreplug-lateclose.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@fbdev@=
info.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@fbdev@info.html">PASS</a=
> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-1/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-atomic.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719">Intel XE#3719</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4=
/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.ht=
ml">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-=
a-1-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-9/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1033">Intel XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-136052v4/shard-adlp-3/igt@kms_async_flips@async-flip-with-=
page-flip-events-atomic@pipe-b-hdmi-a-1-y.html">PASS</a> +6 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_bi=
g_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel X=
E#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-136052v4/shard-dg2-436/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-=
180.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-3/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel=
 XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-136052v4/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-3/igt@kms_curs=
or_crc@cursor-suspend.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms_cursor_crc@cursor-s=
uspend.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/s=
hard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3.html">=
PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-suspend@ad-dp2-hdmi-a3.html">INCOMPLETE</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-5/igt@kms_=
flip@2x-flip-vs-suspend@ad-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-1/igt@kms_fli=
p@blocking-absolute-wf_vblank@d-hdmi-a1.html">INCOMPLETE</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-1/i=
gt@kms_flip@blocking-absolute-wf_vblank@d-hdmi-a1.html">PASS</a> +1 other t=
est pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_fl=
ip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg=
2-435/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-5/igt@kms_flip=
@flip-vs-suspend-interruptible@c-dp2.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shar=
d-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_fl=
ip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/=
igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-3/igt@kms_fli=
p@wf_vblank-ts-check-interruptible@a-hdmi-a1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/sh=
ard-adlp-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-5/igt@kms_flip=
@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-4/igt@kms_fl=
ip@wf_vblank-ts-check@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_=
frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/s=
hard-dg2-435/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">=
PASS</a> +33 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-addfb-different-handles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-5/igt@kms_getf=
b@getfb-addfb-different-handles.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/ig=
t@kms_getfb@getfb-addfb-different-handles.html">PASS</a> +1 other test pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@kms_leas=
e@setcrtc-implicit-plane.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@km=
s_lease@setcrtc-implicit-plane.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-5/igt@kms_pipe=
_crc_basic@suspend-read-crc@pipe-c-dp-2.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3974">Intel XE#3974</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-b=
mg-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_pl=
ane_scaling@planes-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136=
052v4/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">=
PASS</a> +108 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-5/igt@kms_pm_d=
c@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-3/igt@kms_pm_=
rpm@cursor.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-3/igt@kms_pm_rpm@cu=
rsor.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_pm=
_rpm@i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_pm_rpm@i2c.html"=
>PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-1/igt@kms_set=
mode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@kms_setmode@basic.h=
tml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-4/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl=
-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-1/igt@xe_exec_=
threads@threads-hang-fd-basic.html">ABORT</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-1/igt@xe_exec_thread=
s@threads-hang-fd-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-3/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_uc_fw_init.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel=
 XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3343">Intel XE#3343</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-136052v4/shard-adlp-9/igt@xe_fault_injection@inject-fault=
-probe-function-xe_uc_fw_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-l=
nl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/sha=
rd-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcd=
f3bd/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e=
2bcdf3bd/shard-lnl-4/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f=
3b2e2bcdf3bd/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef=
6d6f3b2e2bcdf3bd/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b=
15ef6d6f3b2e2bcdf3bd/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4=
512b15ef6d6f3b2e2bcdf3bd/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c6426814=
36f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-6/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642=
681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4=
c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-6/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-=
bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-=
lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/sh=
ard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3b=
d/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136=
052v4/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-136052v4/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136=
052v4/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-6/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-136052v4/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-5/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136=
052v4/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-136052v4/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl=
-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-6/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136=
052v4/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-136052v4/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136=
052v4/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-136052v4/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>)</l=
i>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-8/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-ad=
lp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/sha=
rd-adlp-3/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3b=
d/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2b=
cdf3bd/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3=
b2e2bcdf3bd/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef=
6d6f3b2e2bcdf3bd/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512=
b15ef6d6f3b2e2bcdf3bd/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436=
f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-9/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c6426=
81436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-9/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4=
c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-9/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443=
-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-8/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-ad=
lp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/sha=
rd-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3b=
d/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2b=
cdf3bd/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef6d6f3=
b2e2bcdf3bd/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512b15ef=
6d6f3b2e2bcdf3bd/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436f4512=
b15ef6d6f3b2e2bcdf3bd/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2443-bfe4c642681436=
f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-1/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-136052v4/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-8/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1360=
52v4/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-136052v4/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-a=
dlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-1/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-136052v4/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-9/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-136052v4/shard-adlp-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/sh=
ard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-136052v4/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-6/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-136052v4/shard-adlp-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052=
v4/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-2/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-136052v4/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adl=
p-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
36052v4/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-9/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-136052v4/shard-adlp-9/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shar=
d-adlp-2/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_mod=
ule_load@reload.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3546">Intel XE#3546</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@xe_module_loa=
d@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-adlp-9/igt@xe_pm@s=
4-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-adlp-4/igt@xe_pm@s=
4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-lnl-2/igt@xe_pm@s4=
-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-lnl-3/ig=
t@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_vm@=
munmap-style-unbind-many-either-side-partial.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/sh=
ard-dg2-435/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">PA=
SS</a> +189 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_as=
ync_flips@crc-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-43=
4/igt@kms_async_flips@crc-atomic.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3781">Intel XE#3781</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3946">Intel XE#394=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-3/igt@kms_atom=
ic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2385">Intel XE#2385</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg=
-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#300=
7</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_bi=
g_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms=
_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_bi=
g_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@=
kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@km=
s_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_bi=
g_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/=
igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard=
-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351=
">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bp=
p-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@kms_big_=
fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4=
/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1360=
52v4/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hf=
lip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/=
igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436=
/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_bi=
g_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg=
2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_bw=
@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/=
shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_bw=
@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-136052v4/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2=
560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_bw=
@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-46=
6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_bw=
@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1360=
52v4/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_cc=
s@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052=
v4/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"=
>Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_cc=
s@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard=
-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_cc=
s@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#235=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136=
052v4/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@kms_ccs@=
crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@k=
ms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shar=
d-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">In=
tel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_cc=
s@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2=
-435/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#344=
2</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466=
/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-=
436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_cd=
clk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt=
@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#235=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_ch=
amelium_audio@dp-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-=
436/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +11 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_ch=
amelium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_chame=
lium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_ch=
amelium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434=
/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-3/igt@kms_cham=
elium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-=
7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_ch=
amelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-=
466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_co=
lor@ctm-0-25.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_color@ctm-0-25.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_co=
ntent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_c=
ontent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_co=
ntent_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/sh=
ard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307<=
/a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_co=
ntent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@=
kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_co=
ntent_protection@lic-type-0.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466=
/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_cu=
rsor_crc@cursor-random-32x10.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shar=
d-dg2-434/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)=
 +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-3/igt@kms_curs=
or_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/=
igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_cu=
rsor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-=
466/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_cu=
rsor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/=
shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Inte=
l XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_ds=
c@dsc-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_dsc@dsc-basic=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_ds=
c@dsc-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_dsc@dsc-with=
-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_ds=
c@dsc-with-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/=
igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_fe=
ature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-=
435/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_fe=
ature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_fl=
ip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@km=
s_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-5/igt@kms_flip=
@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-=
3/igt@kms_flip@flip-vs-suspend-interruptible.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3879">Intel XE#3879</a>) +=
1 other test fail</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/=
shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">In=
tel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-136052v4/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp=
-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-136052v4/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-=
64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">I=
ntel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-136052v4/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32=
bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_fo=
rce_connector_basic@prune-stale-modes.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2=
-466/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1360=
52v4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052=
v4/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/sha=
rd-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2231">Intel XE#2231</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-136052v4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscr=
n-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#65=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136=
052v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-in=
dfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +13 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-136052v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/653">Intel XE#653</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
36052v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052=
v4/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt=
@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +35 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_ge=
tfb@getfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-43=
5/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_hd=
r@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_hdr@invalid-h=
dr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2575">i915#2575</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@algo-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_hi=
stogram@algo-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3897">Intel XE#3897</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_histog=
ram@algo-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_jo=
iner@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_joi=
ner@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_jo=
iner@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt=
@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_jo=
iner@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt=
@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_jo=
iner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435=
/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_mu=
ltipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg=
2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE=
#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_pl=
ane_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/sh=
ard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-fa=
ctor-0-25-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_pm=
_backlight@fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_pm_backli=
ght@fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_pm=
_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_pm_dc@dc5-psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_pm=
_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_p=
m_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_pm=
_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_pm_dc@dc6-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_pm=
_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms=
_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-3/igt@kms_pm_r=
pm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7=
/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_ps=
r2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel=
 XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-136052v4/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-conti=
nuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_ps=
r2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4=
/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@kms_psr2=
_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/=
shard-bmg-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_ps=
r2_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_psr2=
_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_ps=
r@fbc-psr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt=
@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_ps=
r@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-=
dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)=
 +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@kms_psr@=
pr-cursor-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/ig=
t@kms_psr@pr-cursor-render.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_ps=
r@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@kms_=
psr@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_ps=
r@psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-4=
66/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_ps=
r@psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_=
psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_ps=
r@psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt@kms_=
psr@psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_ps=
r_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/s=
hard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
36">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg=
2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_ro=
tation_crc@sprite-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/sh=
ard-dg2-435/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#341=
4</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_ro=
tation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-d=
g2-466/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE=
#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@kms_scal=
ing_modes@scaling-mode-full.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@kms=
_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_ti=
led_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/=
igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@kms_vr=
r@cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2168">Intel XE#2168</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@kms_vrr@cmrr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"=
>Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_vr=
r@lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@kms_vrr@=
lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@kms_wr=
iteback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2=
-434/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@kms_writ=
eback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/ig=
t@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</l=
i>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@kms_wr=
iteback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466=
/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@sriov_=
basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-136052v4/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvf=
s-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@xe_com=
pute_preempt@compute-preempt-many.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/s=
hard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE=
#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_cop=
y_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-436/igt=
@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@xe_cop=
y_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/=
igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_cop=
y_basic@mem-set-linear-0x369.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@=
xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@xe_cop=
y_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt=
@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_eud=
ebug@basic-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@xe_eudebug@b=
asic-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2905">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-435/igt@xe_eud=
ebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-4=
66/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_eud=
ebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-4=
34/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@xe_eud=
ebug_online@resume-dss.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@xe_eud=
ebug_online@resume-dss.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +14 other tests skip</l=
i>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@xe_eudeb=
ug_online@resume-dss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@xe_eudebug=
_online@resume-dss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@xe_evict=
@evict-beng-mixed-threads-large.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/ig=
t@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@xe_evict=
@evict-beng-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-3/igt@xe=
_evict@evict-beng-threads-large.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_evi=
ct@evict-large-multi-vm-cm.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@xe=
_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-7/igt@xe_exec_=
basic@multigpu-no-exec-userptr-rebind.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg=
-7/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#113=
0</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@xe_exe=
c_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2=
-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1=
130</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_exe=
c_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shar=
d-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Int=
el XE#288</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_exe=
c_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-d=
g2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE=
#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@xe_oa@=
missing-sample-flags.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-46=
6/igt@xe_oa@missing-sample-flags.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_oa@=
oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-43=
6/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Inte=
l XE#3573</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_pat=
@pat-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@xe_pat@pat-i=
ndex-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@xe_pee=
r2peer@read.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@xe_peer2peer@read=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1061">Intel XE#1061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_pm@=
d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@xe_pm@d3cold-mocs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-436/igt@xe_pm@=
s2idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-=
466/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_pm@=
s3-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-434/igt@xe_pm@s3=
-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-434/igt@xe_que=
ry@multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-466/igt@xe_qu=
ery@multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_que=
ry@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-4=
34/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-bmg-3/igt@xe_query=
@multigpu-query-topology.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-bmg-7/igt@xe_query=
@multigpu-query-topology.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd/shard-dg2-466/igt@xe_wed=
ged@wedged-mode-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136052v4/shard-dg2-435/igt@xe_wed=
ged@wedged-mode-toggle.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8175 -&gt; IGT_8176</li>
<li>Linux: xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd -&gt; xe-pw-136=
052v4</li>
</ul>
<p>IGT_8175: c982ba23a3a3cfda0abe57e18ab16f719ef5de79 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8176: 5e65135d3d7cf5298a58bcd6137c77205704bcf9 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2443-bfe4c642681436f4512b15ef6d6f3b2e2bcdf3bd: bfe4c642681436f4512b15e=
f6d6f3b2e2bcdf3bd<br />
  xe-pw-136052v4: 136052v4</p>

</body>
</html>

--===============1679476368267179069==--
