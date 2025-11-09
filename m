Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541EBCCFA18
	for <intel-xe@archiver.kernel.org>; Sun,  9 Nov 2025 01:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F311D10E20D;
	Sun,  9 Nov 2025 01:58:50 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787D910E05F;
 Sun,  9 Nov 2025 01:58:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8974789500720852367=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/vf=3A_Enable_VF_res?=
 =?utf-8?q?ource_fixup_unconditionally?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 09 Nov 2025 01:58:50 -0000
Message-ID: <176265353044.33229.14808055245959977383@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251107161000.1938186-1-michal.winiarski@intel.com>
In-Reply-To: <20251107161000.1938186-1-michal.winiarski@intel.com>
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

--===============8974789500720852367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Enable VF resource fixup unconditionally
URL   : https://patchwork.freedesktop.org/series/157241/
State : failure

== Summary ==

CI Bug Log - changes from xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b_FULL -> xe-pw-157241v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-157241v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-157241v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-157241v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@panthor/panthor_vm@vm_bind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][1] +9 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@panthor/panthor_vm@vm_bind.html

  
Known issues
------------

  Here are the changes found in xe-pw-157241v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#1125])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@intel_hwmon@hwmon-read.html

  * igt@intel_hwmon@hwmon-write:
    - shard-adlp:         NOTRUN -> [SKIP][3] ([Intel XE#1125] / [Intel XE#5574]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@intel_hwmon@hwmon-write.html

  * igt@kms_3d@basic:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#6011])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_3d@basic.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2233])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#623])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1466])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#3157])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#3157])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][10] ([Intel XE#6054]) +3 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][11] ([Intel XE#5993]) +3 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][12] ([Intel XE#4543]) +14 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#664]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#3279]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2370]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2327]) +19 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#316]) +20 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#619]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#607]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1124]) +58 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1407]) +26 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#3658]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#316]) +21 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1124]) +61 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2328])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#610]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1428]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#1124]) +46 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1124]) +52 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#619]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1467]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#607]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#607]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1477]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#610]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#610])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#2191]) +7 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#2191]) +11 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#2191]) +5 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1512]) +7 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2314] / [Intel XE#2894]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#367]) +12 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#367]) +11 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#367]) +6 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#367]) +15 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#787]) +426 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#2907]) +8 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#2887]) +86 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#2669]) +19 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#455] / [Intel XE#787]) +187 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][51] ([Intel XE#3862]) +1 other test incomplete
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#3442]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#2669] / [Intel XE#3433]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#3432]) +8 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#3442])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#3432]) +9 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#787]) +281 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2887]) +65 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#455] / [Intel XE#787]) +121 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][60] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) +1 other test incomplete
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][61] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][62] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][63] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][64] ([Intel XE#2705] / [Intel XE#4212])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#2907]) +9 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2652] / [Intel XE#787]) +40 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@mode-transition:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#4417] / [Intel XE#455])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#4418])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2724]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#4418])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#4418])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#4417]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#4417]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#4417]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#4416]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_cdclk@plane-scaling.html
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#4416] / [Intel XE#455])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#4416]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#4416]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#306]) +10 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_chamelium_color@ctm-0-50.html
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2325]) +9 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#306]) +9 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#306]) +10 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#373]) +57 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2252]) +41 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#373]) +50 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#373]) +56 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#6507])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_chamelium_sharpness_filter@filter-basic.html
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#6507])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_chamelium_sharpness_filter@filter-basic.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#6507])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@kms_chamelium_sharpness_filter@filter-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#6507])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2341]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#307]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#307]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2390]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1.html
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#307]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][96] ([Intel XE#1178]) +5 other tests fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#1468])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][98] ([Intel XE#1178]) +5 other tests fail
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][99] ([Intel XE#1188]) +1 other test fail
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@kms_content_protection@uevent.html
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#3278]) +8 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_content_protection@uevent.html
    - shard-bmg:          NOTRUN -> [FAIL][101] ([Intel XE#1188]) +1 other test fail
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#308]) +7 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#2321]) +9 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2320]) +21 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2321]) +6 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1424]) +29 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#308]) +9 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#309]) +27 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#309]) +28 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [FAIL][110] ([Intel XE#1475])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#323]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#323]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#323]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2286]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#1508])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#1508]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#4302])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_display_modes@extended-mode-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#4302])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_aux_dev:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#3009])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_dp_aux_dev.html
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#3009])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#4354])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#4354]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#4354]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_dp_link_training@uhbr-mst.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#4356])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#4356]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@kms_dp_link_training@uhbr-sst.html
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#4354])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#4331]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#4294])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#4331])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#4331])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#4331])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2244]) +6 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#2244]) +7 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#4422]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#4422]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#4422]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#4422]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#776]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#776]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#776]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2372])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@kms_feature_discovery@chamelium.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#701])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#701])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_feature_discovery@chamelium.html
    - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#701])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#702])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_feature_discovery@display-2x.html
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#702])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#703])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@kms_feature_discovery@display-3x.html
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#703])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@kms_feature_discovery@display-3x.html
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#2373])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_feature_discovery@display-3x.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#703])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#1138])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_feature_discovery@display-4x.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#1138])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@kms_feature_discovery@display-4x.html
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#1138])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#1137])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@kms_feature_discovery@dp-mst.html
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#2375])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#1137])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#1137])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#1135]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_feature_discovery@psr1.html
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2374]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_feature_discovery@psr1.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#1135]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-adlp:         NOTRUN -> [SKIP][161] ([Intel XE#310]) +36 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#1421]) +39 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#2316]) +3 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][164] ([Intel XE#301]) +3 other tests fail
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][165] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          NOTRUN -> [FAIL][166] ([Intel XE#4683]) +3 other tests fail
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][167] ([Intel XE#1401]) +26 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#1397]) +8 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#1397] / [Intel XE#1745]) +8 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [FAIL][170] ([Intel XE#3106] / [Intel XE#4683]) +1 other test fail
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#2293] / [Intel XE#2380]) +21 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][172] ([Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][173] ([Intel XE#1401] / [Intel XE#1745]) +26 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#2293]) +21 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#352]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][176] ([Intel XE#651]) +67 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][177] ([Intel XE#656]) +218 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][178] ([Intel XE#2311]) +123 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#651]) +137 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#6313]) +4 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][181] ([Intel XE#4543]) +13 other tests dmesg-fail
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][182] ([Intel XE#2953] / [Intel XE#4173]) +4 other tests dmesg-warn
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#5427])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#5390]) +52 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][185] ([Intel XE#1151]) +2 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][186] ([Intel XE#658]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][187] ([Intel XE#6312]) +11 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#6312]) +18 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][189] ([Intel XE#6312]) +22 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][190] ([Intel XE#2312]) +28 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][191] ([Intel XE#651]) +71 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][192] ([Intel XE#1469]) +2 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][193] ([Intel XE#2352])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][194] ([Intel XE#653]) +145 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][195] ([Intel XE#653]) +68 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][196] ([Intel XE#5672])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-adlp:         NOTRUN -> [SKIP][197] ([Intel XE#1158])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - shard-bmg:          NOTRUN -> [SKIP][198] ([Intel XE#2350])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][199] ([Intel XE#2313]) +125 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][200] ([Intel XE#656]) +229 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-lnl:          NOTRUN -> [SKIP][201] ([Intel XE#1470])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          NOTRUN -> [SKIP][202] ([Intel XE#1470] / [Intel XE#2853])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          NOTRUN -> [SKIP][203] ([Intel XE#3374] / [Intel XE#3544])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          NOTRUN -> [SKIP][204] ([Intel XE#1503]) +3 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][205] ([Intel XE#1450]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][206] ([Intel XE#1450] / [Intel XE#2568]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][207] ([Intel XE#346]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@kms_joiner@basic-big-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][208] ([Intel XE#346])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_joiner@basic-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][209] ([Intel XE#346]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][210] ([Intel XE#2925]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][211] ([Intel XE#2934]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][212] ([Intel XE#4298])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@kms_joiner@basic-max-non-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][213] ([Intel XE#4298])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_joiner@basic-max-non-joiner.html
    - shard-adlp:         NOTRUN -> [SKIP][214] ([Intel XE#4298])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@kms_joiner@basic-max-non-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][215] ([Intel XE#4298])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][216] ([Intel XE#2927]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_joiner@basic-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][217] ([Intel XE#2927]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][218] ([Intel XE#346])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][219] ([Intel XE#3012]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][220] ([Intel XE#2927]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][221] ([Intel XE#2927]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][222] ([Intel XE#4090])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][223] ([Intel XE#2925]) +2 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][224] ([Intel XE#2925]) +2 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-adlp:         NOTRUN -> [SKIP][225] ([Intel XE#356])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-bmg:          NOTRUN -> [SKIP][226] ([Intel XE#2501])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][227] ([Intel XE#356])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-lnl:          NOTRUN -> [SKIP][228] ([Intel XE#356])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][229] ([Intel XE#2486]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          NOTRUN -> [SKIP][230] ([Intel XE#5624])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-adlp:         NOTRUN -> [SKIP][231] ([Intel XE#5624]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][232] ([Intel XE#5624])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-lnl:          NOTRUN -> [SKIP][233] ([Intel XE#5624])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2-set2:     NOTRUN -> [SKIP][234] ([Intel XE#4359])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-lnl:          NOTRUN -> [SKIP][235] ([Intel XE#4329])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-lnl:          NOTRUN -> [FAIL][236] ([Intel XE#5195]) +2 other tests fail
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - shard-adlp:         NOTRUN -> [FAIL][237] ([Intel XE#5195]) +4 other tests fail
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][238] ([Intel XE#599]) +13 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][239] ([Intel XE#2393]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-lnl:          NOTRUN -> [SKIP][240] ([Intel XE#4596]) +4 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][241] ([Intel XE#5021])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][242] ([Intel XE#5021])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-adlp:         NOTRUN -> [SKIP][243] ([Intel XE#4596]) +3 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][244] ([Intel XE#4658]) +3 other tests fail
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_plane_multiple@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-adlp:         NOTRUN -> [SKIP][245] ([Intel XE#5020]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_plane_multiple@tiling-yf.html
    - shard-bmg:          NOTRUN -> [SKIP][246] ([Intel XE#5020])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][247] ([Intel XE#5020]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_plane_multiple@tiling-yf.html
    - shard-lnl:          NOTRUN -> [SKIP][248] ([Intel XE#5020]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          NOTRUN -> [SKIP][249] ([Intel XE#3307])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][250] ([Intel XE#2763]) +53 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][251] ([Intel XE#2763]) +19 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][252] ([Intel XE#2938])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-adlp:         NOTRUN -> [SKIP][253] ([Intel XE#2938])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][254] ([Intel XE#2938])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][255] ([Intel XE#870]) +3 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_pm_backlight@fade.html
    - shard-adlp:         NOTRUN -> [SKIP][256] ([Intel XE#870]) +4 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][257] ([Intel XE#870]) +3 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][258] ([Intel XE#2391])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-adlp:         NOTRUN -> [SKIP][259] ([Intel XE#1122])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][260] ([Intel XE#1122])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-lnl:          NOTRUN -> [SKIP][261] ([Intel XE#736])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          NOTRUN -> [SKIP][262] ([Intel XE#1131])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-adlp:         NOTRUN -> [SKIP][263] ([Intel XE#1129]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_pm_dc@dc5-psr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][264] ([Intel XE#1129]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][265] ([Intel XE#3309])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-lnl:          NOTRUN -> [SKIP][266] ([Intel XE#3309])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-adlp:         NOTRUN -> [SKIP][267] ([Intel XE#3309])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-bmg:          NOTRUN -> [SKIP][268] ([Intel XE#3309])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][269] ([Intel XE#908]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html
    - shard-adlp:         NOTRUN -> [FAIL][270] ([Intel XE#718])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          NOTRUN -> [FAIL][271] ([Intel XE#718]) +1 other test fail
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html
    - shard-bmg:          NOTRUN -> [SKIP][272] ([Intel XE#2392])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][273] ([Intel XE#734])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-adlp:         NOTRUN -> [SKIP][274] ([Intel XE#2007])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_pm_dc@deep-pkgc.html
    - shard-bmg:          NOTRUN -> [SKIP][275] ([Intel XE#2505])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html
    - shard-lnl:          NOTRUN -> [FAIL][276] ([Intel XE#2029])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][277] ([Intel XE#1439] / [Intel XE#836])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][278] ([Intel XE#836]) +3 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][279] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +2 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][280] ([Intel XE#1439] / [Intel XE#3141]) +3 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][281] ([Intel XE#1406] / [Intel XE#1489]) +42 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-lnl:          NOTRUN -> [SKIP][282] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608]) +11 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][283] ([Intel XE#1406] / [Intel XE#4608]) +23 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][284] ([Intel XE#1406] / [Intel XE#1489]) +46 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][285] ([Intel XE#1406] / [Intel XE#2893]) +22 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][286] ([Intel XE#1406] / [Intel XE#1489]) +33 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][287] ([Intel XE#1128] / [Intel XE#1406]) +3 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][288] ([Intel XE#1122] / [Intel XE#1406]) +2 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][289] ([Intel XE#1122] / [Intel XE#1406] / [Intel XE#5580]) +3 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_psr2_su@page_flip-p010.html
    - shard-bmg:          NOTRUN -> [SKIP][290] ([Intel XE#1406] / [Intel XE#2387]) +3 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-primary-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][291] ([Intel XE#1406] / [Intel XE#4609]) +12 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][292] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +65 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][293] ([Intel XE#1406]) +37 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][294] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +75 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][295] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +57 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][296] ([Intel XE#1406] / [Intel XE#2234])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][297] ([Intel XE#1406] / [Intel XE#2414]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][298] ([Intel XE#1406] / [Intel XE#2939] / [Intel XE#5585])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][299] ([Intel XE#1406] / [Intel XE#2939])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][300] ([Intel XE#3414] / [Intel XE#3904]) +9 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [FAIL][301] ([Intel XE#4689]) +1 other test fail
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][302] ([Intel XE#2330]) +2 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][303] ([Intel XE#1127]) +2 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][304] ([Intel XE#3414]) +8 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
    - shard-lnl:          NOTRUN -> [SKIP][305] ([Intel XE#3414] / [Intel XE#3904]) +11 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][306] ([Intel XE#1127]) +3 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][307] ([Intel XE#1127]) +3 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][308] ([Intel XE#3414]) +9 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][309] ([Intel XE#2413]) +2 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][310] ([Intel XE#1435]) +2 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][311] ([Intel XE#1435]) +4 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][312] ([Intel XE#6503]) +10 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-adlp:         NOTRUN -> [SKIP][313] ([Intel XE#362]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@kms_tiled_display@basic-test-pattern.html
    - shard-bmg:          NOTRUN -> [SKIP][314] ([Intel XE#2426]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][315] ([Intel XE#1729])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
    - shard-lnl:          NOTRUN -> [SKIP][316] ([Intel XE#362]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][317] ([Intel XE#330])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html
    - shard-adlp:         NOTRUN -> [SKIP][318] ([Intel XE#330])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_tv_load_detect@load-detect.html
    - shard-bmg:          NOTRUN -> [SKIP][319] ([Intel XE#2450])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][320] ([Intel XE#4488]) +1 other test incomplete
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][321] ([Intel XE#4459]) +1 other test fail
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][322] ([Intel XE#455]) +134 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][323] ([Intel XE#455]) +100 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-adlp:         NOTRUN -> [SKIP][324] ([Intel XE#2168]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@kms_vrr@lobf.html
    - shard-bmg:          NOTRUN -> [SKIP][325] ([Intel XE#2168]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_vrr@lobf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][326] ([Intel XE#2168])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@kms_vrr@lobf.html

  * igt@kms_vrr@lobf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][327] ([Intel XE#6390]) +1 other test fail
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@kms_vrr@lobf@pipe-a-edp-1.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][328] ([Intel XE#1499]) +5 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][329] ([Intel XE#1499]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][330] ([Intel XE#5862]) +1 other test fail
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@panthor/panthor_gem@bo_mmap_offset_invalid_handle:
    - shard-bmg:          NOTRUN -> [SKIP][331] ([Intel XE#6530]) +8 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@panthor/panthor_gem@bo_mmap_offset_invalid_handle.html
    - shard-adlp:         NOTRUN -> [SKIP][332] ([Intel XE#6530]) +9 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@panthor/panthor_gem@bo_mmap_offset_invalid_handle.html

  * igt@panthor/panthor_vm@vm_unbind:
    - shard-lnl:          NOTRUN -> [SKIP][333] ([Intel XE#6530]) +10 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@panthor/panthor_vm@vm_unbind.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][334] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-lnl:          NOTRUN -> [SKIP][335] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_ccs@large-ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> [SKIP][336] ([Intel XE#3576] / [Intel XE#5610])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@xe_ccs@large-ctrl-surf-copy.html

  * igt@xe_ccs@suspend-resume:
    - shard-adlp:         NOTRUN -> [SKIP][337] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607]) +6 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@xe_ccs@suspend-resume.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][338] ([Intel XE#1447] / [Intel XE#5617])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_compute@ccs-mode-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][339] ([Intel XE#1447]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-adlp:         NOTRUN -> [SKIP][340] ([Intel XE#1447] / [Intel XE#5596])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_compute@ccs-mode-compute-kernel.html
    - shard-bmg:          NOTRUN -> [FAIL][341] ([Intel XE#5963])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-adlp:         NOTRUN -> [SKIP][342] ([Intel XE#6360]) +3 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_compute_preempt@compute-preempt-many-vram:
    - shard-adlp:         NOTRUN -> [SKIP][343] ([Intel XE#5191]) +1 other test skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@xe_compute_preempt@compute-preempt-many-vram.html

  * igt@xe_compute_preempt@compute-preempt-many-vram-evict:
    - shard-dg2-set2:     NOTRUN -> [SKIP][344] ([Intel XE#6360]) +4 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many-vram-evict.html
    - shard-lnl:          NOTRUN -> [SKIP][345] ([Intel XE#5191]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@xe_compute_preempt@compute-preempt-many-vram-evict.html

  * igt@xe_configfs@survivability-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][346] ([Intel XE#6010])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@xe_configfs@survivability-mode.html
    - shard-lnl:          NOTRUN -> [SKIP][347] ([Intel XE#6010])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@xe_configfs@survivability-mode.html
    - shard-adlp:         NOTRUN -> [SKIP][348] ([Intel XE#6010])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_configfs@survivability-mode.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][349] ([Intel XE#1123]) +3 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][350] ([Intel XE#1123]) +3 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-matrix-copy-200x127:
    - shard-adlp:         NOTRUN -> [SKIP][351] ([Intel XE#5300]) +3 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@xe_copy_basic@mem-matrix-copy-200x127.html

  * igt@xe_copy_basic@mem-page-copy-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][352] ([Intel XE#5300]) +3 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@xe_copy_basic@mem-page-copy-1.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][353] ([Intel XE#1126]) +3 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0x8fffe:
    - shard-adlp:         NOTRUN -> [SKIP][354] ([Intel XE#5503])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_copy_basic@mem-set-linear-0x8fffe.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][355] ([Intel XE#5503])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x8fffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][356] ([Intel XE#1126]) +2 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         NOTRUN -> [SKIP][357] ([Intel XE#1062])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@xe_create@create-big-vram.html
    - shard-lnl:          NOTRUN -> [SKIP][358] ([Intel XE#1062])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_create@create-big-vram.html

  * igt@xe_eu_stall@blocking-re-enable:
    - shard-adlp:         NOTRUN -> [SKIP][359] ([Intel XE#5626]) +7 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@xe_eu_stall@blocking-re-enable.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     NOTRUN -> [SKIP][360] ([Intel XE#5626]) +7 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][361] ([Intel XE#4837]) +67 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-connect:
    - shard-lnl:          NOTRUN -> [SKIP][362] ([Intel XE#4837]) +77 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-adlp:         NOTRUN -> [SKIP][363] ([Intel XE#4837] / [Intel XE#5565]) +75 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][364] ([Intel XE#4837]) +62 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@xe_eudebug_online@single-step.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-dg2-set2:     NOTRUN -> [SKIP][365] ([Intel XE#4518]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@xe_eudebug_sriov@deny-eudebug.html
    - shard-lnl:          NOTRUN -> [SKIP][366] ([Intel XE#4518]) +1 other test skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-adlp:         NOTRUN -> [SKIP][367] ([Intel XE#4519])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@xe_eudebug_sriov@deny-sriov.html
    - shard-bmg:          NOTRUN -> [SKIP][368] ([Intel XE#5793]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][369] ([Intel XE#688]) +57 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@xe_evict@evict-beng-threads-large-multi-vm.html

  * igt@xe_evict@evict-large-cm:
    - shard-adlp:         NOTRUN -> [SKIP][370] ([Intel XE#261] / [Intel XE#5564]) +9 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@xe_evict@evict-large-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][371] ([Intel XE#261]) +25 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][372] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) +7 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict@evict-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][373] ([Intel XE#261] / [Intel XE#688]) +4 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_evict@evict-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][374] ([Intel XE#688]) +7 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][375] ([Intel XE#5213])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][376] ([Intel XE#2322]) +42 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][377] ([Intel XE#1392]) +53 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][378] ([Intel XE#1392] / [Intel XE#5575]) +48 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
    - shard-adlp:         NOTRUN -> [SKIP][379] ([Intel XE#288] / [Intel XE#5561]) +141 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][380] ([Intel XE#288]) +125 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][381] ([Intel XE#2360]) +2 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][382] ([Intel XE#2360]) +2 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][383] ([Intel XE#3868]) +1 other test dmesg-warn
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][384] ([Intel XE#6299])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html

  * igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][385] ([Intel XE#5007]) +5 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-64k-mmap-mlock-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][386] ([Intel XE#4915]) +1615 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@xe_exec_system_allocator@many-64k-mmap-mlock-nomemset.html

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][387] ([Intel XE#5007]) +5 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][388] ([Intel XE#4943]) +111 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-malloc-prefetch-madvise:
    - shard-lnl:          NOTRUN -> [WARN][389] ([Intel XE#5786]) +12 other tests warn
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@xe_exec_system_allocator@many-malloc-prefetch-madvise.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          NOTRUN -> [FAIL][390] ([Intel XE#5625])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma:
    - shard-lnl:          NOTRUN -> [SKIP][391] ([Intel XE#6196]) +3 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][392] ([Intel XE#4915]) +1797 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge:
    - shard-lnl:          NOTRUN -> [SKIP][393] ([Intel XE#4943]) +137 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free-huge.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-adlp:         NOTRUN -> [SKIP][394] ([Intel XE#6281])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
    - shard-bmg:          NOTRUN -> [SKIP][395] ([Intel XE#6281])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][396] ([Intel XE#6281])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-dg2-set2:     NOTRUN -> [ABORT][397] ([Intel XE#5466])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
    - shard-lnl:          NOTRUN -> [ABORT][398] ([Intel XE#5466])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
    - shard-adlp:         NOTRUN -> [ABORT][399] ([Intel XE#5466] / [Intel XE#5530])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-lnl:          NOTRUN -> [ABORT][400] ([Intel XE#4757])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][401] ([Intel XE#255])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_bo:
    - shard-adlp:         NOTRUN -> [SKIP][402] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][403] ([Intel XE#2229]) +1 other test skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][404] ([Intel XE#2229])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
    - shard-adlp:         NOTRUN -> [SKIP][405] ([Intel XE#2229])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][406] ([Intel XE#2833])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html
    - shard-lnl:          NOTRUN -> [SKIP][407] ([Intel XE#2833])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][408] ([Intel XE#2229] / [Intel XE#5488])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][409] ([Intel XE#2459] / [Intel XE#2596])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@xe_media_fill@media-fill.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][410] ([Intel XE#560])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@xe_media_fill@media-fill.html
    - shard-lnl:          NOTRUN -> [SKIP][411] ([Intel XE#560])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@pci-membarrier:
    - shard-lnl:          NOTRUN -> [SKIP][412] ([Intel XE#5100]) +3 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@xe_mmap@pci-membarrier.html

  * igt@xe_mmap@pci-membarrier-bad-object:
    - shard-adlp:         NOTRUN -> [SKIP][413] ([Intel XE#5100]) +2 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@xe_mmap@pci-membarrier-bad-object.html

  * igt@xe_mmap@small-bar:
    - shard-adlp:         NOTRUN -> [SKIP][414] ([Intel XE#512])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_mmap@small-bar.html
    - shard-bmg:          NOTRUN -> [SKIP][415] ([Intel XE#586])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@xe_mmap@small-bar.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][416] ([Intel XE#512])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@xe_mmap@small-bar.html
    - shard-lnl:          NOTRUN -> [SKIP][417] ([Intel XE#512])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_mmap@small-bar.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][418] ([Intel XE#1416])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_mmap@vram.html
    - shard-adlp:         NOTRUN -> [SKIP][419] ([Intel XE#1008] / [Intel XE#5591])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_mmap@vram.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][420] ([Intel XE#2457])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@xe_module_load@force-load.html
    - shard-adlp:         NOTRUN -> [SKIP][421] ([Intel XE#378] / [Intel XE#5612])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_module_load@force-load.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][422] ([Intel XE#378])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@xe_module_load@force-load.html
    - shard-lnl:          NOTRUN -> [SKIP][423] ([Intel XE#378])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_module_load@force-load.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][424], [PASS][425], [PASS][426], [PASS][427], [PASS][428], [PASS][429], [PASS][430], [PASS][431], [PASS][432], [PASS][433], [PASS][434], [PASS][435], [PASS][436], [PASS][437], [PASS][438], [PASS][439], [PASS][440], [PASS][441], [PASS][442], [PASS][443], [PASS][444], [PASS][445], [PASS][446], [PASS][447], [PASS][448]) -> ([PASS][449], [PASS][450], [PASS][451], [PASS][452], [PASS][453], [PASS][454], [PASS][455], [SKIP][456], [PASS][457], [PASS][458], [PASS][459], [PASS][460], [PASS][461], [PASS][462], [PASS][463], [PASS][464], [PASS][465], [PASS][466], [PASS][467], [PASS][468], [PASS][469], [PASS][470], [PASS][471], [PASS][472], [PASS][473], [PASS][474]) ([Intel XE#378])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-1/igt@xe_module_load@load.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-8/igt@xe_module_load@load.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-8/igt@xe_module_load@load.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-8/igt@xe_module_load@load.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-8/igt@xe_module_load@load.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-4/igt@xe_module_load@load.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-7/igt@xe_module_load@load.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-7/igt@xe_module_load@load.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-4/igt@xe_module_load@load.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-4/igt@xe_module_load@load.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-7/igt@xe_module_load@load.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-7/igt@xe_module_load@load.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-5/igt@xe_module_load@load.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-5/igt@xe_module_load@load.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-3/igt@xe_module_load@load.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-3/igt@xe_module_load@load.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-3/igt@xe_module_load@load.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-5/igt@xe_module_load@load.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-5/igt@xe_module_load@load.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-1/igt@xe_module_load@load.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-2/igt@xe_module_load@load.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-1/igt@xe_module_load@load.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-2/igt@xe_module_load@load.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-2/igt@xe_module_load@load.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-2/igt@xe_module_load@load.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@xe_module_load@load.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@xe_module_load@load.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@xe_module_load@load.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@xe_module_load@load.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@xe_module_load@load.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_module_load@load.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_module_load@load.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@xe_module_load@load.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@xe_module_load@load.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@xe_module_load@load.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@xe_module_load@load.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_module_load@load.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_module_load@load.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@xe_module_load@load.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_module_load@load.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@xe_module_load@load.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@xe_module_load@load.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@xe_module_load@load.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@xe_module_load@load.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@xe_module_load@load.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@xe_module_load@load.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_module_load@load.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_module_load@load.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_module_load@load.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@xe_module_load@load.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][475], [PASS][476], [PASS][477], [PASS][478], [PASS][479], [PASS][480], [PASS][481], [PASS][482], [PASS][483], [PASS][484], [PASS][485], [PASS][486], [PASS][487], [PASS][488], [PASS][489], [PASS][490], [PASS][491], [PASS][492], [PASS][493], [PASS][494], [PASS][495], [PASS][496], [PASS][497]) -> ([PASS][498], [PASS][499], [PASS][500], [PASS][501], [PASS][502], [PASS][503], [PASS][504], [PASS][505], [PASS][506], [PASS][507], [PASS][508], [PASS][509], [PASS][510], [PASS][511], [PASS][512], [PASS][513], [PASS][514], [PASS][515], [PASS][516], [SKIP][517], [PASS][518]) ([Intel XE#2457])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-2/igt@xe_module_load@load.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-7/igt@xe_module_load@load.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-6/igt@xe_module_load@load.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-6/igt@xe_module_load@load.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-6/igt@xe_module_load@load.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-2/igt@xe_module_load@load.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-7/igt@xe_module_load@load.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-7/igt@xe_module_load@load.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-7/igt@xe_module_load@load.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-2/igt@xe_module_load@load.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-4/igt@xe_module_load@load.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-4/igt@xe_module_load@load.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-4/igt@xe_module_load@load.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-8/igt@xe_module_load@load.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-8/igt@xe_module_load@load.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-5/igt@xe_module_load@load.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-8/igt@xe_module_load@load.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-1/igt@xe_module_load@load.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-5/igt@xe_module_load@load.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-5/igt@xe_module_load@load.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-8/igt@xe_module_load@load.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-1/igt@xe_module_load@load.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-1/igt@xe_module_load@load.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@xe_module_load@load.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@xe_module_load@load.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@xe_module_load@load.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@xe_module_load@load.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@xe_module_load@load.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@xe_module_load@load.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@xe_module_load@load.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@xe_module_load@load.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@xe_module_load@load.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@xe_module_load@load.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@xe_module_load@load.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@xe_module_load@load.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@xe_module_load@load.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@xe_module_load@load.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@xe_module_load@load.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@xe_module_load@load.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@xe_module_load@load.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@xe_module_load@load.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@xe_module_load@load.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@xe_module_load@load.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@xe_module_load@load.html
    - shard-adlp:         ([PASS][519], [PASS][520], [PASS][521], [PASS][522], [PASS][523], [PASS][524], [PASS][525], [PASS][526], [PASS][527], [PASS][528], [PASS][529], [PASS][530], [PASS][531], [PASS][532], [PASS][533], [PASS][534], [PASS][535], [PASS][536], [PASS][537], [PASS][538], [PASS][539], [PASS][540], [PASS][541], [PASS][542], [PASS][543]) -> ([PASS][544], [PASS][545], [PASS][546], [PASS][547], [PASS][548], [PASS][549], [PASS][550], [PASS][551], [PASS][552], [PASS][553], [SKIP][554], [PASS][555], [PASS][556], [PASS][557], [PASS][558], [PASS][559], [PASS][560], [PASS][561], [PASS][562], [PASS][563], [PASS][564], [PASS][565], [PASS][566], [PASS][567], [PASS][568], [PASS][569]) ([Intel XE#378] / [Intel XE#5612])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-2/igt@xe_module_load@load.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-2/igt@xe_module_load@load.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-2/igt@xe_module_load@load.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-1/igt@xe_module_load@load.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-1/igt@xe_module_load@load.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-1/igt@xe_module_load@load.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-6/igt@xe_module_load@load.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-6/igt@xe_module_load@load.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-9/igt@xe_module_load@load.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-9/igt@xe_module_load@load.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-9/igt@xe_module_load@load.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-6/igt@xe_module_load@load.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-6/igt@xe_module_load@load.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-3/igt@xe_module_load@load.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-3/igt@xe_module_load@load.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-9/igt@xe_module_load@load.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-3/igt@xe_module_load@load.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-8/igt@xe_module_load@load.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-8/igt@xe_module_load@load.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-4/igt@xe_module_load@load.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-4/igt@xe_module_load@load.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-4/igt@xe_module_load@load.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-4/igt@xe_module_load@load.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-8/igt@xe_module_load@load.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-8/igt@xe_module_load@load.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@xe_module_load@load.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_module_load@load.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_module_load@load.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_module_load@load.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_module_load@load.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_module_load@load.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@xe_module_load@load.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@xe_module_load@load.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@xe_module_load@load.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_module_load@load.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@xe_module_load@load.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@xe_module_load@load.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@xe_module_load@load.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@xe_module_load@load.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@xe_module_load@load.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@xe_module_load@load.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_module_load@load.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_module_load@load.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@xe_module_load@load.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@xe_module_load@load.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_module_load@load.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@xe_module_load@load.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@xe_module_load@load.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@xe_module_load@load.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_module_load@load.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][570], [PASS][571], [PASS][572], [PASS][573], [PASS][574], [PASS][575], [PASS][576], [PASS][577], [PASS][578], [PASS][579], [PASS][580], [PASS][581], [PASS][582], [PASS][583], [PASS][584], [PASS][585], [PASS][586], [PASS][587], [PASS][588], [PASS][589], [PASS][590], [PASS][591], [PASS][592], [PASS][593]) -> ([PASS][594], [PASS][595], [PASS][596], [PASS][597], [PASS][598], [PASS][599], [PASS][600], [PASS][601], [PASS][602], [SKIP][603], [PASS][604], [PASS][605], [PASS][606], [PASS][607], [PASS][608], [PASS][609], [PASS][610], [PASS][611], [PASS][612], [PASS][613], [PASS][614], [PASS][615], [PASS][616], [PASS][617], [PASS][618], [PASS][619]) ([Intel XE#378])
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-432/igt@xe_module_load@load.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-432/igt@xe_module_load@load.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-432/igt@xe_module_load@load.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-464/igt@xe_module_load@load.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-464/igt@xe_module_load@load.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-464/igt@xe_module_load@load.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-435/igt@xe_module_load@load.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-435/igt@xe_module_load@load.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-466/igt@xe_module_load@load.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-466/igt@xe_module_load@load.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-466/igt@xe_module_load@load.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-436/igt@xe_module_load@load.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-434/igt@xe_module_load@load.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-434/igt@xe_module_load@load.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-436/igt@xe_module_load@load.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-436/igt@xe_module_load@load.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-434/igt@xe_module_load@load.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-434/igt@xe_module_load@load.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-433/igt@xe_module_load@load.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-433/igt@xe_module_load@load.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-433/igt@xe_module_load@load.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-463/igt@xe_module_load@load.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-463/igt@xe_module_load@load.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-463/igt@xe_module_load@load.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@xe_module_load@load.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@xe_module_load@load.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@xe_module_load@load.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@xe_module_load@load.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@xe_module_load@load.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@xe_module_load@load.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@xe_module_load@load.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@xe_module_load@load.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@xe_module_load@load.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@xe_module_load@load.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@xe_module_load@load.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@xe_module_load@load.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@xe_module_load@load.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@xe_module_load@load.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-436/igt@xe_module_load@load.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-436/igt@xe_module_load@load.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@xe_module_load@load.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@xe_module_load@load.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@xe_module_load@load.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@xe_module_load@load.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@xe_module_load@load.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@xe_module_load@load.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@xe_module_load@load.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@xe_module_load@load.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@xe_module_load@load.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@xe_module_load@load.html

  * igt@xe_noexec_ping_pong@basic:
    - shard-adlp:         NOTRUN -> [SKIP][620] ([Intel XE#6259])
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@xe_noexec_ping_pong@basic.html
    - shard-lnl:          NOTRUN -> [SKIP][621] ([Intel XE#6259])
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@xe_noexec_ping_pong@basic.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-adlp:         NOTRUN -> [SKIP][622] ([Intel XE#3573]) +38 other tests skip
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][623] ([Intel XE#2248])
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@xe_oa@oa-tlb-invalidate.html
    - shard-bmg:          NOTRUN -> [SKIP][624] ([Intel XE#2248])
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][625] ([Intel XE#3573]) +35 other tests skip
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@tail-address-wrap:
    - shard-dg2-set2:     NOTRUN -> [SKIP][626] ([Intel XE#6032]) +1 other test skip
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@xe_oa@tail-address-wrap.html
    - shard-adlp:         NOTRUN -> [SKIP][627] ([Intel XE#6032]) +1 other test skip
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@xe_oa@tail-address-wrap.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-adlp:         NOTRUN -> [SKIP][628] ([Intel XE#1337] / [Intel XE#5572])
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@xe_pat@display-vs-wb-transient.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][629] ([Intel XE#1337])
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         NOTRUN -> [SKIP][630] ([Intel XE#977])
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_pat@pat-index-xe2.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][631] ([Intel XE#977])
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-adlp:         NOTRUN -> [SKIP][632] ([Intel XE#2838] / [Intel XE#979])
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_pat@pat-index-xehpc.html
    - shard-bmg:          NOTRUN -> [SKIP][633] ([Intel XE#1420])
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][634] ([Intel XE#2838] / [Intel XE#979])
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html
    - shard-lnl:          NOTRUN -> [SKIP][635] ([Intel XE#1420] / [Intel XE#2838])
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][636] ([Intel XE#977])
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@xe_pat@pat-index-xelp.html
    - shard-bmg:          NOTRUN -> [SKIP][637] ([Intel XE#2245])
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-adlp:         NOTRUN -> [SKIP][638] ([Intel XE#979])
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_pat@pat-index-xelpg.html
    - shard-bmg:          NOTRUN -> [SKIP][639] ([Intel XE#2236])
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][640] ([Intel XE#979])
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html
    - shard-lnl:          NOTRUN -> [SKIP][641] ([Intel XE#979])
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-adlp:         NOTRUN -> [SKIP][642] ([Intel XE#1061] / [Intel XE#5568]) +1 other test skip
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_peer2peer@read.html
    - shard-bmg:          NOTRUN -> [SKIP][643] ([Intel XE#2427]) +1 other test skip
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@xe_peer2peer@read.html
    - shard-lnl:          NOTRUN -> [SKIP][644] ([Intel XE#1061])
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][645] ([Intel XE#1173]) +3 other tests fail
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-i2c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][646] ([Intel XE#5694])
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-436/igt@xe_pm@d3cold-i2c.html
    - shard-lnl:          NOTRUN -> [SKIP][647] ([Intel XE#5694])
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_pm@d3cold-i2c.html
    - shard-bmg:          NOTRUN -> [SKIP][648] ([Intel XE#5694])
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@xe_pm@d3cold-i2c.html
    - shard-adlp:         NOTRUN -> [SKIP][649] ([Intel XE#5694])
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][650] ([Intel XE#2284] / [Intel XE#366]) +4 other tests skip
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-adlp:         NOTRUN -> [SKIP][651] ([Intel XE#2284])
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@xe_pm@d3cold-mocs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][652] ([Intel XE#2284])
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@xe_pm@d3cold-mocs.html
    - shard-lnl:          NOTRUN -> [SKIP][653] ([Intel XE#2284])
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-i2c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][654] ([Intel XE#5742])
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@xe_pm@d3hot-i2c.html
    - shard-lnl:          NOTRUN -> [SKIP][655] ([Intel XE#5742])
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@xe_pm@d3hot-i2c.html
    - shard-adlp:         NOTRUN -> [SKIP][656] ([Intel XE#5742])
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][657] ([Intel XE#1948])
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@xe_pm@d3hot-mmap-vram.html
    - shard-lnl:          NOTRUN -> [SKIP][658] ([Intel XE#1948])
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][659] ([Intel XE#2284]) +5 other tests skip
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html
    - shard-adlp:         NOTRUN -> [SKIP][660] ([Intel XE#2284] / [Intel XE#366]) +6 other tests skip
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][661] ([Intel XE#4504])
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][662] ([Intel XE#584]) +10 other tests skip
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][663] ([Intel XE#2284] / [Intel XE#366]) +6 other tests skip
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][664] ([Intel XE#579])
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html
    - shard-lnl:          NOTRUN -> [SKIP][665] ([Intel XE#579])
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_pm@vram-d3cold-threshold.html
    - shard-adlp:         NOTRUN -> [SKIP][666] ([Intel XE#5611] / [Intel XE#579])
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@xe_pm@vram-d3cold-threshold.html
    - shard-bmg:          NOTRUN -> [SKIP][667] ([Intel XE#579])
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@idle-residency:
    - shard-dg2-set2:     NOTRUN -> [FAIL][668] ([Intel XE#6362]) +1 other test fail
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@xe_pm_residency@idle-residency.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][669] ([Intel XE#4650]) +1 other test skip
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-436/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_render0:
    - shard-adlp:         NOTRUN -> [TIMEOUT][670] ([Intel XE#5213] / [Intel XE#6421]) +1 other test timeout
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_render0.html

  * igt@xe_pmu@engine-activity-accuracy-90:
    - shard-lnl:          NOTRUN -> [FAIL][671] ([Intel XE#6251]) +4 other tests fail
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-lnl:          NOTRUN -> [SKIP][672] ([Intel XE#4650]) +2 other tests skip
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pmu@gt-c6-idle:
    - shard-dg2-set2:     NOTRUN -> [FAIL][673] ([Intel XE#6366])
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@xe_pmu@gt-c6-idle.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-adlp:         NOTRUN -> [SKIP][674] ([Intel XE#4733]) +1 other test skip
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-adlp:         NOTRUN -> [SKIP][675] ([Intel XE#4733] / [Intel XE#5594]) +13 other tests skip
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][676] ([Intel XE#4733]) +14 other tests skip
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][677] ([Intel XE#4733]) +11 other tests skip
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][678] ([Intel XE#944]) +13 other tests skip
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][679] ([Intel XE#944]) +12 other tests skip
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         NOTRUN -> [SKIP][680] ([Intel XE#944]) +16 other tests skip
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-lnl:          NOTRUN -> [SKIP][681] ([Intel XE#944]) +16 other tests skip
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-adlp:         NOTRUN -> [SKIP][682] ([Intel XE#4814] / [Intel XE#5614]) +3 other tests skip
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_render_copy@render-stress-4-copies.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][683] ([Intel XE#4814]) +2 other tests skip
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@xe_render_copy@render-stress-4-copies.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][684] ([Intel XE#4821])
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@xe_spin_batch@spin-mem-copy.html
    - shard-adlp:         NOTRUN -> [SKIP][685] ([Intel XE#4821])
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@xe_spin_batch@spin-mem-copy.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-lnl:          NOTRUN -> [SKIP][686] ([Intel XE#4130]) +5 other tests skip
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][687] ([Intel XE#4130]) +4 other tests skip
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][688] ([Intel XE#3342]) +1 other test skip
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@xe_sriov_flr@flr-vf1-clear.html
    - shard-lnl:          NOTRUN -> [SKIP][689] ([Intel XE#3342]) +1 other test skip
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-dg2-set2:     NOTRUN -> [SKIP][690] ([Intel XE#4273]) +1 other test skip
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@xe_sriov_flr@flr-vfs-parallel.html
    - shard-lnl:          NOTRUN -> [SKIP][691] ([Intel XE#4273]) +1 other test skip
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][692] ([Intel XE#3868] / [Intel XE#5213]) +1 other test dmesg-fail
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_sriov_scheduling@equal-throughput.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     NOTRUN -> [SKIP][693] ([Intel XE#4351])
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
    - shard-lnl:          NOTRUN -> [SKIP][694] ([Intel XE#4351]) +1 other test skip
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  * igt@xe_sriov_vram@vf-access-after-resize-up:
    - shard-dg2-set2:     NOTRUN -> [SKIP][695] ([Intel XE#6318]) +3 other tests skip
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@xe_sriov_vram@vf-access-after-resize-up.html
    - shard-lnl:          NOTRUN -> [SKIP][696] ([Intel XE#6376]) +3 other tests skip
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@xe_sriov_vram@vf-access-after-resize-up.html

  * igt@xe_sriov_vram@vf-access-beyond:
    - shard-adlp:         NOTRUN -> [SKIP][697] ([Intel XE#6376]) +3 other tests skip
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@xe_sriov_vram@vf-access-beyond.html

  * igt@xe_survivability@i2c-functionality:
    - shard-adlp:         NOTRUN -> [SKIP][698] ([Intel XE#6529]) +1 other test skip
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_survivability@i2c-functionality.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][699] ([Intel XE#6529]) +1 other test skip
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@xe_survivability@i2c-functionality.html
    - shard-lnl:          NOTRUN -> [SKIP][700] ([Intel XE#6529]) +1 other test skip
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@xe_survivability@i2c-functionality.html

  * igt@xe_vm@out-of-memory:
    - shard-adlp:         NOTRUN -> [SKIP][701] ([Intel XE#5745])
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@xe_vm@out-of-memory.html
    - shard-lnl:          NOTRUN -> [SKIP][702] ([Intel XE#5745])
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@xe_vm@out-of-memory.html

  
#### Possible fixes ####

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-adlp:         [ABORT][703] -> [PASS][704] +23 other tests pass
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-8/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_flip@blocking-absolute-wf_vblank:
    - shard-lnl:          [ABORT][705] -> [PASS][706] +24 other tests pass
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-3/igt@kms_flip@blocking-absolute-wf_vblank.html
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_flip@blocking-absolute-wf_vblank.html

  * igt@kms_flip@blocking-absolute-wf_vblank@b-edp1:
    - shard-lnl:          [DMESG-WARN][707] -> [PASS][708] +1 other test pass
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-3/igt@kms_flip@blocking-absolute-wf_vblank@b-edp1.html
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_flip@blocking-absolute-wf_vblank@b-edp1.html

  * igt@kms_flip@nonexisting-fb-interruptible@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][709] -> [PASS][710] +8 other tests pass
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-4/igt@kms_flip@nonexisting-fb-interruptible@b-hdmi-a1.html
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_flip@nonexisting-fb-interruptible@b-hdmi-a1.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2-set2:     [ABORT][711] -> [PASS][712] +24 other tests pass
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-434/igt@kms_hdr@static-toggle-dpms.html
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-dp-2:
    - shard-bmg:          [ABORT][713] -> [PASS][714] +15 other tests pass
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-7/igt@kms_hdr@static-toggle-dpms@pipe-a-dp-2.html
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@kms_hdr@static-toggle-dpms@pipe-a-dp-2.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2-set2:     [ABORT][715] ([Intel XE#5175]) -> [PASS][716]
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-4.html
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-6-pipe-d-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][717] -> [PASS][718] +40 other tests pass
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-6-pipe-d-dp-4.html
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-6-pipe-d-dp-4.html

  
#### Warnings ####

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [ABORT][719] -> [SKIP][720] ([Intel XE#367])
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
    - shard-bmg:          [ABORT][721] -> [SKIP][722] ([Intel XE#367])
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-5/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
    - shard-adlp:         [ABORT][723] -> [SKIP][724] ([Intel XE#455] / [Intel XE#787])
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         [ABORT][725] -> [SKIP][726] ([Intel XE#787])
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-1.html
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [ABORT][727] -> [SKIP][728] ([Intel XE#2311])
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [ABORT][729] -> [SKIP][730] ([Intel XE#656])
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [ABORT][731] -> [SKIP][732] ([Intel XE#5390])
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [ABORT][733] -> [SKIP][734] ([Intel XE#653])
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-slowdraw.html
    - shard-adlp:         [ABORT][735] -> [SKIP][736] ([Intel XE#653])
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@xe_eudebug@multiple-sessions:
    - shard-lnl:          [ABORT][737] -> [SKIP][738] ([Intel XE#4837])
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-8/igt@xe_eudebug@multiple-sessions.html
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_eudebug@multiple-sessions.html

  * igt@xe_exec_system_allocator@many-mmap-shared-remap-dontunmap:
    - shard-adlp:         [ABORT][739] -> [SKIP][740] ([Intel XE#4915])
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-1/igt@xe_exec_system_allocator@many-mmap-shared-remap-dontunmap.html
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_exec_system_allocator@many-mmap-shared-remap-dontunmap.html
    - shard-dg2-set2:     [ABORT][741] -> [SKIP][742] ([Intel XE#4915])
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-432/igt@xe_exec_system_allocator@many-mmap-shared-remap-dontunmap.html
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-436/igt@xe_exec_system_allocator@many-mmap-shared-remap-dontunmap.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
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
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
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
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3576]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3576
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4658
  [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
  [Intel XE#4689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4757]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4757
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#5175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5175
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5195
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5427
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488
  [Intel XE#5503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5503
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5568
  [Intel XE#5572]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5572
  [Intel XE#5574]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5574
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5580]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5580
  [Intel XE#5585]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5585
  [Intel XE#5591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#5596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5596
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#5607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
  [Intel XE#5610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5610
  [Intel XE#5611]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5611
  [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
  [Intel XE#5614]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5614
  [Intel XE#5617]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5617
  [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#5862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5862
  [Intel XE#5963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5963
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#6010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010
  [Intel XE#6011]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6011
  [Intel XE#6032]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032
  [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6259
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6299
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6313
  [Intel XE#6318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6318
  [Intel XE#6360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360
  [Intel XE#6362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6362
  [Intel XE#6366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6366
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6390
  [Intel XE#6421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6421
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6529]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6529
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#6530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6530
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b -> xe-pw-157241v1

  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b: e136fbf191d1dddb75f20c4c033d32e1caa0437b
  xe-pw-157241v1: 157241v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/index.html

--===============8974789500720852367==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Enable VF resource fixup uncondit=
ionally</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/157241/">https://patchwork.freedesktop.org/series/157241/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-157241v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-157241v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4069-e136fbf191d1dddb75f20c4c033d32e1c=
aa0437b_FULL -&gt; xe-pw-157241v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-157241v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-157241v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1572=
41v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@panthor/panthor_vm@vm_bind:<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@panthor/panthor_vm@vm_bind.=
html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157241v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@intel_hwmon@hwmon-read.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
25">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@intel_hwmon@hwmon-write.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1125">Intel XE#1125</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5574">Intel XE#5574</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_3d@basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_3d@basic.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6011">Intel =
XE#6011</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-t=
iled-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1466">Intel XE#1466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_addfb_basic@invalid-smem=
-bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_addfb_basic@invalid-smem-=
bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_async_flips@async-flip-wi=
th-page-flip-events-linear-atomic@pipe-c-edp-1.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6054">Intel XE#6054</a>)=
 +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_async_flips@async-flip-wi=
th-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5993">Intel XE#5993</a>) +3 oth=
er tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a=
-1-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_async_flips@async-flip-w=
ith-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543=
</a>) +14 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_async_flips@test-cursor.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/664">Intel XE#664</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/619">Intel XE#619</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_big_fb@4-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +26 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-si=
ze-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/610">Intel XE#610</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1428">Intel XE#1428</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/619">Intel XE#619</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1467">Intel XE#1467</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-s=
ize-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/607">Intel XE#607</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1477">Intel XE#1477</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb-si=
ze-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/610">Intel XE#610</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_bw@connected-linear-tilin=
g-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +7 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_bw@connected-linear-tili=
ng-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +11 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_bw@connected-linear-til=
ing-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +5 other tests skip<=
/li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@kms_bw@connected-linear-tilin=
g-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) +7 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_bw@connected-linear-tilin=
g-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@kms_bw@linear-tiling-1-disp=
lays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_bw@linear-tiling-2-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_bw@linear-tiling-4-displ=
ays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@kms_ccs@bad-pixel-format-4-=
tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +426 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-t=
iled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-til=
ed-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +86 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_ccs@crc-primary-basic-4-t=
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
/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation=
-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#78=
7</a>) +187 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete<=
/li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend=
-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3442">Intel XE#3442</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3433">Intel XE#3433</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-=
y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +281 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +65 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +121 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Int=
el XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6168">Intel XE#6168</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#311=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212=
">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2907">Intel XE#2907</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +40 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_cdclk@mode-transition.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4417">Intel XE#4417</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_cdclk@mode-transition-al=
l-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4418">Intel XE#4418</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_cdclk@mode-transition-all=
-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2724">Intel XE#2724</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@kms_cdclk@mode-transition-a=
ll-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4418">Intel XE#4418</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_cdclk@mode-transition-all=
-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_cdclk@mode-transition@pi=
pe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4417">Intel XE#4417</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_cdclk@mode-transition@pip=
e-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_cdclk@plane-scaling.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
416">Intel XE#4416</a>) +3 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_cdclk@plane-scaling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4416">Intel XE#4416</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_cdclk@plane-scaling@pipe=
-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4416">Intel XE#4416</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_chamelium_color@ctm-0-50=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>) +10 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@kms_chamelium_color@ctm-0-50.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_chamelium_color@ctm-blue-=
to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/306">Intel XE#306</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_chamelium_color@gamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@kms_chamelium_edid@dp-edid-r=
esolution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_chamelium_frames@hdmi-asp=
ect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/373">Intel XE#373</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd-ena=
ble-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/373">Intel XE#373</a>) +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_chamelium_sharpness_filte=
r@filter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_chamelium_sharpness_filt=
er@filter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@kms_chamelium_sharpness_fil=
ter@filter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_chamelium_sharpness_filte=
r@filter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_content_protection@conten=
t-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2341">Intel XE#2341</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_content_protection@dp-m=
st-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/307">Intel XE#307</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_content_protection@dp-mst=
-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/307">Intel XE#307</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2390">Intel XE#2390</a>) +3 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@kms_content_protection@dp-ms=
t-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_content_protection@legacy=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_content_protection@mei-in=
terface.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1468">Intel XE#1468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@kms_content_protection@ueve=
nt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1188">Intel XE#1188</a>) +1 other test fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_content_protection@uevent=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3278">Intel XE#3278</a>) +8 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_content_protection@uevent=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_cursor_crc@cursor-onscr=
een-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>) +7 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_cursor_crc@cursor-onscree=
n-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2321">Intel XE#2321</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@kms_cursor_crc@cursor-random-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@kms_cursor_crc@cursor-random-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-m=
ovement-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1424">Intel XE#1424</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_cursor_crc@cursor-slidin=
g-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@kms_cursor_legacy@2x-nonblock=
ing-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +27 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs=
-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +28 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cur=
sor-atomic-transitions.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323<=
/a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</=
a>) +2 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_cursor_legacy@short-busy=
-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</=
a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_dirtyfb@drrs-dirtyfb-ioct=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1508">Intel XE#1508</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_display_modes@extended-m=
ode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4302">Intel XE#4302</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_display_modes@extended-mo=
de-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_dp_aux_dev.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Int=
el XE#3009</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Inte=
l XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_dp_link_training@non-uh=
br-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@kms_dp_link_training@non-uhb=
r-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4354">Intel XE#4354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_dp_link_training@uhbr-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@kms_dp_link_training@uhbr-m=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@kms_dp_link_training@uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4356">Intel XE#4356</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_dp_linktrain_fallback@dp=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4331">Intel XE#4331</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_dp_linktrain_fallback@dp-=
fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4331">Intel XE#4331</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@kms_dp_linktrain_fallback@d=
sc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4331">Intel XE#4331</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_dp_linktrain_fallback@dsc=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2244">Intel XE#2244</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirt=
y-rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) +2 other tests s=
kip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) +2 other tests skip</=
li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@kms_fbcon_fbt@psr-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/776">Intel XE#776</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_fbcon_fbt@psr-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/776">Intel XE#776</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/776">Intel XE#776</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2372">Intel XE#2372</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@kms_feature_discovery@chame=
lium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/701">Intel XE#701</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/701">Intel XE#701</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_feature_discovery@chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_feature_discovery@display=
-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/702">Intel XE#702</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_feature_discovery@displa=
y-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@kms_feature_discovery@display=
-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/703">Intel XE#703</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@kms_feature_discovery@displa=
y-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/703">Intel XE#703</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_feature_discovery@display=
-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2373">Intel XE#2373</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@kms_feature_discovery@displ=
ay-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_feature_discovery@displa=
y-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1138">Intel XE#1138</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@kms_feature_discovery@displ=
ay-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1138">Intel XE#1138</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@kms_feature_discovery@dp-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1137">Intel XE#1137</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_feature_discovery@dp-mst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2375">Intel XE#2375</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@kms_feature_discovery@dp-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1137">Intel XE#1137</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_feature_discovery@dp-mst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_feature_discovery@psr1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1135">Intel XE#1135</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_feature_discovery@psr1.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2374">Intel XE#2374</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@kms_feature_discovery@psr1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1135">Intel XE#1135</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_flip@2x-flip-vs-dpms-on-=
nop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/310">Intel XE#310</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_flip@2x-flip-vs-rmfb-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1421">Intel XE#1421</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-rec=
reate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vbla=
nk@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend-inte=
rruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test in=
complete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bp=
p-xtile-to-64bpp-xtile-upscaling.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4683">Intel XE#4683</a>) +3 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bp=
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
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106">Intel XE#310=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683=
">Intel XE#4683</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bp=
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
/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel=
 XE#4543</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4921">Intel XE#4921</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Inte=
l XE#2293</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_force_connector_basic@pru=
ne-stale-modes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/352">Intel XE#352</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +67 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +218 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +123 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_frontbuffer_tracking@dr=
rs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/651">Intel XE#651</a>) +137 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6313">Intel XE#6313</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
-1p-offscreen-pri-shrfb-draw-mmap-wc.html">DMESG-FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +13=
 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
-1p-rte.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +4 other tests dme=
sg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5427">Intel XE#5427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +52 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1151">Intel XE#1151</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fb=
c-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/658">Intel XE#658</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +11 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +18 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +22 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +28 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1469">Intel XE#1469</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +145 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
psr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +68 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_frontbuffer_tracking@pipe=
-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5672">Intel XE#5672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@kms_frontbuffer_tracking@pla=
ne-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1158">Intel XE#1158</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_frontbuffer_tracking@plan=
e-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +125 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +229 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_hdmi_inject@inject-4k.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1470">Intel XE#1470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1470">Intel XE#1470</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_hdr@invalid-metadata-size=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1503">Intel XE#1503</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_invalid_mode@clock-too-hi=
gh@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1450">Intel XE#1450</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_invalid_mode@clock-too-hi=
gh@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@kms_joiner@basic-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/346">Intel XE#346</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_joiner@basic-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/346">Intel XE#346</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/346">Intel XE#346</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@kms_joiner@basic-force-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2925">Intel XE#2925</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2934">Intel XE#2934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@kms_joiner@basic-max-non-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4298">Intel XE#4298</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_joiner@basic-max-non-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4298">Intel XE#4298</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@kms_joiner@basic-max-non-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4298">Intel XE#4298</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_joiner@basic-max-non-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_joiner@basic-ultra-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2927">Intel XE#2927</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2927">Intel XE#2927</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_joiner@invalid-modeset-bi=
g-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_joiner@invalid-modeset-f=
orce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3012">Intel XE#3012</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@kms_joiner@invalid-modeset-=
ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2927">Intel XE#2927</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_joiner@invalid-modeset-ul=
tra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2927">Intel XE#2927</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_joiner@switch-modeset-ult=
ra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@kms_joiner@switch-modeset-u=
ltra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_joiner@switch-modeset-ult=
ra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_multipipe_modeset@basic-=
max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_multipipe_modeset@basic=
-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_panel_fitting@legacy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2486">Intel XE#2486</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb88=
88-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5624">Intel XE#5624</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_pipe_stress@stress-xrgb8=
888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5624">Intel XE#5624</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_pipe_stress@stress-xrgb=
8888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5624">Intel XE#5624</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb88=
88-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5624">Intel XE#5624</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@kms_pipe_stress@stress-xrgb=
8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4359">Intel XE#4359</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_plane@pixel-format-source=
-clamping@pipe-a-plane-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5195">Intel XE#5195</a>) +2 other tests fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_plane@pixel-format-sourc=
e-clamping@pipe-b-plane-0.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5195">Intel XE#5195</a>) +4 other tests fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_plane_lowres@tiling-x@pip=
e-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/599">Intel XE#599</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2393">Intel XE#2393</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_plane_multiple@2x-tiling-=
none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4596">Intel XE#4596</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5021">Intel XE#5021</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@kms_plane_multiple@2x-tilin=
g-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_plane_multiple@2x-tiling=
-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4596">Intel XE#4596</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_plane_multiple@tiling-x@p=
ipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4658">Intel XE#4658</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_plane_multiple@tiling-yf=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5020">Intel XE#5020</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5020">Intel XE#5020</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_plane_multiple@tiling-y=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5020">Intel XE#5020</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5020">Intel XE#5020</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_plane_scaling@intel-max-s=
rc-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-=
c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_plane_scaling@plane-downs=
cale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +53 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +19 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_pm_backlight@brightness-w=
ith-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2938">Intel XE#2938</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_pm_backlight@brightness-=
with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2938">Intel XE#2938</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@kms_pm_backlight@brightness=
-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_pm_backlight@fade.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870=
">Intel XE#870</a>) +3 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@kms_pm_backlight@fade.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
0">Intel XE#870</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/870">Intel XE#870</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2391">Intel XE#2391</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_pm_dc@dc3co-vpb-simulati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1122">Intel XE#1122</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulat=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1122">Intel XE#1122</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@kms_pm_dc@dc5-dpms-negative.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_pm_dc@dc5-psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">=
Intel XE#1129</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"=
>Intel XE#1129</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_pm_dc@dc5-retention-flo=
ps.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3309">Intel XE#3309</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@kms_pm_dc@dc5-retention-flops=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3309">Intel XE#3309</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_pm_dc@dc5-retention-flop=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3309">Intel XE#3309</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_pm_dc@dc5-retention-flops=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908"=
>Intel XE#908</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_pm_dc@dc6-dpms.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">=
Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">In=
tel XE#718</a>) +1 other test fail</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">I=
ntel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">=
Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_pm_dc@deep-pkgc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007=
">Intel XE#2007</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505"=
>Intel XE#2505</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029"=
>Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_pm_rpm@dpms-mode-unset-no=
n-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@kms_pm_rpm@dpms-non-lpsp.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/836">Intel XE#836</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html"=
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
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3141">Intel XE#3141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-cursor=
-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#148=
9</a>) +42 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608"=
>Intel XE#4608</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pi=
pe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608"=
>Intel XE#4608</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_psr2_sf@pr-overlay-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)=
 +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-plane-=
move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +22 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>=
) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1128">Intel XE#1128</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_psr2_su@page_flip-nv12.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1122">Intel XE#1122</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_psr2_su@page_flip-p010.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1122">Intel XE#1122</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5580">Intel XE#5580</a>) +3 other tests skip=
</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2387">Intel XE#2387</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-blt@=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4609">Intel XE#4609</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-pla=
ne-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +65 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@kms_psr@pr-no-drrs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_psr@psr-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/929">Intel XE#929</a>) +75 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_psr@psr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +57 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@kms_psr@psr2-primary-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@kms_psr_stress_test@invalida=
te-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5585">Intel XE#5585=
</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_psr_stress_test@invalid=
ate-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_rotation_crc@primary-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_rotation_crc@primary-x-ti=
led-reflect-x-180.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4689">Intel XE#4689</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2330">Intel XE#2330</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +8 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +11 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1127">Intel XE#1127</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_rotation_crc@sprite-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_scaling_modes@scaling-mod=
e-center.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2413">Intel XE#2413</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_setmode@basic-clone-singl=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1435">Intel XE#1435</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@kms_setmode@invalid-clone-sin=
gle-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1435">Intel XE#1435</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@kms_sharpness_filter@invalid-=
filter-with-scaling-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +10 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@kms_tiled_display@basic-test=
-pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/362">Intel XE#362</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2426">Intel XE#2426</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@kms_tiled_display@basic-tes=
t-pattern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1729">Intel XE#1729</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/362">Intel XE#362</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@kms_tv_load_detect@load-det=
ect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/330">Intel XE#330</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_tv_load_detect@load-dete=
ct.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/330">Intel XE#330</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_vblank@ts-continuation-=
suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4488">Intel XE#4488</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@kms_vrr@flip-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455=
">Intel XE#455</a>) +134 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@kms_vrr@flipline.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">I=
ntel XE#455</a>) +100 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@kms_vrr@lobf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel=
 XE#2168</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@kms_vrr@lobf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Inte=
l XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@kms_vrr@lobf@pipe-a-edp-1.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6390">Intel XE#6390</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_vrr@max-min.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@kms_vrr@negative-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
99">Intel XE#1499</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-vi=
rtual@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5862">Intel XE#5862</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_gem@bo_mmap_offset_invalid_handle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@panthor/panthor_gem@bo_mmap_o=
ffset_invalid_handle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6530">Intel XE#6530</a>) +8 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@panthor/panthor_gem@bo_mmap_=
offset_invalid_handle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6530">Intel XE#6530</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@panthor/panthor_vm@vm_unbind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@panthor/panthor_vm@vm_unbind.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6530">Intel XE#6530</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@sriov_basic@enable-vfs-bind=
-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other=
 test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@sriov_basic@enable-vfs-bind-u=
nbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@xe_ccs@large-ctrl-surf-copy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3576">Intel XE#3576</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5610">Intel XE#5610</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@xe_ccs@suspend-resume.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/488">Intel XE#488</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5607">Intel XE#5607</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_compute@ccs-mode-basic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1447">Intel XE#1447</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5617">Intel XE#5617</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@xe_compute@ccs-mode-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1447">Intel XE#1447</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_compute@ccs-mode-compute-=
kernel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1447">Intel XE#1447</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5596">Intel XE#5596</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@xe_compute@ccs-mode-compute-k=
ernel.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5963">Intel XE#5963</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_compute_preempt@compute-p=
reempt-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6360">Intel XE#6360</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@xe_compute_preempt@compute-p=
reempt-many-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5191">Intel XE#5191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram-evict:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@xe_compute_preempt@compute-=
preempt-many-vram-evict.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6360">Intel XE#6360</a>) +4 other tests skip</l=
i>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@xe_compute_preempt@compute-pr=
eempt-many-vram-evict.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5191">Intel XE#5191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@xe_configfs@survivability-m=
ode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6010">Intel XE#6010</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@xe_configfs@survivability-mod=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6010">Intel XE#6010</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_configfs@survivability-mo=
de.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6010">Intel XE#6010</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_copy_basic@mem-copy-linea=
r-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1123">Intel XE#1123</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-line=
ar-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1123">Intel XE#1123</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-matrix-copy-200x127:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@xe_copy_basic@mem-matrix-cop=
y-200x127.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5300">Intel XE#5300</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-page-copy-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@xe_copy_basic@mem-page-copy=
-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5300">Intel XE#5300</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_copy_basic@mem-set-linear=
-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1126">Intel XE#1126</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x8fffe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_copy_basic@mem-set-linear=
-0x8fffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5503">Intel XE#5503</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linea=
r-0x8fffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5503">Intel XE#5503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@xe_copy_basic@mem-set-linea=
r-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1126">Intel XE#1126</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@xe_create@create-big-vram.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1062">Intel XE#1062</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_create@create-big-vram.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1062">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-re-enable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@xe_eu_stall@blocking-re-enab=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5626">Intel XE#5626</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@xe_eu_stall@invalid-event-r=
eport-count.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5626">Intel XE#5626</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@xe_eudebug@basic-close.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a>) +67 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_eudebug@basic-connect.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a>) +77 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_eudebug_online@set-breakp=
oint-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) +75 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@xe_eudebug_online@single-step=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4837">Intel XE#4837</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@xe_eudebug_sriov@deny-eudeb=
ug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4518">Intel XE#4518</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@xe_eudebug_sriov@deny-eudebug=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4518">Intel XE#4518</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@xe_eudebug_sriov@deny-sriov.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4519">Intel XE#4519</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@xe_eudebug_sriov@deny-sriov.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5793">Intel XE#5793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@xe_evict@evict-beng-threads-l=
arge-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/688">Intel XE#688</a>) +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@xe_evict@evict-large-cm.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5564">Intel XE#5564</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_evict@evict-mixed-many-th=
reads-small.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/261">Intel XE#261</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@xe_evict@evict-small-externa=
l-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_evict@evict-threads-small=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@xe_evict_ccs@evict-overcommi=
t-parallel-instantfree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-bindexecqueue-rebind.html">DMESG-FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +42 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exe=
c-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1392">Intel XE#1392</a>) +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>)=
 +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@xe_exec_fault_mode@many-bind=
execqueue-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +141 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-us=
erptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/288">Intel XE#288</a>) +125 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@xe_exec_mix_modes@exec-simpl=
e-batch-store-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@xe_exec_mix_modes@exec-spin=
ner-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3868">Intel XE#3868</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_exec_reset@long-spin-comp=
-reuse-many-preempt-threads.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6299">Intel XE#6299</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_exec_system_allocator@many=
-64k-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-mlock-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@xe_exec_system_allocator@ma=
ny-64k-mmap-mlock-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +1615 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@xe_exec_system_allocator@many=
-64k-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@xe_exec_system_allocator@many=
-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +111 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-prefetch-madvise:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@xe_exec_system_allocator@many=
-malloc-prefetch-madvise.html">WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5786">Intel XE#5786</a>) +12 other tests warn<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@xe_exec_system_allocator@pat-=
index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@xe_exec_system_allocator@pat-=
index-madvise-pat-idx-wt-multi-vma.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_exec_system_allocator@pro=
cess-many-execqueues-mmap-nomemset.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +1797 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-free=
-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-execqueues-mmap-free-huge.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +=
137 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@xe_fault_injection@exec-queu=
e-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@xe_fault_injection@exec-queue=
-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@xe_fault_injection@exec-que=
ue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@xe_fault_injection@probe-fa=
il-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@xe_fault_injection@probe-fail=
-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_fault_injection@probe-fai=
l-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@xe_fault_injection@probe-fail=
-guc-xe_guc_mmio_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4757">Intel XE#4757</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@xe_huc_copy@huc_copy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
5">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@xe_live_ktest@xe_bo.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229=
">Intel XE#2229</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_live_ktest@xe_bo@xe_bo_evi=
ct_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_ccs_mi=
grate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@xe_live_ktest@xe_bo@xe_ccs_m=
igrate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2833">Intel XE#2833</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@xe_live_ktest@xe_eudebug.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@xe_live_ktest@xe_migrate@xe_=
validate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5488">Intel XE#5488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@xe_media_fill@media-fill.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2459">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2596">Intel XE#2596</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@xe_media_fill@media-fill.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/560">Intel XE#560</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_media_fill@media-fill.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@xe_mmap@pci-membarrier.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/51=
00">Intel XE#5100</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-object:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@xe_mmap@pci-membarrier-bad-o=
bject.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5100">Intel XE#5100</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_mmap@small-bar.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">I=
ntel XE#512</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@xe_mmap@small-bar.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">In=
tel XE#586</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@xe_mmap@small-bar.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">=
Intel XE#512</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_mmap@small-bar.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">In=
tel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_mmap@vram.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel =
XE#1416</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_mmap@vram.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel=
 XE#1008</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5591">Intel XE#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@xe_module_load@force-load.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2457">Intel XE#2457</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_module_load@force-load.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/378">Intel XE#378</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5612">Intel XE#5612</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@xe_module_load@force-load.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/378">Intel XE#378</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_module_load@force-load.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-l=
nl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/sha=
rd-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b=
/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0=
437b/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1=
caa0437b/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d=
32e1caa0437b/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c=
033d32e1caa0437b/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f2=
0c4c033d32e1caa0437b/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb=
75f20c4c033d32e1caa0437b/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1=
dddb75f20c4c033d32e1caa0437b/shard-lnl-5/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf1=
91d1dddb75f20c4c033d32e1caa0437b/shard-lnl-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136=
fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-=
e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-=
lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/sh=
ard-lnl-2/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-157241v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1572=
41v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-=
8/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1572=
41v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1572=
41v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-157241v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1572=
41v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1572=
41v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@xe_module=
_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/378">Intel XE#378</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/sha=
rd-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0=
437b/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1=
caa0437b/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d=
32e1caa0437b/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c=
033d32e1caa0437b/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f2=
0c4c033d32e1caa0437b/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb=
75f20c4c033d32e1caa0437b/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1=
dddb75f20c4c033d32e1caa0437b/shard-bmg-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf1=
91d1dddb75f20c4c033d32e1caa0437b/shard-bmg-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136=
fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-=
e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-=
1/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-157241v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/sha=
rd-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-157241v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/sha=
rd-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-157241v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/sha=
rd-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-157241v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/sha=
rd-bmg-5/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@xe_module_load@lo=
ad.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2457">Intel XE#2457</a>)</li>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-ad=
lp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/sha=
rd-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437=
b/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1ca=
a0437b/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d3=
2e1caa0437b/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c=
033d32e1caa0437b/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f=
20c4c033d32e1caa0437b/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dd=
db75f20c4c033d32e1caa0437b/shard-adlp-9/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf19=
1d1dddb75f20c4c033d32e1caa0437b/shard-adlp-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136=
fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069=
-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-3/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-3/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-8/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-ad=
lp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/sha=
rd-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437=
b/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1ca=
a0437b/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d3=
2e1caa0437b/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c=
033d32e1caa0437b/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f=
20c4c033d32e1caa0437b/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/=
shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-157241v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1572=
41v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-157241v1/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-a=
dlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-157241v1/shard-adlp-1/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/sh=
ard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-157241v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241=
v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adl=
p-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
57241v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Int=
el XE#378</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5612">Intel XE#5612</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-432/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-432/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-4=
32/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard=
-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b=
/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1ca=
a0437b/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d=
32e1caa0437b/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20=
c4c033d32e1caa0437b/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1ddd=
b75f20c4c033d32e1caa0437b/shard-dg2-466/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf19=
1d1dddb75f20c4c033d32e1caa0437b/shard-dg2-466/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e13=
6fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-466/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-40=
69-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-436/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-434/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-436=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-d=
g2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/s=
hard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0=
437b/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32=
e1caa0437b/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c=
033d32e1caa0437b/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75=
f20c4c033d32e1caa0437b/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1=
dddb75f20c4c033d32e1caa0437b/shard-dg2-463/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fb=
f191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-463/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-=
e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-463/igt@xe_module_load@l=
oad.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-157241v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg=
2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-157241v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v=
1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-157241v1/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-d=
g2-463/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-157241v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1572=
41v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-436/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-157241v1/shard-dg2-463/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shar=
d-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-157241v1/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157=
241v1/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/sha=
rd-dg2-464/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong@basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@xe_noexec_ping_pong@basic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6259">Intel XE#6259</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@xe_noexec_ping_pong@basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6259">Intel XE#6259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@xe_oa@mmio-triggered-reports=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3573">Intel XE#3573</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@xe_oa@oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
248">Intel XE#2248</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-str=
eam-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3573">Intel XE#3573</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@tail-address-wrap:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@xe_oa@tail-address-wrap.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6032">Intel XE#6032</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@xe_oa@tail-address-wrap.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6032">Intel XE#6032</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@xe_pat@display-vs-wb-transie=
nt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1337">Intel XE#1337</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5572">Intel XE#5572</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@xe_pat@display-vs-wb-transi=
ent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_pat@pat-index-xe2.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977=
">Intel XE#977</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@xe_pat@pat-index-xe2.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/97=
7">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_pat@pat-index-xehpc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/979">Intel XE#979</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/979">Intel XE#979</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2838">Intel XE#2838</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977=
">Intel XE#977</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/224=
5">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_pat@pat-index-xelpg.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
79">Intel XE#979</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
36">Intel XE#2236</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
979">Intel XE#979</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/97=
9">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_peer2peer@read.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">=
Intel XE#1061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5568">Intel XE#5568</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@xe_peer2peer@read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">I=
ntel XE#2427</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_peer2peer@read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">I=
ntel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +3 other tests fail</l=
i>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-436/igt@xe_pm@d3cold-i2c.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">=
Intel XE#5694</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_pm@d3cold-i2c.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">In=
tel XE#5694</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-6/igt@xe_pm@d3cold-i2c.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">In=
tel XE#5694</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_pm@d3cold-i2c.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">I=
ntel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@xe_pm@d3cold-mocs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">=
Intel XE#2284</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@xe_pm@d3cold-mocs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"=
>Intel XE#2284</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@xe_pm@d3cold-mocs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">I=
ntel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@xe_pm@d3hot-i2c.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">I=
ntel XE#5742</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@xe_pm@d3hot-i2c.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Int=
el XE#5742</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_pm@d3hot-i2c.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">In=
tel XE#5742</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@xe_pm@d3hot-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/19=
48">Intel XE#1948</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@xe_pm@d3hot-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/194=
8">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exe=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2284">Intel XE#2284</a>) +5 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@xe_pm@s2idle-d3cold-basic-ex=
ec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/366">Intel XE#366</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-userptr=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4504">Intel XE#4504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_pm@s3-mocs.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel =
XE#584</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@xe_pm@s4-d3cold-basic-exec.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/366">Intel XE#366</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/579">Intel XE#579</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-3/igt@xe_pm@vram-d3cold-threshold.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5611">Intel XE#5611</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/579">Intel XE#579</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-432/igt@xe_pm_residency@idle-reside=
ncy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6362">Intel XE#6362</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-436/igt@xe_pmu@all-fn-engine-activi=
ty-load.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4650">Intel XE#4650</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_render=
0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_pmu@all-fn-engine-activit=
y-load@engine-drm_xe_engine_class_render0.html">TIMEOUT</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6421">Intel =
XE#6421</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_pmu@engine-activity-accura=
cy-90.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6251">Intel XE#6251</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@xe_pmu@fn-engine-activity-sch=
ed-if-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4650">Intel XE#4650</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-c6-idle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@xe_pmu@gt-c6-idle.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6366"=
>Intel XE#6366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_pxp@display-pxp-fb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/47=
33">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_pxp@pxp-stale-bo-bind-pos=
t-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5594">Intel XE#5594</a>) +13 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@xe_pxp@pxp-termination-key-=
update-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4733">Intel XE#4733</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/igt@xe_pxp@pxp-termination-key-up=
date-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@xe_query@multigpu-query-eng=
ines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-bmg-4/igt@xe_query@multigpu-query-inval=
id-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@xe_query@multigpu-query-inva=
lid-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-5/igt@xe_query@multigpu-query-pxp-s=
tatus.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_render_copy@render-stress=
-4-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4814">Intel XE#4814</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5614">Intel XE#5614</a>) +3 other tests skip</l=
i>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@xe_render_copy@render-stres=
s-4-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4814">Intel XE#4814</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@xe_spin_batch@spin-mem-copy=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4821">Intel XE#4821</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@xe_spin_batch@spin-mem-copy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4821">Intel XE#4821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_sriov_auto_provisioning@fa=
ir-allocation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4130">Intel XE#4130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@xe_sriov_auto_provisioning@=
resources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-463/igt@xe_sriov_flr@flr-vf1-clear.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3342">Intel XE#3342</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3342">Intel XE#3342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@xe_sriov_flr@flr-vfs-parall=
el.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4273">Intel XE#4273</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-8/igt@xe_sriov_flr@flr-vfs-parallel=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4273">Intel XE#4273</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-2/igt@xe_sriov_scheduling@equal-th=
roughput.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3868">Intel XE#3868</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a>) +1 other test dme=
sg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-433/igt@xe_sriov_scheduling@nonpree=
mpt-engine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@xe_sriov_scheduling@nonpreemp=
t-engine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4351">Intel XE#4351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-up:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@xe_sriov_vram@vf-access-aft=
er-resize-up.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6318">Intel XE#6318</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-1/igt@xe_sriov_vram@vf-access-after=
-resize-up.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6376">Intel XE#6376</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-beyond:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@xe_sriov_vram@vf-access-beyo=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6376">Intel XE#6376</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@i2c-functionality:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/igt@xe_survivability@i2c-functio=
nality.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6529">Intel XE#6529</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-dg2-466/igt@xe_survivability@i2c-functi=
onality.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6529">Intel XE#6529</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-2/igt@xe_survivability@i2c-function=
ality.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6529">Intel XE#6529</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@out-of-memory:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-adlp-4/igt@xe_vm@out-of-memory.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745=
">Intel XE#5745</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157241v1/shard-lnl-4/igt@xe_vm@out-of-memory.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745"=
>Intel XE#5745</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-8/igt@kms_big=
_fb@y-tiled-16bpp-rotate-0.html">ABORT</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-1/igt@kms_big_fb@y-til=
ed-16bpp-rotate-0.html">PASS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-3/igt@kms_flip=
@blocking-absolute-wf_vblank.html">ABORT</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms_flip@blocki=
ng-absolute-wf_vblank.html">PASS</a> +24 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-3/igt@kms_flip=
@blocking-absolute-wf_vblank@b-edp1.html">DMESG-WARN</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-7/igt@kms=
_flip@blocking-absolute-wf_vblank@b-edp1.html">PASS</a> +1 other test pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-4/igt@kms_fli=
p@nonexisting-fb-interruptible@b-hdmi-a1.html">DMESG-WARN</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-9/i=
gt@kms_flip@nonexisting-fb-interruptible@b-hdmi-a1.html">PASS</a> +8 other =
tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-434/igt@kms_hd=
r@static-toggle-dpms.html">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@kms_hdr@static-toggle=
-dpms.html">PASS</a> +24 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-7/igt@kms_hdr@=
static-toggle-dpms@pipe-a-dp-2.html">ABORT</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-2/igt@kms_hdr@stati=
c-toggle-dpms@pipe-a-dp-2.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-436/igt@kms_pl=
ane_multiple@2x-tiling-4.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5175">Intel XE#5175</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-435/igt@kms=
_plane_multiple@2x-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-6-pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-436/igt@kms_pl=
ane_multiple@2x-tiling-4@pipe-b-hdmi-a-6-pipe-d-dp-4.html">DMESG-WARN</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/sh=
ard-dg2-435/igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-6-pipe-d-dp-4.=
html">PASS</a> +40 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-466/igt@kms_bw=
@linear-tiling-3-displays-2160x1440p.html">ABORT</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-434/igt@kms_b=
w@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-5/igt@kms_bw@l=
inear-tiling-3-displays-2160x1440p.html">ABORT</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-1/igt@kms_bw@li=
near-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-9/igt@kms_ccs=
@crc-primary-rotation-180-y-tiled-ccs.html">ABORT</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-8/igt@kms_c=
cs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-9/igt@kms_ccs=
@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-1.html">ABORT</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-=
adlp-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html">ABORT</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shar=
d-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">ABORT</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/sh=
ard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mma=
p-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">ABORT</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-bmg-8/=
igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel=
 XE#5390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@psr-slowdraw.html">ABORT</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg2-464/igt@kms_frontb=
uffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-1/igt@kms_fro=
ntbuffer_tracking@psr-slowdraw.html">ABORT</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adlp-6/igt@kms_frontbuf=
fer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multiple-sessions:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-lnl-8/igt@xe_eudeb=
ug@multiple-sessions.html">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-157241v1/shard-lnl-3/igt@xe_eudebug@multiple-ses=
sions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-shared-remap-dontunmap:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-adlp-1/igt@xe_exec=
_system_allocator@many-mmap-shared-remap-dontunmap.html">ABORT</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-adl=
p-2/igt@xe_exec_system_allocator@many-mmap-shared-remap-dontunmap.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915"=
>Intel XE#4915</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/shard-dg2-432/igt@xe_exe=
c_system_allocator@many-mmap-shared-remap-dontunmap.html">ABORT</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/shard-dg=
2-436/igt@xe_exec_system_allocator@many-mmap-shared-remap-dontunmap.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/491=
5">Intel XE#4915</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b -&gt; xe-pw-157=
241v1</li>
</ul>
<p>IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b: e136fbf191d1dddb75f20c4=
c033d32e1caa0437b<br />
  xe-pw-157241v1: 157241v1</p>

</body>
</html>

--===============8974789500720852367==--
