Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137F1C3ABAB
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 18:13:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A6410E517;
	Tue, 29 Apr 2025 18:13:11 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBCC10E517;
 Tue, 29 Apr 2025 18:13:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3930986852784266000=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/vrr=3A_Program_EM?=
 =?utf-8?q?P=5FAS=5FSDP=5FTL_for_DP_AS_SDP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Apr 2025 18:13:10 -0000
Message-ID: <174595039055.25010.13271489387856710067@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250429143055.130701-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250429143055.130701-1-ankit.k.nautiyal@intel.com>
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

--===============3930986852784266000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/vrr: Program EMP_AS_SDP_TL for DP AS SDP
URL   : https://patchwork.freedesktop.org/series/148422/
State : failure

== Summary ==

CI Bug Log - changes from xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039_FULL -> xe-pw-148422v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148422v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148422v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148422v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_edge_walk@256x256-right-edge:
    - shard-bmg:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-1/igt@kms_cursor_edge_walk@256x256-right-edge.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-right-edge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][3] -> [FAIL][4] +2 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  
Known issues
------------

  Here are the changes found in xe-pw-148422v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@write:
    - shard-dg2-set2:     [PASS][5] -> [SKIP][6] ([Intel XE#2134])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@fbdev@write.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@fbdev@write.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][7] -> [DMESG-WARN][8] ([Intel XE#3428]) +3 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-8/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#3768])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-435/igt@kms_async_flips@invalid-async-flip-atomic.html
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#3768])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [PASS][11] -> [FAIL][12] ([Intel XE#3908]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2370])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#316]) +6 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1124]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2327]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         [PASS][17] -> [DMESG-FAIL][18] ([Intel XE#4543]) +7 other tests dmesg-fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#1124]) +5 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1124]) +8 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#607])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#607])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2191]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#2314] / [Intel XE#2894])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#2191]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-2/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#367])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-9/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#367]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#367]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2887]) +9 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#2887]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#787]) +153 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#455] / [Intel XE#787]) +35 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#787]) +17 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][38] -> [INCOMPLETE][39] ([Intel XE#3862]) +1 other test incomplete
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#3432])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#3432])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2652] / [Intel XE#787]) +17 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#2907]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][44] -> [INCOMPLETE][45] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][46] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][47] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#4417]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#306]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2252]) +8 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#373]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#373]) +6 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#373]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-6/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2390])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#307]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [TIMEOUT][56] ([Intel XE#4862])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          NOTRUN -> [FAIL][57] ([Intel XE#1178]) +1 other test fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][58] ([Intel XE#1178]) +4 other tests fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-434/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2320]) +5 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#308]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#308])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#2321]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2321]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#455]) +11 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-434/igt@kms_cursor_crc@cursor-random-max-size.html
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1424]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-8/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          [PASS][66] -> [FAIL][67] ([Intel XE#4808])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-dg2-set2:     [PASS][68] -> [INCOMPLETE][69] ([Intel XE#3226])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2291])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          [PASS][71] -> [SKIP][72] ([Intel XE#2291]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#323])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2286])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#4302])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-2/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#2244])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-6/igt@kms_dsc@dsc-with-bpc.html
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2244])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-7/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#4422])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#4422])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#776])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1135])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#310]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][83] -> [FAIL][84] ([Intel XE#301]) +5 other tests fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][85] -> [FAIL][86] ([Intel XE#301] / [Intel XE#3321])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-bmg:          [PASS][87] -> [SKIP][88] ([Intel XE#2316]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1421]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2316]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          NOTRUN -> [FAIL][91] ([Intel XE#3321]) +4 other tests fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][92] ([Intel XE#301]) +1 other test fail
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][93] ([Intel XE#301]) +6 other tests fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][94] -> [FAIL][95] ([Intel XE#301])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][96] ([Intel XE#301] / [Intel XE#3321])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][97] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][98] -> [INCOMPLETE][99] ([Intel XE#2049] / [Intel XE#2597])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:
    - shard-bmg:          [PASS][100] -> [INCOMPLETE][101] ([Intel XE#2049])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [PASS][102] -> [DMESG-WARN][103] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-6/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-adlp:         [PASS][104] -> [FAIL][105] ([Intel XE#886]) +1 other test fail
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-4/igt@kms_flip@plain-flip-ts-check.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-3/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check@b-edp1:
    - shard-lnl:          [PASS][106] -> [FAIL][107] ([Intel XE#886]) +2 other tests fail
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@b-edp1.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1397] / [Intel XE#1745])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1397])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1401]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2293]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#455]) +7 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][115] -> [FAIL][116] ([Intel XE#1874]) +2 other tests fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#656]) +8 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#651]) +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2311]) +15 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#4141]) +9 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][121] -> [SKIP][122] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#651]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#651]) +23 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2312]) +13 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#656]) +9 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#1158])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-6/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#2350])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2313]) +16 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#653]) +29 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#653]) +4 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#346])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#4298])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [PASS][135] -> [DMESG-WARN][136] ([Intel XE#4173]) +2 other tests dmesg-warn
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-3/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
    - shard-dg2-set2:     [PASS][137] -> [SKIP][138] ([Intel XE#4208] / [i915#2575]) +15 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-433/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][139] -> [SKIP][140] ([Intel XE#4596]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#4596])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#4596])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-3/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#2493])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#2763]) +7 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2763]) +9 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#2763]) +5 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#2763]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#870]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#870]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-4/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][152] -> [FAIL][153] ([Intel XE#718])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#1129])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#1439] / [Intel XE#836])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#2893]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#4608]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#1489]) +7 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#1489]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#1489]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-8/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#1128])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#2387])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-adlp:         NOTRUN -> [SKIP][163] ([Intel XE#1122])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#1122])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#1406]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-5/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#2850] / [Intel XE#929])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-2/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#2850] / [Intel XE#929]) +13 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-435/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#2939])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#3414])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-rotation-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#4208] / [i915#2575]) +4 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#2330]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#2426])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#1499]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-3/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-adlp:         NOTRUN -> [SKIP][175] ([Intel XE#756])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-3/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#756])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][177] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#1123])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#1126])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eu_stall@invalid-gt-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#4497])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@xe_eu_stall@invalid-gt-id.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][181] ([Intel XE#4837]) +7 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-435/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@connect-user:
    - shard-adlp:         NOTRUN -> [SKIP][182] ([Intel XE#4837]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-4/igt@xe_eudebug@connect-user.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#4837]) +2 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-6/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#4837]) +10 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][185] ([Intel XE#1392]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][186] ([Intel XE#1392]) +2 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-9/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
    - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#2322]) +6 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][188] -> [SKIP][189] ([Intel XE#1392]) +8 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-435/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][190] ([Intel XE#1392])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][191] ([Intel XE#288]) +15 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][192] ([Intel XE#288]) +4 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-9/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#2360]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-adlp:         [PASS][194] -> [DMESG-WARN][195] ([Intel XE#3868])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-2/igt@xe_exec_reset@cm-close-fd.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html

  * igt@xe_exec_system_allocator@many-new-race-nomemset:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][196] ([Intel XE#3428])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@xe_exec_system_allocator@many-new-race-nomemset.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [FAIL][197] ([Intel XE#4914]) +16 other tests fail
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge:
    - shard-lnl:          NOTRUN -> [FAIL][198] ([Intel XE#4914])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][199] ([Intel XE#4915]) +46 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][200] ([Intel XE#4915]) +157 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][201] ([Intel XE#255])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@xe_huc_copy@huc_copy.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][202] ([Intel XE#2459] / [Intel XE#2596])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-3/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@create-destroy-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][203] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-1/igt@xe_oa@create-destroy-userspace-config.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][204] ([Intel XE#2541] / [Intel XE#3573]) +6 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@syncs-userptr-wait:
    - shard-dg2-set2:     NOTRUN -> [SKIP][205] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@xe_oa@syncs-userptr-wait.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][206] ([Intel XE#1948])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-5/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][207] ([Intel XE#4208]) +23 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         NOTRUN -> [ABORT][208] ([Intel XE#1794])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][209] -> [ABORT][210] ([Intel XE#1794])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][211] ([Intel XE#579])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][212] ([Intel XE#4733])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][213] ([Intel XE#4733]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-lnl:          NOTRUN -> [SKIP][214] ([Intel XE#944])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-4/igt@xe_query@multigpu-query-pxp-status.html
    - shard-bmg:          NOTRUN -> [SKIP][215] ([Intel XE#944]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_render_copy@render-stress-0-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][216] ([Intel XE#4814])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@xe_render_copy@render-stress-0-copies.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][217] ([Intel XE#4130])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-435/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][218] ([Intel XE#3342])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     NOTRUN -> [SKIP][219] ([Intel XE#4351])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-dg2-set2:     [PASS][220] -> [SKIP][221] ([Intel XE#4208]) +30 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-466/igt@xe_vm@large-split-binds-536870912.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@xe_vm@large-split-binds-536870912.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [FAIL][222] ([Intel XE#911]) -> [PASS][223] +3 other tests pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][224] ([Intel XE#3908]) -> [PASS][225] +1 other test pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][226] ([Intel XE#4543]) -> [PASS][227] +9 other tests pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][228] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][230] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][232] ([Intel XE#2291]) -> [PASS][233] +1 other test pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][234] ([Intel XE#1475]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][236] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][238] ([Intel XE#301]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [SKIP][240] ([Intel XE#2316]) -> [PASS][241] +5 other tests pass
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-4/igt@kms_flip@2x-plain-flip.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [FAIL][242] ([Intel XE#2882]) -> [PASS][243] +7 other tests pass
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][244] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][245] +1 other test pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][246] ([Intel XE#1874]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [SKIP][248] ([Intel XE#1503]) -> [PASS][249] +1 other test pass
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-2/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][250] ([Intel XE#3012]) -> [PASS][251]
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-adlp:         [DMESG-WARN][252] ([Intel XE#4173]) -> [PASS][253] +2 other tests pass
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-1/igt@kms_pm_rpm@basic-rte.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-4/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [SKIP][254] ([Intel XE#4692]) -> [PASS][255]
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-lnl-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_vblank@wait-idle@pipe-d-dp-2:
    - shard-bmg:          [FAIL][256] ([Intel XE#4892]) -> [PASS][257]
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-6/igt@kms_vblank@wait-idle@pipe-d-dp-2.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@kms_vblank@wait-idle@pipe-d-dp-2.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#1392]) -> [PASS][259] +5 other tests pass
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_system_allocator@many-large-execqueues-new-race:
    - shard-bmg:          [DMESG-WARN][260] ([Intel XE#3428]) -> [PASS][261] +5 other tests pass
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-6/igt@xe_exec_system_allocator@many-large-execqueues-new-race.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-3/igt@xe_exec_system_allocator@many-large-execqueues-new-race.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-bmg:          [ABORT][262] -> [PASS][263]
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-adlp:         [FAIL][264] ([Intel XE#1999]) -> [PASS][265] +2 other tests pass
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-8/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-9/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
    - shard-dg2-set2:     [FAIL][266] ([Intel XE#1999]) -> [PASS][267] +2 other tests pass
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-435/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][268] ([Intel XE#1794]) -> [PASS][269]
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-8/igt@xe_pm@s4-basic-exec.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-lnl:          [FAIL][270] -> [PASS][271]
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-lnl-3/igt@xe_render_copy@render-stress-4-copies.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-3/igt@xe_render_copy@render-stress-4-copies.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         [FAIL][272] ([Intel XE#1874]) -> [DMESG-FAIL][273] ([Intel XE#4543])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#1124]) -> [SKIP][275] ([Intel XE#4208]) +2 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#2191]) -> [SKIP][277] ([Intel XE#4208] / [i915#2575])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][279] ([Intel XE#4208])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][281] ([Intel XE#2351] / [Intel XE#4208])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][282] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [INCOMPLETE][283] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][284] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [INCOMPLETE][285] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#306]) -> [SKIP][287] ([Intel XE#4208] / [i915#2575])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-466/igt@kms_chamelium_color@ctm-blue-to-red.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#373]) -> [SKIP][289] ([Intel XE#4208] / [i915#2575])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][290] ([Intel XE#2341]) -> [TIMEOUT][291] ([Intel XE#4862])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-5/igt@kms_content_protection@lic-type-0.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][292] ([Intel XE#1188]) -> [SKIP][293] ([Intel XE#2341])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-2/igt@kms_content_protection@uevent.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][294] ([Intel XE#3321]) -> [SKIP][295] ([Intel XE#2316])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#651]) -> [SKIP][297] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][298] ([Intel XE#2312]) -> [SKIP][299] ([Intel XE#2311]) +14 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][300] ([Intel XE#2312]) -> [SKIP][301] ([Intel XE#4141]) +3 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][302] ([Intel XE#4141]) -> [SKIP][303] ([Intel XE#2312]) +10 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][304] ([Intel XE#2311]) -> [SKIP][305] ([Intel XE#2312]) +15 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#651]) -> [SKIP][307] ([Intel XE#4208]) +2 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][308] ([Intel XE#2313]) -> [SKIP][309] ([Intel XE#2312]) +16 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][310] ([Intel XE#2312]) -> [SKIP][311] ([Intel XE#2313]) +12 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#653]) -> [SKIP][313] ([Intel XE#2351] / [Intel XE#4208])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#653]) -> [SKIP][315] ([Intel XE#4208]) +2 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#455]) -> [SKIP][317] ([Intel XE#4208] / [i915#2575]) +3 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@kms_hdr@invalid-hdr.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [ABORT][318] ([Intel XE#4760]) -> [SKIP][319] ([Intel XE#4208] / [i915#2575])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#1489]) -> [SKIP][321] ([Intel XE#4208]) +2 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@pr-cursor-render:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][323] ([Intel XE#4208])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@kms_psr@pr-cursor-render.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_psr@pr-cursor-render.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#3414]) -> [SKIP][325] ([Intel XE#4208] / [i915#2575])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-format.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_vblank@wait-idle:
    - shard-bmg:          [FAIL][326] ([Intel XE#4892]) -> [DMESG-WARN][327] ([Intel XE#3428])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-6/igt@kms_vblank@wait-idle.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@kms_vblank@wait-idle.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#288]) -> [SKIP][329] ([Intel XE#4208]) +5 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#4837]) -> [SKIP][331] ([Intel XE#4208]) +2 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-466/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge-nomemset:
    - shard-bmg:          [DMESG-FAIL][332] ([Intel XE#3428]) -> [FAIL][333] ([Intel XE#4914])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-6/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge-nomemset.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-1/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race-nomemset:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#4915]) -> [SKIP][335] ([Intel XE#4208]) +26 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race-nomemset.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race-nomemset.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][336], [PASS][337], [PASS][338], [PASS][339], [DMESG-WARN][340], [DMESG-WARN][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349], [PASS][350], [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [SKIP][359], [PASS][360], [PASS][361]) ([Intel XE#2457] / [Intel XE#3428]) -> ([PASS][362], [PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374], [PASS][375], [PASS][376], [PASS][377], [PASS][378], [SKIP][379], [PASS][380], [PASS][381], [PASS][382], [PASS][383], [PASS][384], [PASS][385], [PASS][386], [PASS][387]) ([Intel XE#2457])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-2/igt@xe_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-2/igt@xe_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-2/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-6/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-6/igt@xe_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-6/igt@xe_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-6/igt@xe_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-3/igt@xe_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-3/igt@xe_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-3/igt@xe_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-7/igt@xe_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-7/igt@xe_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-7/igt@xe_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-1/igt@xe_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-1/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-1/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-8/igt@xe_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-8/igt@xe_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-8/igt@xe_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-5/igt@xe_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-4/igt@xe_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-4/igt@xe_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-4/igt@xe_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-4/igt@xe_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-5/igt@xe_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-5/igt@xe_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-3/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@xe_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-7/igt@xe_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@xe_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@xe_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-7/igt@xe_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-7/igt@xe_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@xe_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-1/igt@xe_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-2/igt@xe_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-2/igt@xe_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@xe_module_load@load.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@xe_module_load@load.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@xe_module_load@load.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@xe_module_load@load.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-4/igt@xe_module_load@load.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-4/igt@xe_module_load@load.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-2/igt@xe_module_load@load.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-2/igt@xe_module_load@load.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@xe_module_load@load.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-1/igt@xe_module_load@load.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-4/igt@xe_module_load@load.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-4/igt@xe_module_load@load.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-3/igt@xe_module_load@load.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-3/igt@xe_module_load@load.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][389] ([Intel XE#4208])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-435/igt@xe_oa@syncs-syncobj-wait-cfg.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-dg2-set2:     [SKIP][390] ([Intel XE#4650]) -> [SKIP][391] ([Intel XE#4208])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-432/igt@xe_pmu@all-fn-engine-activity-load.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#944]) -> [SKIP][393] ([Intel XE#4208])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#4130]) -> [SKIP][395] ([Intel XE#4208])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-434/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
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
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4808
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4862
  [Intel XE#4892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4892
  [Intel XE#4914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4914
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8342 -> IGT_8343
  * Linux: xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039 -> xe-pw-148422v1

  IGT_8342: 8342
  IGT_8343: 882124078d617b631891f40f54e3f41b0334f142 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039: 5752a8bfd947553d8006307e10d1bd5abdfc8039
  xe-pw-148422v1: 148422v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/index.html

--===============3930986852784266000==
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
<tr><td><b>Series:</b></td><td>drm/i915/vrr: Program EMP_AS_SDP_TL for DP A=
S SDP</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/148422/">https://patchwork.freedesktop.org/series/148422/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148422v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148422v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3005-5752a8bfd947553d8006307e10d1bd5ab=
dfc8039_FULL -&gt; xe-pw-148422v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148422v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-148422v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1484=
22v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-1/igt@kms_curs=
or_edge_walk@256x256-right-edge.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@kms_cursor_ed=
ge_walk@256x256-right-edge.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-lnl-2/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-148422v1/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-=
many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> +2 other tests fai=
l</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148422v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@fbdev@=
write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148422v1/shard-dg2-464/igt@fbdev@write.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-8/igt@kms_asyn=
c_flips@crc@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@kms_async_flips@c=
rc@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) +3 other tests dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-435/igt@kms_async_flips@invalid-asy=
nc-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3768">Intel XE#3768</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_async_flips@invalid-async=
-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-9/igt@kms_ato=
mic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adl=
p-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908=
">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/316">Intel XE#316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-3/igt@kms_big_fb@4-tiled-max-hw-st=
ride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-3/igt@kms_big=
_fb@x-tiled-8bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-6/igt@kms_big_fb@x-tiled=
-8bpp-rotate-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +7 other tests dmesg-fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-addfb-si=
ze-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-6/igt@kms_bw@connected-linear-tilin=
g-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/ig=
t@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@kms_bw@connected-linear-tilin=
g-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other=
 test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-2/igt@kms_bw@connected-linear-tili=
ng-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-9/igt@kms_bw@linear-tiling-1-displ=
ays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-1/igt@kms_bw@linear-tiling-4-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@kms_bw@linear-tiling-4-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-4/igt@kms_ccs@bad-aux-stride-4-til=
ed-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests ski=
p</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-4-t=
iled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4=
-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +153 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation=
-180-y-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-2/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 ot=
her test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg=
2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212"=
>Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Int=
el XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-434/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_chamelium_color@gamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-sto=
rm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/373">Intel XE#373</a>) +6 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-6/igt@kms_chamelium_hpd@vga-hpd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-7/igt@kms_content_protection@dp-mst=
-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-436/igt@kms_content_protection@dp-m=
st-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4862">Intel XE#4862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_content_protection@srm.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-434/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscre=
en-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offsc=
reen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-8/igt@kms_cursor_crc@cursor-offscr=
een-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-6/igt@kms_cursor_crc@cursor-onscree=
n-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-4/igt@kms_cursor_crc@cursor-onscree=
n-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-434/igt@kms_cursor_crc@cursor-rando=
m-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-8/igt@kms_cursor_crc@cursor-random-=
max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-6/igt@kms_curs=
or_legacy@2x-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@kms_cursor=
_legacy@2x-cursor-vs-flip-atomic.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4808">Intel XE#4808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursor-vs-flip-varying-size.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@kms=
_cursor_legacy@cursor-vs-flip-varying-size.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-7/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@kms_cursor_=
legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-2/igt@kms_display_modes@extended-mo=
de-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-6/igt@kms_dsc@dsc-with-bpc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244=
">Intel XE#2244</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-7/igt@kms_dsc@dsc-with-bpc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244=
">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirt=
y-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@kms_feature_discovery@psr2.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-dpms-on-=
nop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/sha=
rd-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/sha=
rd-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-panning-vs-hang.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@kms_flip@2x-flip-=
vs-panning-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-8/igt@kms_flip@2x-flip-vs-panning-v=
s-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-chec=
k-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vbla=
nk-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3321">Intel XE#3321</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vbla=
nk-interruptible@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible@d-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-5/igt@kms_flip@flip-=
vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vb=
lank@c-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-8/igt@kms_flip=
@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-7/igt@kms_flip@flip-=
vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-8/igt@kms_flip=
@flip-vs-suspend-interruptible@d-hdmi-a3.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-7/igt@kms_=
flip@flip-vs-suspend-interruptible@d-hdmi-a3.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend@d-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-6/igt@kms_flip@flip-vs=
-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 othe=
r test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-4/igt@kms_fli=
p@plain-flip-ts-check.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-3/igt@kms_flip@plain-flip-ts=
-check.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-lnl-1/igt@kms_flip=
@plain-flip-ts-check@b-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-1/igt@kms_flip@plain-fl=
ip-ts-check@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bp=
p-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bp=
p-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1=
401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp=
-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs=
-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs=
-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +9 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">In=
tel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other tes=
t skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/651">Intel XE#651</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +13 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc=
psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-6/igt@kms_frontbuffer_tracking@pla=
ne-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1158">Intel XE#1158</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-3/igt@kms_frontbuffer_tracking@plan=
e-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +16 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +29 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-3/igt@kms_frontbuffer_tracking@psr=
-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@kms_joiner@basic-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@kms_joiner@basic-max-non-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-3/igt@kms_pla=
ne@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-2/igt@kms_pl=
ane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +=
2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-433/igt@kms_pl=
ane_alpha_blend@coverage-vs-premult-vs-constant.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464=
/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-7/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@kms_plane_multiple@2x-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-=
4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-3/igt@kms_plane_multiple@2x-tiling=
-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@kms_plane_scaling@plane-dow=
nscale-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-8/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +=
9 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-434/igt@kms_plane_scaling@planes-up=
scale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)=
 +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-c:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-3/igt@kms_plane_scaling@planes-ups=
cale-factor-0-25-downscale-factor-0-25@pipe-c.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-3/igt@kms_plane_scaling@planes-ups=
cale-factor-0-25-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@kms_pm_backlight@bad-bright=
ness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-4/igt@kms_pm_backlight@fade.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870=
">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-lnl-4/igt@kms_pm_d=
c@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-148422v1/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel =
XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"=
>Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-7/igt@kms_pm_rpm@dpms-mode-unset-no=
n-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-plane-move=
-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-e=
dp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-primar=
y-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-=
move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-8/igt@kms_psr2_sf@pr-overlay-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-3/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1128">Intel XE#1128</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2387">Intel XE#2387</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-1/igt@kms_psr2_su@frontbuffer-xrgb=
8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1122">Intel XE#1122</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrg=
b8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-5/igt@kms_psr@fbc-pr-cursor-plane-m=
ove.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_psr@fbc-psr2-cursor-plane=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-2/igt@kms_psr@pr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-435/igt@kms_psr@pr-sprite-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/929">Intel XE#929</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@kms_psr_stress_test@invalid=
ate-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_rotation_crc@bad-tiling=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_rotation_crc@primary-ro=
tation-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-2/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2330">Intel XE#2330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-3/igt@kms_vrr@max-min.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-3/igt@kms_writeback@writeback-fb-i=
d-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@kms_writeback@writeback-inv=
alid-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@xe_compute_preempt@compute-=
preempt-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@xe_copy_basic@mem-copy-line=
ar-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linea=
r-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-gt-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@xe_eu_stall@invalid-gt-id.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-435/igt@xe_eudebug@basic-close.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@connect-user:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-4/igt@xe_eudebug@connect-user.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-6/igt@xe_eudebug_online@interrupt-o=
ther.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@xe_eudebug_online@stopped-thr=
ead.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4837">Intel XE#4837</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-9/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other test=
s skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +6 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-435/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/s=
hard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalida=
te-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1392">Intel XE#1392</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once=
-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bin=
dexecqueue-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-9/igt@xe_exec_fault_mode@once-bind=
execqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@xe_exec_mix_modes@exec-simp=
le-batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-2/igt@xe_exec=
_reset@cm-close-fd.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148422v1/shard-adlp-3/igt@xe_exec_reset@cm-close-fd=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-race-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@xe_exec_system_allocator@many=
-new-race-nomemset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@xe_exec_system_allocator@proc=
ess-many-execqueues-mmap-free-huge.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4914">Intel XE#4914</a>) +16 other t=
ests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-2/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-execqueues-mmap-huge.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4914">Intel XE#4914</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race-=
nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-2/igt@xe_exec_system_allocator@thr=
eads-shared-vm-many-large-mmap-new-race-nomemset.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a=
>) +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-436/igt@xe_exec_system_allocator@th=
reads-shared-vm-many-mmap-shared-nomemset.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +157=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@xe_huc_copy@huc_copy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
5">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-3/igt@xe_media_fill@media-fill.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2459">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-1/igt@xe_oa@create-destroy-userspa=
ce-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-str=
eam-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +6 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@xe_oa@syncs-userptr-wait.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-5/igt@xe_pm@d3hot-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/194=
8">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@xe_pm@s3-basic-exec.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/420=
8">Intel XE#4208</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">In=
tel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-2/igt@xe_pm@s=
4-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148422v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-bind-post=
-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-po=
st-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-lnl-4/igt@xe_query@multigpu-query-pxp-s=
tatus.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@xe_query@multigpu-query-pxp-s=
tatus.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-0-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-433/igt@xe_render_copy@render-stres=
s-0-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-435/igt@xe_sriov_auto_provisioning@=
resources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@xe_sriov_flr@flr-each-isola=
tion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148422v1/shard-dg2-432/igt@xe_sriov_scheduling@nonpree=
mpt-engine-resets.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-466/igt@xe_vm@=
large-split-binds-536870912.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@xe_vm@large-spl=
it-binds-536870912.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +30 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-lnl-2/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel=
 XE#911</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148422v1/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-event=
s-linear@pipe-c-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-2/igt@kms_ato=
mic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel=
 XE#3908</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148422v1/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-trans=
ition@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-8/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel=
 XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148422v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-436/igt@kms_ccs@random=
-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
05">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-4=
35/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-4/igt@kms_curs=
or_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-b=
mg-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-7/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-2/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148422v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank=
-interruptible@ab-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148422v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@ac-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-4/igt@kms_flip=
@2x-plain-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@kms_flip@2x-plai=
n-flip.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-=
bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> +=
7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Int=
el XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-148422v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hd=
mi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1484=
22v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-=
to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-4/igt@kms_hdr@=
static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-2/igt@kms_hdr@s=
tatic-toggle-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-5/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8=
/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-1/igt@kms_pm_=
rpm@basic-rte.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-4/igt@kms_pm_rpm=
@basic-rte.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-lnl-1/igt@kms_psr_=
stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4692">Intel XE#4692</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/sha=
rd-lnl-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-6/igt@kms_vbla=
nk@wait-idle@pipe-d-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4892">Intel XE#4892</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@kms_vb=
lank@wait-idle@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-=
dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> +=
5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-6/igt@xe_exec_=
system_allocator@many-large-execqueues-new-race.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#34=
28</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8422v1/shard-bmg-3/igt@xe_exec_system_allocator@many-large-execqueues-new-r=
ace.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-6/igt@xe_fault=
_injection@vm-bind-fail-xe_pt_update_ops_run.html">ABORT</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-2/ig=
t@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-8/igt@xe_live=
_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-=
adlp-9/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> +=
2 other tests pass</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-435/igt@xe_liv=
e_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard=
-dg2-464/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a>=
 +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-9/igt@xe_pm@s=
4-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-adlp-8/igt@xe_pm@s4-basic-e=
xec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-lnl-3/igt@xe_rende=
r_copy@render-stress-4-copies.html">FAIL</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-lnl-3/igt@xe_render_copy@=
render-stress-4-copies.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-adlp-9/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-=
adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">DMESG-FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">=
Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-434/igt@kms_bi=
g_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@k=
ms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-435/igt@kms_bw=
@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/=
shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-434/igt@kms_cc=
s@bad-rotation-90-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/=
shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-432/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422=
v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-434/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel X=
E#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148422v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522"=
>Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-466/igt@kms_ch=
amelium_color@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@k=
ms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-433/igt@kms_ch=
amelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/sha=
rd-dg2-464/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-5/igt@kms_cont=
ent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@kms_c=
ontent_protection@lic-type-0.html">TIMEOUT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4862">Intel XE#4862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-2/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-4/igt@kms_conte=
nt_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-4/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422=
v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148422v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148422v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v=
1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148422v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-=
dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48422v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48422v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1484=
22v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indf=
b-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422=
v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@kms_hd=
r@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@kms_hdr@invalid-h=
dr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-433/igt@kms_pl=
ane_scaling@intel-max-src-size.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/=
igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-434/igt@kms_ps=
r2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel=
 XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148422v1/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-conti=
nuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@kms_ps=
r@pr-cursor-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/=
igt@kms_psr@pr-cursor-render.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-433/igt@kms_ro=
tation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@k=
ms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-6/igt@kms_vbla=
nk@wait-idle.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4892">Intel XE#4892</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-6/igt@kms_vblank@wait-id=
le.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-433/igt@xe_exe=
c_fault_mode@many-execqueues-userptr-invalidate-imm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422=
v1/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-=
imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@wait-writesip-nodebug:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-466/igt@xe_exe=
c_sip_eudebug@wait-writesip-nodebug.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-4=
64/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge-nome=
mset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-6/igt@xe_exec_=
system_allocator@process-many-execqueues-mmap-free-huge-nomemset.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3428">Intel XE#3428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-148422v1/shard-bmg-1/igt@xe_exec_system_allocator@process-ma=
ny-execqueues-mmap-free-huge-nomemset.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4914">Intel XE#4914</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-new-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-464/igt@xe_exe=
c_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race-no=
memset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4915">Intel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@xe_exec_system_allocat=
or@threads-shared-vm-many-large-execqueues-mmap-new-race-nomemset.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-b=
mg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc80=
39/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1=
bd5abdfc8039/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e=
10d1bd5abdfc8039/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006=
307e10d1bd5abdfc8039/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d=
8006307e10d1bd5abdfc8039/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947=
553d8006307e10d1bd5abdfc8039/shard-bmg-7/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bf=
d947553d8006307e10d1bd5abdfc8039/shard-bmg-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752=
a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-=
5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-=
bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/sh=
ard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc803=
9/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5abdf=
c8039/shard-bmg-4/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d1bd5=
abdfc8039/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-3005-5752a8bfd947553d8006307e10d=
1bd5abdfc8039/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428"=
>Intel XE#3428</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148422v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1484=
22v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148422v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-7/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1484=
22v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-1/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148422v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-8/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1484=
22v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-5/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148422v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-4/igt@xe_module_load@load.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1484=
22v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-2/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148422v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1484=
22v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-bmg-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148422v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE=
#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-435/igt@xe_oa@=
syncs-syncobj-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1484=
22v1/shard-dg2-464/igt@xe_oa@syncs-syncobj-wait-cfg.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-432/igt@xe_pmu=
@all-fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464/igt@=
xe_pmu@all-fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-432/igt@xe_que=
ry@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2-464=
/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039/shard-dg2-434/igt@xe_sri=
ov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148422v1/shard-dg2=
-464/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8342 -&gt; IGT_8343</li>
<li>Linux: xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039 -&gt; xe-pw-148=
422v1</li>
</ul>
<p>IGT_8342: 8342<br />
  IGT_8343: 882124078d617b631891f40f54e3f41b0334f142 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-3005-5752a8bfd947553d8006307e10d1bd5abdfc8039: 5752a8bfd947553d8006307=
e10d1bd5abdfc8039<br />
  xe-pw-148422v1: 148422v1</p>

</body>
</html>

--===============3930986852784266000==--
