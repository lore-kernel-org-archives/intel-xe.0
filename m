Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F06CC282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 13:57:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1011210E1E1;
	Tue, 11 Mar 2025 13:57:15 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CF910E1E1;
 Tue, 11 Mar 2025 13:57:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3939413127954982780=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIGRybS94ZS94ZV92bTogSW1wbGVt?=
 =?utf-8?b?ZW50IHhlX3ZtX2dldF9mYXVsdHNfaW9jdGwgKHJldjIp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Mar 2025 13:57:14 -0000
Message-ID: <174170143400.18880.10460851008623162909@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250310171834.78299-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250310171834.78299-1-jonathan.cavitt@intel.com>
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

--===============3939413127954982780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl (rev2)
URL   : https://patchwork.freedesktop.org/series/146024/
State : failure

== Summary ==

CI Bug Log - changes from xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c_full -> xe-pw-146024v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-146024v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-146024v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-146024v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@xe_exec_fault_mode@invalid-va:
    - shard-bmg:          [PASS][4] -> [ABORT][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-7/igt@xe_exec_fault_mode@invalid-va.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@xe_exec_fault_mode@invalid-va.html
    - shard-lnl:          [PASS][6] -> ([ABORT][7], [ABORT][8])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-lnl-7/igt@xe_exec_fault_mode@invalid-va.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-7/igt@xe_exec_fault_mode@invalid-va.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-8/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_oa@buffer-size:
    - shard-lnl:          [PASS][9] -> ([PASS][10], [FAIL][11])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-lnl-7/igt@xe_oa@buffer-size.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-7/igt@xe_oa@buffer-size.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-1/igt@xe_oa@buffer-size.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [FAIL][12] -> ([DMESG-FAIL][13], [FAIL][14]) ([Intel XE#4330])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_oa@buffer-size@rcs-0-256k}:
    - shard-lnl:          NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-1/igt@xe_oa@buffer-size@rcs-0-256k.html

  
Known issues
------------

  Here are the changes found in xe-pw-146024v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-adlp:         NOTRUN -> ([ABORT][16], [ABORT][17]) ([Intel XE#3914])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@core_hotunplug@hotunplug-rescan.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#873])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2370])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> ([SKIP][20], [SKIP][21]) ([Intel XE#2327]) +4 other tests ( 2 skip )
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2327])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#316])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> ([SKIP][24], [SKIP][25]) ([Intel XE#316])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> ([SKIP][26], [SKIP][27]) ([Intel XE#2328])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> ([SKIP][28], [SKIP][29]) ([Intel XE#610])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1124]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#1124]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> ([SKIP][32], [SKIP][33]) ([Intel XE#1124]) +4 other tests ( 2 skip )
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#619])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#2314] / [Intel XE#2894])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
    - shard-dg2-set2:     [PASS][37] -> ([PASS][38], [SKIP][39]) ([Intel XE#2191])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2314] / [Intel XE#2894])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> ([SKIP][41], [SKIP][42]) ([Intel XE#2314] / [Intel XE#2894]) +1 other test ( 2 skip )
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> ([SKIP][43], [SKIP][44]) ([Intel XE#367])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> ([SKIP][45], [SKIP][46]) ([Intel XE#367])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#455] / [Intel XE#787]) +18 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][49], [SKIP][50]) ([Intel XE#455] / [Intel XE#787]) +9 other tests ( 2 skip )
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][51], [SKIP][52]) ([Intel XE#3432]) +1 other test ( 2 skip )
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#3432])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> ([SKIP][54], [SKIP][55]) ([Intel XE#455] / [Intel XE#787]) +3 other tests ( 2 skip )
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> ([SKIP][56], [SKIP][57]) ([Intel XE#787]) +5 other tests ( 2 skip )
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#787]) +99 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][59], [SKIP][60]) ([Intel XE#787]) +29 other tests ( 2 skip )
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-dp-4.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][61] -> ([PASS][62], [INCOMPLETE][63]) ([Intel XE#2705])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> ([SKIP][64], [SKIP][65]) ([Intel XE#2887]) +9 other tests ( 2 skip )
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][66] -> [INCOMPLETE][67] ([Intel XE#3124])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][68] -> [DMESG-WARN][69] ([Intel XE#1727] / [Intel XE#3113])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> ([SKIP][70], [SKIP][71]) ([Intel XE#2325]) +1 other test ( 2 skip )
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#306])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-adlp:         NOTRUN -> ([SKIP][73], [SKIP][74]) ([Intel XE#373]) +1 other test ( 2 skip )
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_chamelium_edid@dp-mode-timings.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#373]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2252])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-bmg:          NOTRUN -> ([SKIP][77], [SKIP][78]) ([Intel XE#2252]) +5 other tests ( 2 skip )
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_chamelium_frames@hdmi-frame-dump.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][79] ([Intel XE#1178]) +1 other test fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> ([FAIL][80], [SKIP][81]) ([Intel XE#1178] / [Intel XE#2341]) +1 other test ( 1 fail, 1 skip )
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_content_protection@legacy.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> ([SKIP][82], [SKIP][83]) ([Intel XE#2341])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_content_protection@lic-type-1.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-bmg:          NOTRUN -> ([SKIP][84], [SKIP][85]) ([Intel XE#2320]) +2 other tests ( 2 skip )
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-max-size.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> ([SKIP][86], [SKIP][87]) ([Intel XE#2321]) +2 other tests ( 2 skip )
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][88] -> ([DMESG-WARN][89], [PASS][90]) ([Intel XE#4173]) +4 other tests ( 1 dmesg-warn, 1 pass )
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [PASS][91] -> ([SKIP][92], [PASS][93]) ([Intel XE#309]) +3 other tests ( 1 pass, 1 skip )
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
    - shard-bmg:          [PASS][94] -> [SKIP][95] ([Intel XE#2291])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-bmg:          NOTRUN -> ([SKIP][96], [SKIP][97]) ([Intel XE#2286])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-legacy:
    - shard-dg2-set2:     [PASS][98] -> [INCOMPLETE][99] ([Intel XE#3226])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> ([SKIP][100], [PASS][101]) ([Intel XE#2291]) +4 other tests ( 1 pass, 1 skip )
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [PASS][102] -> ([PASS][103], [SKIP][104]) ([Intel XE#2291]) +1 other test ( 1 pass, 1 skip )
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> ([SKIP][105], [SKIP][106]) ([Intel XE#309])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          NOTRUN -> ([SKIP][107], [PASS][108]) ([Intel XE#3009])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_dp_aux_dev.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-adlp:         NOTRUN -> ([SKIP][109], [SKIP][110]) ([Intel XE#4354])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_dp_link_training@non-uhbr-sst.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_dp_link_training@non-uhbr-sst.html
    - shard-dg2-set2:     [PASS][111] -> ([SKIP][112], [PASS][113]) ([Intel XE#4354])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-sst.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-435/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> ([SKIP][114], [SKIP][115]) ([Intel XE#4331])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          NOTRUN -> ([SKIP][116], [SKIP][117]) ([Intel XE#2244])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_dsc@dsc-with-bpc.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][118] -> [FAIL][119] ([Intel XE#3321]) +1 other test fail
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][120] -> ([PASS][121], [FAIL][122]) ([Intel XE#301]) +2 other tests ( 1 fail, 1 pass )
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][123] -> [FAIL][124] ([Intel XE#301]) +1 other test fail
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][125] ([Intel XE#3321]) +1 other test fail
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-bmg:          NOTRUN -> ([SKIP][126], [INCOMPLETE][127]) ([Intel XE#2049] / [Intel XE#2316])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][128] ([Intel XE#2049])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][129] -> ([INCOMPLETE][130], [PASS][131]) ([Intel XE#2049] / [Intel XE#2597]) +1 other test ( 1 incomplete, 1 pass )
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][132] -> ([SKIP][133], [PASS][134]) ([Intel XE#2316]) +2 other tests ( 1 pass, 1 skip )
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-2/igt@kms_flip@2x-plain-flip.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_flip@2x-plain-flip.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-dg2-set2:     [PASS][135] -> ([PASS][136], [SKIP][137]) ([Intel XE#310]) +3 other tests ( 1 pass, 1 skip )
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-435/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          NOTRUN -> ([PASS][138], [SKIP][139]) ([Intel XE#2316]) +2 other tests ( 1 pass, 1 skip )
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_flip@2x-plain-flip-interruptible.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#310])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][141] -> [SKIP][142] ([Intel XE#2316]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][143] ([Intel XE#301]) +4 other tests fail
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][144], [PASS][145]) ([Intel XE#301])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][146] -> ([FAIL][147], [PASS][148]) ([Intel XE#2882])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [PASS][149] -> [FAIL][150] ([Intel XE#886]) +1 other test fail
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3:
    - shard-bmg:          [PASS][151] -> [FAIL][152] ([Intel XE#2882])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#2293]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#455]) +3 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> ([SKIP][155], [SKIP][156]) ([Intel XE#2293] / [Intel XE#2380]) +1 other test ( 2 skip )
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> ([SKIP][157], [SKIP][158]) ([Intel XE#2293]) +1 other test ( 2 skip )
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#651]) +5 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][161], [SKIP][162]) ([Intel XE#2311] / [Intel XE#2312]) +10 other tests ( 2 skip )
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> ([SKIP][163], [SKIP][164]) ([Intel XE#656]) +1 other test ( 2 skip )
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-adlp:         NOTRUN -> ([SKIP][165], [SKIP][166]) ([Intel XE#651])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [PASS][167] -> ([SKIP][168], [PASS][169]) ([Intel XE#656]) +6 other tests ( 1 pass, 1 skip )
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> ([SKIP][170], [SKIP][171]) ([Intel XE#2312] / [Intel XE#4141]) +3 other tests ( 2 skip )
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#2312]) +7 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          NOTRUN -> ([SKIP][173], [SKIP][174]) ([Intel XE#4141]) +5 other tests ( 2 skip )
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#2311])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> ([SKIP][176], [SKIP][177]) ([Intel XE#2311]) +8 other tests ( 2 skip )
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-adlp:         NOTRUN -> ([SKIP][178], [SKIP][179]) ([Intel XE#653]) +1 other test ( 2 skip )
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][180], [SKIP][181]) ([Intel XE#2313]) +6 other tests ( 2 skip )
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][182] ([Intel XE#656]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][183], [SKIP][184]) ([Intel XE#2312] / [Intel XE#2313]) +8 other tests ( 2 skip )
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][185] ([Intel XE#2313]) +4 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][186] ([Intel XE#653]) +5 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_hdr@bpc-switch:
    - shard-adlp:         NOTRUN -> ([SKIP][187], [SKIP][188]) ([Intel XE#455]) +3 other tests ( 2 skip )
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_hdr@bpc-switch.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#3544])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> ([SKIP][190], [SKIP][191]) ([Intel XE#2934])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> ([SKIP][192], [SKIP][193]) ([Intel XE#2927])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> ([SKIP][194], [SKIP][195]) ([Intel XE#2501])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1:
    - shard-lnl:          [PASS][196] -> ([PASS][197], [DMESG-WARN][198]) ([Intel XE#2932]) +2 other tests ( 1 dmesg-warn, 1 pass )
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-lnl-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         NOTRUN -> ([INCOMPLETE][199], [INCOMPLETE][200]) ([Intel XE#1035])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_plane@pixel-format.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_plane@pixel-format.html

  * igt@kms_plane@pixel-format@pipe-a-plane-3:
    - shard-adlp:         NOTRUN -> ([WARN][201], [WARN][202]) ([Intel XE#2078]) +1 other test ( 2 warn )
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_plane@pixel-format@pipe-a-plane-3.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_plane@pixel-format@pipe-a-plane-3.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][203], [PASS][204]) ([Intel XE#1035]) +1 other test ( 1 incomplete, 1 pass )
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][205] ([Intel XE#2566])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][206] ([Intel XE#870])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          NOTRUN -> ([SKIP][207], [SKIP][208]) ([Intel XE#3309])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         NOTRUN -> ([FAIL][209], [FAIL][210]) ([Intel XE#718])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_pm_dc@dc6-dpms.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> ([SKIP][211], [SKIP][212]) ([Intel XE#2499])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_pm_lpsp@kms-lpsp.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][213] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [PASS][214] -> ([PASS][215], [SKIP][216]) ([Intel XE#836])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-436/igt@kms_pm_rpm@dpms-non-lpsp.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][217] ([Intel XE#1489])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> ([SKIP][218], [SKIP][219]) ([Intel XE#1489]) +6 other tests ( 2 skip )
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> ([SKIP][220], [SKIP][221]) ([Intel XE#1489])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][222] ([Intel XE#1489])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][223], [SKIP][224]) ([Intel XE#2234] / [Intel XE#2850]) +8 other tests ( 2 skip )
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-blt.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][225] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][226] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-adlp:         NOTRUN -> ([SKIP][227], [SKIP][228]) ([Intel XE#2850] / [Intel XE#929]) +2 other tests ( 2 skip )
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_psr@fbc-psr2-sprite-render.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> ([SKIP][229], [SKIP][230]) ([Intel XE#2330])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][231] ([Intel XE#1127])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_setmode@basic@pipe-a-edp-1:
    - shard-lnl:          [PASS][232] -> ([FAIL][233], [FAIL][234]) ([Intel XE#2883])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-lnl-2/igt@kms_setmode@basic@pipe-a-edp-1.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-5/igt@kms_setmode@basic@pipe-a-edp-1.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-6/igt@kms_setmode@basic@pipe-a-edp-1.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> ([SKIP][235], [SKIP][236]) ([Intel XE#2426])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][237] -> ([FAIL][238], [FAIL][239]) ([Intel XE#899])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vblank@query-busy:
    - shard-dg2-set2:     [PASS][240] -> ([INCOMPLETE][241], [PASS][242]) ([Intel XE#4488]) +1 other test ( 1 incomplete, 1 pass )
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-434/igt@kms_vblank@query-busy.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-463/igt@kms_vblank@query-busy.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_vblank@query-busy.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [PASS][243] -> ([DMESG-WARN][244], [PASS][245]) ([Intel XE#2953] / [Intel XE#4173]) +3 other tests ( 1 dmesg-warn, 1 pass )
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          NOTRUN -> ([SKIP][246], [SKIP][247]) ([Intel XE#2168])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_vrr@cmrr.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][248] ([Intel XE#2168])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_vrr@lobf.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          NOTRUN -> ([SKIP][249], [SKIP][250]) ([Intel XE#1091] / [Intel XE#2849]) +1 other test ( 2 skip )
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_ccs@ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> ([SKIP][251], [SKIP][252]) ([Intel XE#455] / [Intel XE#488])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@xe_ccs@ctrl-surf-copy.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@xe_ccs@ctrl-surf-copy.html

  * igt@xe_eudebug@basic-close:
    - shard-bmg:          NOTRUN -> [SKIP][253] ([Intel XE#2905])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-bmg:          NOTRUN -> ([SKIP][254], [SKIP][255]) ([Intel XE#2905]) +5 other tests ( 2 skip )
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@xe_eudebug@basic-exec-queues.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-bmg:          NOTRUN -> ([SKIP][256], [SKIP][257]) ([Intel XE#2905] / [Intel XE#3889])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_online@set-breakpoint:
    - shard-adlp:         NOTRUN -> ([SKIP][258], [SKIP][259]) ([Intel XE#2905])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@xe_eudebug_online@set-breakpoint.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@xe_eudebug_online@set-breakpoint.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-dg2-set2:     NOTRUN -> [SKIP][260] ([Intel XE#2905]) +3 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][261] ([Intel XE#1392]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][262] -> ([SKIP][263], [PASS][264]) ([Intel XE#1392]) +6 other tests ( 1 pass, 1 skip )
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-466/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
    - shard-bmg:          NOTRUN -> [SKIP][265] ([Intel XE#2322])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:
    - shard-adlp:         NOTRUN -> ([SKIP][266], [SKIP][267]) ([Intel XE#1392])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> ([SKIP][268], [SKIP][269]) ([Intel XE#2322]) +4 other tests ( 2 skip )
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm:
    - shard-adlp:         NOTRUN -> ([SKIP][270], [SKIP][271]) ([Intel XE#288]) +1 other test ( 2 skip )
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][272] ([Intel XE#288]) +6 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][273] ([Intel XE#2360])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_threads@threads-hang-rebind-err:
    - shard-dg2-set2:     [PASS][274] -> ([PASS][275], [DMESG-WARN][276]) ([Intel XE#3876]) +1 other test ( 1 dmesg-warn, 1 pass )
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-434/igt@xe_exec_threads@threads-hang-rebind-err.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@xe_exec_threads@threads-hang-rebind-err.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-463/igt@xe_exec_threads@threads-hang-rebind-err.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> ([SKIP][277], [SKIP][278]) ([Intel XE#2457])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@xe_module_load@force-load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@xe_module_load@force-load.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][279] ([Intel XE#2541] / [Intel XE#3573])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_oa@invalid-map-oa-buffer:
    - shard-adlp:         NOTRUN -> ([SKIP][280], [SKIP][281]) ([Intel XE#2541] / [Intel XE#3573])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@xe_oa@invalid-map-oa-buffer.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@xe_oa@invalid-map-oa-buffer.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][282] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_oa@syncs-userptr-wait:
    - shard-adlp:         NOTRUN -> ([SKIP][283], [SKIP][284]) ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@xe_oa@syncs-userptr-wait.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@xe_oa@syncs-userptr-wait.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> ([SKIP][285], [SKIP][286]) ([Intel XE#1420])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@xe_pat@pat-index-xehpc.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][287] ([Intel XE#979])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][288] ([Intel XE#1173]) +1 other test fail
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> ([SKIP][289], [SKIP][290]) ([Intel XE#2427])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@xe_peer2peer@write.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@xe_peer2peer@write.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> ([SKIP][291], [SKIP][292]) ([Intel XE#2284])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-bmg:          NOTRUN -> [ABORT][293] ([Intel XE#4268]) +1 other test abort
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> ([SKIP][294], [SKIP][295]) ([Intel XE#579])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          NOTRUN -> ([SKIP][296], [SKIP][297]) ([Intel XE#944]) +1 other test ( 2 skip )
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          NOTRUN -> [SKIP][298] ([Intel XE#944])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          NOTRUN -> ([SKIP][299], [SKIP][300]) ([Intel XE#3342])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@xe_sriov_flr@flr-vf1-clear.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [PASS][301] -> ([ABORT][302], [PASS][303]) ([Intel XE#3084])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-lnl-1/igt@xe_wedged@wedged-mode-toggle.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-7/igt@xe_wedged@wedged-mode-toggle.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-6/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][304] ([Intel XE#3701] / [Intel XE#3718] / [Intel XE#827]) -> [PASS][305]
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][306] ([Intel XE#4330]) -> [PASS][307] +1 other test pass
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-adlp-8/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-2/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [SKIP][308] ([Intel XE#2291]) -> [PASS][309] +1 other test pass
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#309]) -> ([PASS][311], [PASS][312]) +1 other test ( 2 pass )
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][313] ([Intel XE#2291]) -> ([PASS][314], [PASS][315]) +1 other test ( 2 pass )
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#310]) -> ([PASS][317], [PASS][318]) +1 other test ( 2 pass )
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][319] ([Intel XE#301] / [Intel XE#3321]) -> ([PASS][320], [PASS][321])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][322] ([Intel XE#301]) -> [PASS][323]
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-bmg:          [SKIP][324] ([Intel XE#2316]) -> [PASS][325] +1 other test pass
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][326] ([Intel XE#2316]) -> ([PASS][327], [PASS][328])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:
    - shard-bmg:          [FAIL][329] ([Intel XE#2882]) -> [PASS][330] +1 other test pass
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][331] ([Intel XE#301] / [Intel XE#3149]) -> ([PASS][332], [PASS][333]) +1 other test ( 2 pass )
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@modeset-vs-vblank-race:
    - shard-dg2-set2:     [INCOMPLETE][334] ([Intel XE#2049]) -> [PASS][335]
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-434/igt@kms_flip@modeset-vs-vblank-race.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_flip@modeset-vs-vblank-race.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
    - shard-adlp:         [DMESG-FAIL][336] ([Intel XE#4330]) -> ([PASS][337], [PASS][338]) +1 other test ( 2 pass )
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
    - shard-adlp:         [FAIL][339] ([Intel XE#1874]) -> ([PASS][340], [PASS][341])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#656]) -> ([PASS][343], [PASS][344]) +4 other tests ( 2 pass )
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-adlp:         [ABORT][345] -> ([PASS][346], [PASS][347])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-adlp-9/igt@kms_hdmi_inject@inject-4k.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_hdmi_inject@inject-4k.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#4328]) -> ([PASS][349], [PASS][350])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_joiner@basic-force-big-joiner.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-436/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-lnl:          [DMESG-WARN][351] ([Intel XE#2042] / [Intel XE#2932]) -> ([PASS][352], [PASS][353])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-lnl-5/igt@kms_pm_rpm@system-suspend-modeset.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-3/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#1392]) -> ([PASS][355], [PASS][356]) +1 other test ( 2 pass )
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic.html

  
#### Warnings ####

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#787]) -> ([SKIP][358], [SKIP][359]) ([Intel XE#455] / [Intel XE#787]) +9 other tests ( 2 skip )
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][361], [SKIP][362]) ([Intel XE#787]) +7 other tests ( 2 skip )
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][363] ([Intel XE#2705] / [Intel XE#4522]) -> [INCOMPLETE][364] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [FAIL][365] ([Intel XE#1178]) -> ([FAIL][366], [SKIP][367]) ([Intel XE#1178] / [Intel XE#455]) +1 other test ( 1 fail, 1 skip )
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-432/igt@kms_content_protection@atomic.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_content_protection@atomic.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [INCOMPLETE][368] ([Intel XE#4132]) -> ([SKIP][369], [FAIL][370]) ([Intel XE#1178] / [Intel XE#455])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-433/igt@kms_content_protection@lic-type-0.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-436/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          [FAIL][371] ([Intel XE#1178]) -> [INCOMPLETE][372] ([Intel XE#4132]) +1 other test incomplete
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][373] ([Intel XE#4132]) -> [FAIL][374] ([Intel XE#3304])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-436/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-bmg:          [SKIP][375] ([Intel XE#2291]) -> ([SKIP][376], [PASS][377]) ([Intel XE#2291])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [SKIP][378] ([Intel XE#2291]) -> ([SKIP][379], [DMESG-WARN][380]) ([Intel XE#2291] / [Intel XE#877])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][381] ([Intel XE#2373]) -> ([SKIP][382], [PASS][383]) ([Intel XE#2373])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-busy-flip:
    - shard-bmg:          [SKIP][384] ([Intel XE#2316]) -> ([PASS][385], [SKIP][386]) ([Intel XE#2316]) +2 other tests ( 1 pass, 1 skip )
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_flip@2x-busy-flip.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-1/igt@kms_flip@2x-busy-flip.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][387] ([Intel XE#2316]) -> [FAIL][388] ([Intel XE#3321])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][389] ([Intel XE#301]) -> ([FAIL][390], [PASS][391]) ([Intel XE#301]) +1 other test ( 1 fail, 1 pass )
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][392] ([Intel XE#2311]) -> ([SKIP][393], [SKIP][394]) ([Intel XE#2311] / [Intel XE#2312]) +8 other tests ( 2 skip )
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][395] ([Intel XE#2312]) -> ([SKIP][396], [SKIP][397]) ([Intel XE#2311]) +2 other tests ( 2 skip )
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#656]) -> ([SKIP][399], [SKIP][400]) ([Intel XE#651]) +9 other tests ( 2 skip )
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][401] ([Intel XE#4141]) -> ([SKIP][402], [SKIP][403]) ([Intel XE#2312] / [Intel XE#4141]) +4 other tests ( 2 skip )
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][404] ([Intel XE#4141]) -> [SKIP][405] ([Intel XE#2312]) +3 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][406] ([Intel XE#2312]) -> ([SKIP][407], [SKIP][408]) ([Intel XE#2312] / [Intel XE#4141]) +5 other tests ( 2 skip )
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][409] ([Intel XE#2312]) -> ([SKIP][410], [SKIP][411]) ([Intel XE#4141])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][412] ([Intel XE#2312]) -> [SKIP][413] ([Intel XE#4141]) +3 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][414] ([Intel XE#2312]) -> [SKIP][415] ([Intel XE#2311]) +4 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#651]) -> ([SKIP][417], [SKIP][418]) ([Intel XE#651] / [Intel XE#656]) +14 other tests ( 2 skip )
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][419] ([Intel XE#2311]) -> [SKIP][420] ([Intel XE#2312]) +7 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][421] ([Intel XE#2312]) -> ([SKIP][422], [SKIP][423]) ([Intel XE#2311] / [Intel XE#2312]) +3 other tests ( 2 skip )
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][424] ([Intel XE#2312]) -> ([SKIP][425], [SKIP][426]) ([Intel XE#2312] / [Intel XE#2313]) +6 other tests ( 2 skip )
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][427] ([Intel XE#2312]) -> ([SKIP][428], [SKIP][429]) ([Intel XE#2313]) +2 other tests ( 2 skip )
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][430] ([Intel XE#2313]) -> [SKIP][431] ([Intel XE#2312]) +7 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][432] ([Intel XE#2313]) -> ([SKIP][433], [SKIP][434]) ([Intel XE#2312] / [Intel XE#2313]) +8 other tests ( 2 skip )
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#653]) -> ([SKIP][436], [SKIP][437]) ([Intel XE#653] / [Intel XE#656]) +15 other tests ( 2 skip )
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#656]) -> ([SKIP][439], [SKIP][440]) ([Intel XE#653]) +9 other tests ( 2 skip )
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][441] ([Intel XE#2312]) -> [SKIP][442] ([Intel XE#2313]) +5 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][443] ([Intel XE#899]) -> ([PASS][444], [FAIL][445]) ([Intel XE#899])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@testdisplay:
    - shard-dg2-set2:     [ABORT][446] -> ([ABORT][447], [ABORT][448]) ([Intel XE#2705])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-432/igt@testdisplay.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@testdisplay.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@testdisplay.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#1392]) -> ([SKIP][450], [PASS][451]) ([Intel XE#1392]) +1 other test ( 1 pass, 1 skip )
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-adlp:         [DMESG-WARN][452] ([Intel XE#4173]) -> ([DMESG-WARN][453], [PASS][454]) ([Intel XE#4173])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914
  [Intel XE#4132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c -> xe-pw-146024v2

  IGT_8269: 8269
  xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c: 8098d8ba50a86426b0336d895a8ff3b6e572a15c
  xe-pw-146024v2: 146024v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/index.html

--===============3939413127954982780==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146024/">https://patchwork.freedesktop.org/series/146024/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c_full -&gt; xe-pw-146024v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-146024v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-146024v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-146024v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-7/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@xe_exec_fault_mode@invalid-va.html">ABORT</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-lnl-7/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-7/igt@xe_exec_fault_mode@invalid-va.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-8/igt@xe_exec_fault_mode@invalid-va.html">ABORT</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-lnl-7/igt@xe_oa@buffer-size.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-7/igt@xe_oa@buffer-size.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-1/igt@xe_oa@buffer-size.html">FAIL</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_oa@buffer-size@rcs-0-256k}:<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-1/igt@xe_oa@buffer-size@rcs-0-256k.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-146024v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@core_hotunplug@hotunplug-rescan.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@core_hotunplug@hotunplug-rescan.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914">Intel XE#3914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +99 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-dp-4.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-dp-4.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +29 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_content_protection@atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_content_protection@legacy.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test ( 1 fail, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_content_protection@lic-type-1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_content_protection@lic-type-1.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +4 other tests ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests ( 1 pass, 1 skip )</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_dp_aux_dev.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-435/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_dsc@dsc-with-bpc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_dsc@dsc-with-bpc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-interruptible.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-2/igt@kms_flip@2x-plain-flip.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_flip@2x-plain-flip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_flip@2x-plain-flip.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-435/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_flip@2x-plain-flip-interruptible.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a6.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_hdr@bpc-switch.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_hdr@bpc-switch.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-lnl-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>) +2 other tests ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_plane@pixel-format.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_plane@pixel-format.html">INCOMPLETE</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-a-plane-3:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_plane@pixel-format@pipe-a-plane-3.html">WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_plane@pixel-format@pipe-a-plane-3.html">WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>) +1 other test ( 2 warn )</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_pm_dc@dc6-dpms.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-436/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-lnl-2/igt@kms_setmode@basic@pipe-a-edp-1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-5/igt@kms_setmode@basic@pipe-a-edp-1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-6/igt@kms_setmode@basic@pipe-a-edp-1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-434/igt@kms_vblank@query-busy.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-463/igt@kms_vblank@query-busy.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_vblank@query-busy.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488">Intel XE#4488</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-1/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +3 other tests ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@kms_vrr@cmrr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_vrr@cmrr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@xe_ccs@ctrl-surf-copy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@xe_ccs@ctrl-surf-copy.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@xe_eudebug@basic-exec-queues.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@xe_eudebug@basic-exec-queues.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@xe_eudebug_online@set-breakpoint.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@xe_eudebug_online@set-breakpoint.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-466/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +6 other tests ( 1 pass, 1 skip )</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind-err:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-434/igt@xe_exec_threads@threads-hang-rebind-err.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@xe_exec_threads@threads-hang-rebind-err.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-463/igt@xe_exec_threads@threads-hang-rebind-err.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) +1 other test ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@xe_module_load@force-load.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@xe_module_load@force-load.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-map-oa-buffer:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@xe_oa@invalid-map-oa-buffer.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@xe_oa@invalid-map-oa-buffer.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@xe_oa@syncs-syncobj-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@xe_oa@syncs-userptr-wait.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@xe_oa@syncs-userptr-wait.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@xe_pat@pat-index-xehpc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@xe_peer2peer@write.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@xe_peer2peer@write.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-lnl-1/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-7/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-6/igt@xe_wedged@wedged-mode-toggle.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701">Intel XE#3701</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-adlp-8/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-2/igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-434/igt@kms_flip@modeset-vs-vblank-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_flip@modeset-vs-vblank-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">PASS</a>) +4 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-adlp-9/igt@kms_hdmi_inject@inject-4k.html">ABORT</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@kms_hdmi_inject@inject-4k.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-3/igt@kms_hdmi_inject@inject-4k.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328">Intel XE#4328</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-436/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-lnl-5/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-3/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-432/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@kms_content_protection@atomic.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_content_protection@atomic.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test ( 1 fail, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-433/igt@kms_content_protection@lic-type-0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Intel XE#4132</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_content_protection@lic-type-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-436/igt@kms_content_protection@lic-type-0.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Intel XE#4132</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Intel XE#4132</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-436/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-6/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_feature_discovery@display-2x.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_feature_discovery@display-2x.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_flip@2x-busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-1/igt@kms_flip@2x-busy-flip.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_flip@2x-busy-flip.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +15 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-432/igt@testdisplay.html">ABORT</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@testdisplay.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-464/igt@testdisplay.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146024v2/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c -&gt; xe-pw-146024v2</li>
</ul>
<p>IGT_8269: 8269<br />
  xe-2788-8098d8ba50a86426b0336d895a8ff3b6e572a15c: 8098d8ba50a86426b0336d895a8ff3b6e572a15c<br />
  xe-pw-146024v2: 146024v2</p>

</body>
</html>

--===============3939413127954982780==--
