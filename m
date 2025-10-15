Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9141CCCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 08:07:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4E510E269;
	Wed, 15 Oct 2025 08:07:12 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE2F10E262;
 Wed, 15 Oct 2025 08:07:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3562077224289343993=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Don=27t_call_xe?=
 =?utf-8?q?=5Fdevice=5Fget=5Fgt_twice_in_xe=5Fhw=5Fengine=5Flookup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Oct 2025 08:07:11 -0000
Message-ID: <176051563196.15141.14907282893739154044@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251014193639.148788-2-jonathan.cavitt@intel.com>
In-Reply-To: <20251014193639.148788-2-jonathan.cavitt@intel.com>
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

--===============3562077224289343993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Don't call xe_device_get_gt twice in xe_hw_engine_lookup
URL   : https://patchwork.freedesktop.org/series/155937/
State : failure

== Summary ==

CI Bug Log - changes from xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb_FULL -> xe-pw-155937v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-155937v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-155937v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-155937v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_compute_preempt@compute-threadgroup-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-464/igt@xe_compute_preempt@compute-threadgroup-preempt.html

  * igt@xe_create@create-execqueues-noleak:
    - shard-adlp:         [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-2/igt@xe_create@create-execqueues-noleak.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_create@create-execqueues-noleak.html

  * igt@xe_exec_reset@cancel-preempt:
    - shard-dg2-set2:     [PASS][4] -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-dg2-466/igt@xe_exec_reset@cancel-preempt.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-432/igt@xe_exec_reset@cancel-preempt.html

  
#### Warnings ####

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][6] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-dg2-433/igt@xe_compute_preempt@compute-preempt.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-464/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-adlp:         [SKIP][8] ([Intel XE#455] / [Intel XE#5632]) -> [SKIP][9] +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-8/igt@xe_compute_preempt@compute-preempt-many.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@xe_compute_preempt@compute-preempt-many.html
    - shard-dg2-set2:     [FAIL][10] ([Intel XE#5890]) -> [SKIP][11] +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_compute_preempt@compute-preempt-many-vram-evict}:
    - shard-dg2-set2:     [FAIL][12] ([Intel XE#5890]) -> [SKIP][13] +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many-vram-evict.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many-vram-evict.html

  
Known issues
------------

  Here are the changes found in xe-pw-155937v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1125] / [Intel XE#5574])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#3157])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#5993]) +3 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][18] ([Intel XE#3884]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#316])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#607]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#316]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2328])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][23] ([Intel XE#4543]) +11 other tests dmesg-fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1124])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1124]) +14 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#2191]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#2314] / [Intel XE#2894])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2314] / [Intel XE#2894])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#367]) +4 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#787]) +71 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#787]) +27 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][34] -> [INCOMPLETE][35] ([Intel XE#3862]) +1 other test incomplete
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#3432])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#2907])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#2887])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#455] / [Intel XE#787]) +47 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2325])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@kms_chamelium_color@degamma.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#306])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-466/igt@kms_chamelium_color@degamma.html
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#306])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-lnl-1/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#373]) +7 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2252])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#307]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#455]) +19 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][47] ([Intel XE#1178])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-5/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#308]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-9/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#455])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-32x32.html
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2320])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1424]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#309]) +9 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [PASS][53] -> [SKIP][54] ([Intel XE#2291]) +7 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#323])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#323])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#4356]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#4331]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#2244])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-lnl-8/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#4422])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#5425])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#701])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-433/igt@kms_feature_discovery@chamelium.html
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#701])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1135])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [PASS][65] -> [SKIP][66] ([Intel XE#2316]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1421])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-lnl-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#310]) +8 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][69] ([Intel XE#4543]) +3 other tests dmesg-warn
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][70] -> [FAIL][71] ([Intel XE#301] / [Intel XE#3149])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][72] -> [FAIL][73] ([Intel XE#301])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
    - shard-adlp:         [PASS][74] -> [DMESG-WARN][75] ([Intel XE#4543]) +1 other test dmesg-warn
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][76] -> [INCOMPLETE][77] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [PASS][78] -> [INCOMPLETE][79] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2293] / [Intel XE#2380])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1401] / [Intel XE#1745])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1401])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2293])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][84] ([Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#651]) +20 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#656]) +48 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2312])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#651]) +6 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#656]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#5390])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2311]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1151])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1158])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-9/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2313]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#653]) +14 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#653]) +7 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [PASS][97] -> [SKIP][98] ([Intel XE#1503])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-3/igt@kms_hdr@invalid-metadata-sizes.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#4298])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2934])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][101] ([Intel XE#616]) +3 other tests fail
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-466/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#4596])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#5021])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_backlight@fade:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#870]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1129])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2392])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-8/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#6070])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#836])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1406] / [Intel XE#1489])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#1406] / [Intel XE#1489]) +11 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +14 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-1/igt@kms_psr@pr-primary-blt.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#3414]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1127])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][117] -> [SKIP][118] ([Intel XE#1435])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#330])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][120] -> [FAIL][121] ([Intel XE#4459]) +1 other test fail
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][122] -> [SKIP][123] ([Intel XE#1499])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-1/igt@kms_vrr@negative-basic.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@xe_ccs@block-multicopy-compressed:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@xe_ccs@block-multicopy-compressed.html

  * igt@xe_configfs@survivability-mode:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#6010])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@xe_configfs@survivability-mode.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#1126])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#1062])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_create@create-big-vram.html

  * igt@xe_eu_stall@unprivileged-access:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#5626])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@xe_eu_stall@unprivileged-access.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#5626])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-464/igt@xe_eu_stall@unprivileged-access.html

  * igt@xe_eudebug@read-metadata:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#4837]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-lnl-1/igt@xe_eudebug@read-metadata.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#4837]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-434/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_eudebug_online@single-step:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#4837] / [Intel XE#5565]) +11 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@xe_eudebug_online@single-step.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#4837]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_evict@evict-large-cm:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#261] / [Intel XE#5564]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_evict@evict-large-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#261]) +9 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-9/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-9/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#688])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#1392] / [Intel XE#5575]) +11 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2322])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#1392])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#288] / [Intel XE#5561]) +35 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#288]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html

  * igt@xe_exec_system_allocator@process-many-execqueues-free:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#4915]) +318 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_exec_system_allocator@process-many-execqueues-free.html

  * igt@xe_exec_system_allocator@threads-many-malloc-mlock-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#4915]) +46 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-malloc-mlock-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-huge:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#4943]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-stride-mmap-huge.html
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#4943])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-lnl-1/igt@xe_exec_system_allocator@threads-many-stride-mmap-huge.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-dg2-set2:     NOTRUN -> [ABORT][147] ([Intel XE#5466])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
    - shard-adlp:         NOTRUN -> [ABORT][148] ([Intel XE#5530])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#5100])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#3573]) +8 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@xe_oa@syncs-syncobj-cfg.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#3573])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-463/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#1337])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#2838] / [Intel XE#979])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-mocs:
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#2284])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][156] -> [FAIL][157] ([Intel XE#6339]) +1 other test fail
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-lnl-8/igt@xe_pm@s4-basic.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-lnl-1/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][158] -> [FAIL][159] ([Intel XE#6339])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-8/igt@xe_pm@s4-exec-after.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_pm@s4-exec-after.html

  * igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_render0:
    - shard-adlp:         NOTRUN -> [TIMEOUT][160] ([Intel XE#5213]) +1 other test timeout
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_render0.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#4650]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-432/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          [PASS][162] -> [DMESG-WARN][163] ([Intel XE#3876])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-3/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-adlp:         NOTRUN -> [SKIP][164] ([Intel XE#4733]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@xe_pxp@display-pxp-fb.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#4733])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-434/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-adlp:         NOTRUN -> [SKIP][166] ([Intel XE#4733] / [Intel XE#5594]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#944]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-9/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-adlp:         NOTRUN -> [SKIP][168] ([Intel XE#4814] / [Intel XE#5614])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@xe_render_copy@render-stress-1-copies.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-adlp:         NOTRUN -> [SKIP][169] ([Intel XE#4821])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@xe_spin_batch@spin-mem-copy.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][170] ([Intel XE#3868] / [Intel XE#5213]) +1 other test dmesg-fail
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Possible fixes ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][171] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][173] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][174] +1 other test pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][175] ([Intel XE#2291]) -> [PASS][176] +3 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][177] ([Intel XE#5299]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][179] ([Intel XE#4354]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-bmg:          [SKIP][181] ([Intel XE#2316]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-8/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [DMESG-WARN][183] ([Intel XE#5208]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-9/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-rmfb@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][185] ([Intel XE#4543]) -> [PASS][186] +3 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-9/igt@kms_flip@flip-vs-rmfb@d-hdmi-a1.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-9/igt@kms_flip@flip-vs-rmfb@d-hdmi-a1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#455]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-dg2-466/igt@kms_hdr@invalid-hdr.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
    - shard-bmg:          [SKIP][189] ([Intel XE#1503]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-3/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][191] ([Intel XE#616]) -> [PASS][192] +1 other test pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-dg2-463/igt@kms_plane_cursor@viewport.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-432/igt@kms_plane_cursor@viewport.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][193] ([Intel XE#718]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][195], [PASS][196], [SKIP][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210]) ([Intel XE#378] / [Intel XE#5612]) -> ([PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-9/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-9/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-2/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-2/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-2/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-6/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-6/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-6/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-8/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-8/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-1/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-1/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-9/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-8/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-1/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-2/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-9/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-9/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@xe_module_load@load.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-adlp:         [DMESG-WARN][225] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][226] +2 other tests pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-1/igt@xe_pm@s3-d3hot-basic-exec.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-bmg:          [FAIL][227] ([Intel XE#6339]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-1/igt@xe_pm@s4-basic-exec.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-1/igt@xe_pm@s4-basic-exec.html
    - shard-adlp:         [FAIL][229] ([Intel XE#6339]) -> [PASS][230] +1 other test pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@xe_pm@s4-basic-exec.html
    - shard-dg2-set2:     [FAIL][231] ([Intel XE#6339]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-dg2-466/igt@xe_pm@s4-basic-exec.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-463/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [FAIL][233] ([Intel XE#6339]) -> [PASS][234] +3 other tests pass
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][235] ([Intel XE#1178]) -> [SKIP][236] ([Intel XE#2341])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-1/igt@kms_content_protection@lic-type-0.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][237] ([Intel XE#2341]) -> [FAIL][238] ([Intel XE#1178])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-6/igt@kms_content_protection@srm.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-5/igt@kms_content_protection@srm.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][239] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) -> [DMESG-WARN][240] ([Intel XE#4543])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][241] ([Intel XE#2311]) -> [SKIP][242] ([Intel XE#2312]) +14 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][243] ([Intel XE#2312]) -> [SKIP][244] ([Intel XE#2311]) +10 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][245] ([Intel XE#5390]) -> [SKIP][246] ([Intel XE#2312]) +4 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][247] ([Intel XE#2312]) -> [SKIP][248] ([Intel XE#5390]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][249] ([Intel XE#2312]) -> [SKIP][250] ([Intel XE#2313]) +7 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][251] ([Intel XE#2313]) -> [SKIP][252] ([Intel XE#2312]) +12 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][253] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][254] ([Intel XE#3544])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][255] ([Intel XE#1729]) -> [SKIP][256] ([Intel XE#2426])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#362]) -> [SKIP][258] ([Intel XE#1500])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][259] ([Intel XE#5466] / [Intel XE#5530]) -> [ABORT][260] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5574]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5574
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#5607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
  [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
  [Intel XE#5614]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5614
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5632]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5632
  [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#5890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#6010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6070
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6339
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8582 -> IGT_8583
  * Linux: xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb -> xe-pw-155937v1

  IGT_8582: 8582
  IGT_8583: 8583
  xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb: c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb
  xe-pw-155937v1: 155937v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/index.html

--===============3562077224289343993==
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
<tr><td><b>Series:</b></td><td>drm/xe: Don&#x27;t call xe_device_get_gt twi=
ce in xe_hw_engine_lookup</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/155937/">https://patchwork.freedesktop.org/series/155937/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155937v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-155937v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530=
ff2f4cb_FULL -&gt; xe-pw-155937v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-155937v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-155937v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1559=
37v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-dg2-464/igt@xe_compute_preempt@compute-=
threadgroup-preempt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_create@create-execqueues-noleak:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-2/igt@xe_crea=
te@create-execqueues-noleak.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_create@create=
-execqueues-noleak.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cancel-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-dg2-466/igt@xe_exe=
c_reset@cancel-preempt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-432/igt@xe_exec_reset@cancel=
-preempt.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-dg2-433/igt@xe_com=
pute_preempt@compute-preempt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-=
dg2-464/igt@xe_compute_preempt@compute-preempt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-8/igt@xe_comp=
ute_preempt@compute-preempt-many.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5632">Intel XE#5632</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/sh=
ard-adlp-8/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> +2 ot=
her tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-dg2-435/igt@xe_com=
pute_preempt@compute-preempt-many.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5890">Intel XE#5890</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-463=
/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> +1 other test s=
kip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_compute_preempt@compute-preempt-many-vram-evict}:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-dg2-466/igt@xe_com=
pute_preempt@compute-preempt-many-vram-evict.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5890">Intel XE#5890</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/sh=
ard-dg2-464/igt@xe_compute_preempt@compute-preempt-many-vram-evict.html">SK=
IP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155937v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@intel_hwmon@hwmon-write.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1125">Intel XE#1125</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5574">Intel XE#5574</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@kms_addfb_basic@invalid-smem=
-bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-lnl-2/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/=
shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pip=
e-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5993">Intel XE#5993</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_async_flips@crc-atomic@p=
ipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3884">Intel XE#3884</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +11 other test=
s dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-s=
tride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@kms_bw@connected-linear-tili=
ng-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</l=
i>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-3/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-bmg-8/igt@kms_bw@connected-linear-tilin=
g-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@kms_bw@linear-tiling-1-displ=
ays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-t=
iled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +71 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi=
-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotatio=
n-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2=
7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-4/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 ot=
her test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-ti=
led-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +47 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@kms_chamelium_color@degamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2325">Intel XE#2325</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-dg2-466/igt@kms_chamelium_color@degamma=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-lnl-1/igt@kms_chamelium_color@degamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@kms_chamelium_edid@hdmi-edid=
-change-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd-ena=
ble-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_content_protection@dp-ms=
t-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@kms_content_protection@legac=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-bmg-5/igt@kms_content_protection@srm@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-9/igt@kms_cursor_crc@cursor-random=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-dg2-434/igt@kms_cursor_crc@cursor-slidi=
ng-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/455">Intel XE#455</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding=
-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding=
-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_cursor_legacy@2x-flip-vs=
-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/309">Intel XE#309</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipb-toggle.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@kms_cursor_=
legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +7 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@kms_cursor_legacy@short-busy=
-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-dg2-464/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@kms_dp_link_training@uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4356">Intel XE#4356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@kms_dp_linktrain_fallback@dp=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4331">Intel XE#4331</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-lnl-8/igt@kms_dsc@dsc-with-output-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425">I=
ntel XE#5425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-dg2-433/igt@kms_feature_discovery@chame=
lium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/701">Intel XE#701</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@kms_feature_discovery@chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_feature_discovery@psr1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-dpms-on-nop.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-d=
pms-on-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-lnl-4/igt@kms_flip@2x-flip-vs-rmfb-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@kms_flip@2x-wf_vblank-ts-che=
ck-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/310">Intel XE#310</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_flip@basic-flip-vs-dpms@=
c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-lnl-8/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-lnl-8/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-2/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-1=
/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543=
">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-6/igt@kms_flip=
@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-155937v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-dg2-433/igt@kms_fl=
ip@flip-vs-suspend@d-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-435/igt@kms_flip@flip-vs-s=
uspend@d-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test=
 incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2=
380</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bp=
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
/tree/intel-xe/xe-pw-155937v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Inte=
l XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel =
XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64b=
pp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel XE#=
4921</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +20 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drr=
s-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +48 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-dg2-436/igt@kms_frontbuffer_tracking@dr=
rs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5390">Intel XE#5390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
psr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-9/igt@kms_frontbuffer_tracking@pla=
ne-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-dg2-466/igt@kms_frontbuffer_tracking@ps=
r-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-3/igt@kms_hdr@=
invalid-metadata-sizes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@kms_hdr@invalid-metada=
ta-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@kms_joiner@basic-max-non-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-bmg-7/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-dg2-466/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@kms_plane_multiple@2x-tiling=
-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_pm_backlight@fade.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
0">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_pm_dc@dc5-psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">=
Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-bmg-8/igt@kms_pm_dc@dc6-psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">I=
ntel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@kms_pm_rpm@legacy-planes.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6070">Intel XE#6070</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@kms_pm_rpm@modeset-non-lpsp-=
stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-primar=
y-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-=
move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@kms_psr2_sf@psr2-overlay-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +11 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_psr@fbc-psr2-cursor-plan=
e-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +14 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-bl=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-bmg-1/igt@kms_psr@pr-primary-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@kms_rotation_crc@primary-rot=
ation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-7/igt@kms_setm=
ode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@kms_setmode@inv=
alid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@kms_tv_load_detect@load-dete=
ct.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-lnl-2/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-155937v1/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-1/igt@kms_vrr@=
negative-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@kms_vrr@negative-basic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/149=
9">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@xe_ccs@block-multicopy-compr=
essed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/488">Intel XE#488</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5607">Intel XE#5607</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@xe_configfs@survivability-mo=
de.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6010">Intel XE#6010</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_copy_basic@mem-set-linear=
-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_create@create-big-vram.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1062">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@unprivileged-access:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@xe_eu_stall@unprivileged-acc=
ess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5626">Intel XE#5626</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-dg2-464/igt@xe_eu_stall@unprivileged-ac=
cess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-lnl-1/igt@xe_eudebug@read-metadata.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-dg2-434/igt@xe_eudebug_online@interrupt=
-other-debuggable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@xe_eudebug_online@single-ste=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5565">Intel XE#5565</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@xe_eudebug_online@stopped-thr=
ead.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_evict@evict-large-cm.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5564">Intel XE#5564</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-9/igt@xe_evict@evict-mixed-many-th=
reads-small.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/261">Intel XE#261</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-9/igt@xe_evict@evict-small-externa=
l-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommi=
t-parallel-instantfree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>) +11 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@xe_exec_fault_mode@many-exec=
queues-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +35 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-dg2-463/igt@xe_exec_fault_mode@many-exe=
cqueues-userptr-invalidate-race-imm.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-free:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_exec_system_allocator@pro=
cess-many-execqueues-free.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +318 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-mlock-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-dg2-436/igt@xe_exec_system_allocator@th=
reads-many-malloc-mlock-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +46 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-bmg-8/igt@xe_exec_system_allocator@thre=
ads-many-stride-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +2 other tests skip<=
/li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-lnl-1/igt@xe_exec_system_allocator@thre=
ads-many-stride-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-dg2-434/igt@xe_fault_injection@probe-fa=
il-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@xe_fault_injection@probe-fai=
l-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@xe_mmap@pci-membarrier-paral=
lel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5100">Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@xe_oa@syncs-syncobj-cfg.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3573">Intel XE#3573</a>) +8 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-dg2-463/igt@xe_oa@syncs-syncobj-cfg.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-dg2-434/igt@xe_pat@display-vs-wb-transi=
ent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@xe_pat@pat-index-xehpc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_pm@d3cold-mocs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">=
Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@xe_pm@s3-d3cold-basic-exec.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-lnl-8/igt@xe_pm@s4=
-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-155937v1/shard-lnl-1/igt@xe_pm@s4-basic.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6339">Intel XE#6339=
</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-8/igt@xe_pm@s=
4-exec-after.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_pm@s4-exec-after.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6339">I=
ntel XE#6339</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_render=
0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_pmu@all-fn-engine-activit=
y-load@engine-drm_xe_engine_class_render0.html">TIMEOUT</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a>) +=
1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-dg2-432/igt@xe_pmu@fn-engine-activity-l=
oad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4650">Intel XE#4650</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-3/igt@xe_pmu@f=
n-engine-activity-sched-if-idle.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@xe_pmu@fn-eng=
ine-activity-sched-if-idle.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@xe_pxp@display-pxp-fb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/47=
33">Intel XE#4733</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-dg2-434/igt@xe_pxp@display-pxp-fb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@xe_pxp@pxp-stale-bo-bind-pos=
t-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5594">Intel XE#5594</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-9/igt@xe_query@multigpu-query-gt-l=
ist.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@xe_render_copy@render-stress=
-1-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4814">Intel XE#4814</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5614">Intel XE#5614</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@xe_spin_batch@spin-mem-copy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4821">Intel XE#4821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@xe_sriov_scheduling@equal-th=
roughput.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3868">Intel XE#3868</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a>) +1 other test dme=
sg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2=
-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> +1 other=
 test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
05">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-4=
35/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">PASS</a=
> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-155937v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-trans=
itions-varying-size.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-3/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-6/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-8/igt@kms_d=
p_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-6/igt@kms_flip=
@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg=
-8/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-9/igt@kms_fli=
p@flip-vs-rmfb.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-9/igt@kms_flip@=
flip-vs-rmfb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-9/igt@kms_fli=
p@flip-vs-rmfb@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-9/i=
gt@kms_flip@flip-vs-rmfb@d-hdmi-a1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-dg2-466/igt@kms_hd=
r@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-463/igt@kms_hdr@invalid-h=
dr.html">PASS</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-5/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-3/igt@kms_hdr@invalid-hdr=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-dg2-463/igt@kms_pl=
ane_cursor@viewport.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-432/igt@kms_plane_c=
ursor@viewport.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-lnl-7/igt@kms_pm_d=
c@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-155937v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-9/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-2/=
igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-ad=
lp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/sha=
rd-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4c=
b/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530f=
f2f4cb/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e=
0530ff2f4cb/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd3=
97c9e0530ff2f4cb/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117=
a1dd397c9e0530ff2f4cb/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf2=
4b117a1dd397c9e0530ff2f4cb/shard-adlp-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f00=
13cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2=
a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-9/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921=
-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-1/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-2/igt@xe_mod=
ule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/378">Intel XE#378</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5612">Intel XE#5612</a>) -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/sh=
ard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-6/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-155937v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937=
v1/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-1/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-155937v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adl=
p-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
55937v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@xe_m=
odule_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-1/igt@xe_pm@s=
3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-ad=
lp-6/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-1/igt@xe_pm@s4=
-basic-exec.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6339">Intel XE#6339</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-1/igt@xe_pm@s4-basic-exec=
.html">PASS</a></li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-9/igt@xe_pm@s=
4-basic-exec.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6339">Intel XE#6339</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-adlp-2/igt@xe_pm@s4-basic-ex=
ec.html">PASS</a> +1 other test pass</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-dg2-466/igt@xe_pm@=
s4-basic-exec.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6339">Intel XE#6339</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-dg2-463/igt@xe_pm@s4-basic-=
exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-lnl-8/igt@xe_pm@s4=
-d3hot-basic-exec.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6339">Intel XE#6339</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-lnl-5/igt@xe_pm@s4-d3ho=
t-basic-exec.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-1/igt@kms_cont=
ent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-6/igt@kms_c=
ontent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-6/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-5/igt@kms_content_=
protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1559=
37v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#454=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/sh=
ard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312=
">Intel XE#2312</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-155937v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#=
5390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
155937v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
55937v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5390">Intel XE#5390</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel X=
E#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-155937v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155=
937v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-4/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-1/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/shard-bmg-4/igt@km=
s_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155937v1/sha=
rd-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500=
">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/shard-bmg-7/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Inte=
l XE#5530</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-155937v1/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_s=
end_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4917">Intel XE#4917</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8582 -&gt; IGT_8583</li>
<li>Linux: xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb -&gt; xe-pw-155=
937v1</li>
</ul>
<p>IGT_8582: 8582<br />
  IGT_8583: 8583<br />
  xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb: c6c2a6f0013cf24b117a1dd=
397c9e0530ff2f4cb<br />
  xe-pw-155937v1: 155937v1</p>

</body>
</html>

--===============3562077224289343993==--
