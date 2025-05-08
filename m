Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29833C3ABBE
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 09:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06BD10E37B;
	Thu,  8 May 2025 09:38:49 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6FC10E0C6;
 Thu,  8 May 2025 09:38:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2055209456891820556=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Add_helper_funct?=
 =?utf-8?q?ion_to_inject_fault_into_ct=5Fdead=5Fcapture=28=29_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 May 2025 09:38:49 -0000
Message-ID: <174669712931.58950.6766817246674746589@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250507131558.19572-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250507131558.19572-1-satyanarayana.k.v.p@intel.com>
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

--===============2055209456891820556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add helper function to inject fault into ct_dead_capture() (rev3)
URL   : https://patchwork.freedesktop.org/series/148415/
State : failure

== Summary ==

CI Bug Log - changes from xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4_FULL -> xe-pw-148415v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148415v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148415v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148415v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_edge_walk@256x256-left-edge:
    - shard-bmg:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-left-edge.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-bmg:          [PASS][2] -> [DMESG-WARN][3] +1 other test dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_flip@flip-vs-panning-interruptible.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][4] -> [SKIP][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_hdr@static-swap.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_hdr@static-swap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  
Known issues
------------

  Here are the changes found in xe-pw-148415v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1466])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [PASS][9] -> [DMESG-WARN][10] ([Intel XE#4543]) +5 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][11] -> [FAIL][12] ([Intel XE#3908]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-9/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2327]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-8/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1124]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-9/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#3658])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1124])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2328])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +10 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [PASS][19] -> [DMESG-FAIL][20] ([Intel XE#4543]) +4 other tests dmesg-fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#619])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-9/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1467])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2314] / [Intel XE#2894])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2191])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-2/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#2191])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#367]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#367])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#2887]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2887]) +10 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#787]) +139 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#2669]) +7 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#3432]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#3432])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#455] / [Intel XE#787]) +22 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][38] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][39] -> [INCOMPLETE][40] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][41] -> [INCOMPLETE][42] ([Intel XE#1727] / [Intel XE#3113])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][43] ([Intel XE#3113])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][44] -> [INCOMPLETE][45] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#787]) +14 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-2/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#4417]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#306])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-2/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2325]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#373]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-464/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2252]) +6 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#373]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#373]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_color@invalid-ctm-matrix-sizes:
    - shard-bmg:          [PASS][54] -> [DMESG-WARN][55] ([Intel XE#3428]) +7 other tests dmesg-warn
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_color@invalid-ctm-matrix-sizes.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_color@invalid-ctm-matrix-sizes.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][56] ([Intel XE#1178])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#307])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2390]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0.html
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#307])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-2/igt@kms_content_protection@dp-mst-type-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#307])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2341]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_content_protection@legacy.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][62] ([Intel XE#1178]) +1 other test fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-464/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2321])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2320]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1424])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][66] -> [FAIL][67] ([Intel XE#1475]) +1 other test fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          NOTRUN -> [FAIL][68] ([Intel XE#4793])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2244])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#4422])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][71] -> [SKIP][72] ([Intel XE#2373])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_feature_discovery@display-2x.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2374])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-4/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [PASS][74] -> [SKIP][75] ([Intel XE#2316]) +5 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][76] -> [FAIL][77] ([Intel XE#301])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][78] -> [FAIL][79] ([Intel XE#3321]) +1 other test fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][80] ([Intel XE#3321]) +3 other tests fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2316]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][82] ([Intel XE#2882]) +12 other tests fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#310]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1421]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     NOTRUN -> [FAIL][85] ([Intel XE#301]) +2 other tests fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [PASS][86] -> [INCOMPLETE][87] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][88] -> [DMESG-WARN][89] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#886]) +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     [PASS][92] -> [FAIL][93] ([Intel XE#2882]) +2 other tests fail
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-433/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-436/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1:
    - shard-adlp:         [PASS][94] -> [FAIL][95] ([Intel XE#2882]) +1 other test fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-2/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-2/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2:
    - shard-bmg:          [PASS][96] -> [FAIL][97] ([Intel XE#2882]) +2 other tests fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1401] / [Intel XE#1745])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1401])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2293]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#455]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#455]) +5 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#656]) +8 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2311]) +16 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#656]) +6 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#651]) +4 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#4141]) +6 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#651]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#651])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2312]) +9 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#653]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2313]) +21 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#653]) +6 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#1503]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2927])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_joiner@basic-ultra-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#2927])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-464/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane@plane-position-hole-dpms:
    - shard-bmg:          [PASS][118] -> [DMESG-WARN][119] ([Intel XE#3372] / [Intel XE#3428])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_plane@plane-position-hole-dpms.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_plane@plane-position-hole-dpms.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][120] ([Intel XE#616])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-466/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [PASS][121] -> [FAIL][122] ([Intel XE#616]) +1 other test fail
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-432/igt@kms_plane_cursor@viewport.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-432/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2393])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-4/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#4596])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-none.html
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#4596])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-4/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][126] -> [SKIP][127] ([Intel XE#4596])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#2763]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#2763]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2763]) +9 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#870])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][133] -> [FAIL][134] ([Intel XE#718])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [PASS][135] -> [FAIL][136] ([Intel XE#718])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          NOTRUN -> [FAIL][137] ([Intel XE#718])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2392])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2505])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-68:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][140] ([Intel XE#3428]) +2 other tests dmesg-warn
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#1489]) +5 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#4608])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#1489]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#2893]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#1489])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-432/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#2850] / [Intel XE#929])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-2/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_psr@fbc-psr2-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#1406])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-8/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@fbc-psr2-basic@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#4609])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-8/igt@kms_psr@fbc-psr2-basic@edp-1.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#3414])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-8/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#3414] / [Intel XE#3904])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-7/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#3414])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2413])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic:
    - shard-bmg:          NOTRUN -> [FAIL][155] ([Intel XE#4794] / [Intel XE#4807])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][156] ([Intel XE#4807])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_setmode@basic@pipe-a-dp-2.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [FAIL][157] ([Intel XE#4794]) +4 other tests fail
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][158] -> [SKIP][159] ([Intel XE#1435])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#330])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@query-busy:
    - shard-bmg:          [PASS][161] -> [FAIL][162] ([Intel XE#4892]) +2 other tests fail
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@kms_vblank@query-busy.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_vblank@query-busy.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#1499])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#756]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-4/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#4837]) +4 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-434/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@read-metadata:
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#4837]) +9 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-7/igt@xe_eudebug@read-metadata.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#4837]) +3 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-9/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#4837]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-1/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#4518])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][170] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-3/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#688]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-4/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#1392]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [PASS][173] -> [SKIP][174] ([Intel XE#1392]) +5 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#2322]) +6 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#1392])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-dg2-set2:     [PASS][177] -> [INCOMPLETE][178] ([Intel XE#4842])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_exec_basic@multigpu-once-userptr.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-466/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#288]) +6 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][180] ([Intel XE#288]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-4/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][181] ([Intel XE#2360])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-bo-map:
    - shard-dg2-set2:     NOTRUN -> [SKIP][182] ([Intel XE#4915]) +42 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-466/igt@xe_exec_system_allocator@threads-many-execqueues-new-bo-map.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][183] ([Intel XE#4915]) +32 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-4/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#4943]) +16 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge:
    - shard-lnl:          NOTRUN -> [SKIP][185] ([Intel XE#4943]) +4 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge.html

  * igt@xe_mmap@pci-membarrier-bad-pagesize:
    - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#4045])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-3/igt@xe_mmap@pci-membarrier-bad-pagesize.html
    - shard-adlp:         NOTRUN -> [SKIP][187] ([Intel XE#4045])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-1/igt@xe_mmap@pci-membarrier-bad-pagesize.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@syncs-ufence-wait:
    - shard-adlp:         NOTRUN -> [SKIP][189] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-4/igt@xe_oa@syncs-ufence-wait.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][190] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-464/igt@xe_oa@syncs-ufence-wait.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][191] ([Intel XE#977])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-4/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][192] ([Intel XE#1948])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-5/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s3-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][193] ([Intel XE#584]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-1/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][194] ([Intel XE#2284]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-8/igt@xe_pm@s3-d3cold-basic-exec.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][195] ([Intel XE#2284] / [Intel XE#366])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [PASS][196] -> [FAIL][197] ([Intel XE#4817]) +1 other test fail
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-434/igt@xe_pmu@gt-frequency.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-432/igt@xe_pmu@gt-frequency.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][198] ([Intel XE#4733]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][199] ([Intel XE#4733]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-bmg:          NOTRUN -> [SKIP][200] ([Intel XE#944])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-lnl:          NOTRUN -> [SKIP][201] ([Intel XE#4130])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-4/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][202] ([Intel XE#4130])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-adlp:         [PASS][203] -> [SKIP][204] ([Intel XE#4738])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [DMESG-WARN][205] ([Intel XE#3428]) -> [PASS][206] +7 other tests pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@core_hotunplug@hotreplug.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-8/igt@core_hotunplug@hotreplug.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][207] ([Intel XE#827]) -> [PASS][208] +1 other test pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [FAIL][209] ([Intel XE#911]) -> [PASS][210] +3 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][211] ([Intel XE#3884]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][213] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][214] +1 other test pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][215] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][217] ([Intel XE#2291]) -> [PASS][218] +3 other tests pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][219] ([Intel XE#4302]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][221] ([Intel XE#3321]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][223] ([Intel XE#301]) -> [PASS][224] +1 other test pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][225] ([Intel XE#2316]) -> [PASS][226] +11 other tests pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - shard-lnl:          [FAIL][227] ([Intel XE#886]) -> [PASS][228] +1 other test pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][229] ([Intel XE#4543]) -> [PASS][230] +12 other tests pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][231] ([Intel XE#1503]) -> [PASS][232] +1 other test pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-4/igt@kms_hdr@static-toggle.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_hdr@static-toggle.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][233] ([Intel XE#2883]) -> [PASS][234] +2 other tests pass
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-6/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:
    - shard-dg2-set2:     [ABORT][235] -> [PASS][236] +1 other test pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-436/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][237] ([Intel XE#4212]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-436/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#1392]) -> [PASS][240] +7 other tests pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-434/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [DMESG-WARN][241] ([Intel XE#4173]) -> [PASS][242] +8 other tests pass
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][243] ([Intel XE#1794]) -> [PASS][244]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-1/igt@xe_pm@s4-basic-exec.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [FAIL][245] ([Intel XE#1874]) -> [DMESG-FAIL][246] ([Intel XE#4543])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][247] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][248] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [TIMEOUT][249] ([Intel XE#4862]) -> [FAIL][250] ([Intel XE#1178]) +1 other test fail
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@kms_content_protection@atomic.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][251] ([Intel XE#2341]) -> [FAIL][252] ([Intel XE#1178])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][253] ([Intel XE#2316]) -> [FAIL][254] ([Intel XE#3321])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][255] ([Intel XE#2316]) -> [FAIL][256] ([Intel XE#2882])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][257] ([Intel XE#2312]) -> [SKIP][258] ([Intel XE#2311]) +19 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][259] ([Intel XE#2312]) -> [SKIP][260] ([Intel XE#4141]) +7 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][261] ([Intel XE#4141]) -> [SKIP][262] ([Intel XE#2312]) +6 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][263] ([Intel XE#2311]) -> [SKIP][264] ([Intel XE#2312]) +11 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][265] ([Intel XE#2312]) -> [SKIP][266] ([Intel XE#2313]) +14 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][267] ([Intel XE#2313]) -> [SKIP][268] ([Intel XE#2312]) +14 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][269] ([Intel XE#2493]) -> [SKIP][270] ([Intel XE#4596])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][271] ([Intel XE#2509]) -> [SKIP][272] ([Intel XE#2426])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#1500]) -> [SKIP][274] ([Intel XE#362])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
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
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3372
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4738]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4738
  [Intel XE#4793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4793
  [Intel XE#4794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4794
  [Intel XE#4807]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4807
  [Intel XE#4817]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4817
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#4862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4862
  [Intel XE#4892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4892
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * IGT: IGT_8354 -> IGT_8356
  * Linux: xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4 -> xe-pw-148415v3

  IGT_8354: 59f7153426484367f58edfafb6567ce4e6a9e499 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8356: 4db4ba9b619fefa181cf0fc73cf8c35d282c61ae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4: b5600d5671f0e468c0c73bc7a1de942097ddaab4
  xe-pw-148415v3: 148415v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/index.html

--===============2055209456891820556==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add helper function to inject fault =
into ct_dead_capture() (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/148415/">https://patchwork.freedesktop.org/series/148415/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148415v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148415v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3044-b5600d5671f0e468c0c73bc7a1de94209=
7ddaab4_FULL -&gt; xe-pw-148415v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148415v3_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-148415v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1484=
15v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-=
left-edge.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_flip=
@flip-vs-panning-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_flip@flip-=
vs-panning-interruptible.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_hdr@=
static-swap.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_hdr@static-swap.html">SKIP</a=
></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-2/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-148415v3/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-=
many-large-execqueues-new-bo-map-nomemset.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148415v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-8/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1466">Intel XE#1466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a=
-1-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-9/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1484=
15v3/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events-tile=
d@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +5 other tests dmesg=
-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-8/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-9/i=
gt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE=
#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-8/igt@kms_big_fb@4-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-9/igt@kms_big_fb@4-tiled-8bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-3/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-3/i=
gt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">In=
tel XE#4543</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-3/igt@kms_big_fb@yf-tiled-64bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-9/igt@kms_big_fb@yf-tiled-addfb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/619">Intel XE#619</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-7/igt@kms_bw@connected-linear-tilin=
g-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-2/igt@kms_bw@connected-linear-tilin=
g-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-432/igt@kms_bw@connected-linear-til=
ing-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_bw@linear-tiling-1-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-466/igt@kms_bw@linear-tiling-3-disp=
lays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-3/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-4/igt@kms_ccs@bad-aux-stride-4-til=
ed-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +139 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-bmg-ccs@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +22 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124"=
>Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-432/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">In=
tel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-a-dp-2.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-43=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727=
">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-2/igt@kms_ccs@random-ccs-data-y-ti=
led-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-434/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-2/igt@kms_chamelium_color@ctm-limit=
ed-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_chamelium_color@degamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2325">Intel XE#2325</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-464/igt@kms_chamelium_frames@vga-fr=
ame-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_chamelium_hpd@common-hpd-=
after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-4/igt@kms_chamelium_hpd@common-hpd-=
after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-6/igt@kms_chamelium_hpd@vga-hpd-fo=
r-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_colo=
r@invalid-ctm-matrix-sizes.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_color@invalid-=
ctm-matrix-sizes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) +7 other tests dmesg-wa=
rn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-1/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-8/igt@kms_content_protection@dp-mst=
-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2390">Intel XE#2390</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-2/igt@kms_content_protection@dp-ms=
t-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-434/igt@kms_content_protection@dp-m=
st-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_content_protection@legacy=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2341">Intel XE#2341</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-464/igt@kms_content_protection@lega=
cy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_cursor_crc@cursor-offscre=
en-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-m=
ovement-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding=
-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_cursor_le=
gacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-=
fallback.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4793">Intel XE#4793</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-4/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dirt=
y-rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_feat=
ure_discovery@display-2x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_feature_discover=
y@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-4/igt@kms_feature_discovery@psr2.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-463/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/sha=
rd-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard=
-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-v=
blank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-che=
ck-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +12 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-2/igt@kms_flip@2x-single-buffer-fl=
ip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</l=
i>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-6/igt@kms_flip@2x-single-buffer-fli=
p-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-466/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-434/igt@kms_fl=
ip@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148415v3/shard-dg2-463/igt@kms_flip@flip-vs-suspend=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-9/igt@kms_flip@fli=
p-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)=
 +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-2/igt@kms_flip=
@plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-3/igt@kms_fli=
p@plain-flip-fb-recreate-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-433/igt@kms_fl=
ip@plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-436/igt@kms_fl=
ip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other =
tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-2/igt@kms_fli=
p@plain-flip-ts-check-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-2/i=
gt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#=
2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_flip=
@plain-flip-ts-check-interruptible@b-dp2.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_=
flip@plain-flip-ts-check-interruptible@b-dp2.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +=
2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#17=
45</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel=
 XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE=
#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Inte=
l XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +16 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-1/igt@kms_frontbuffer_tracking@drr=
s-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-436/igt@kms_frontbuffer_tracking@dr=
rs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-3/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +21 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-464/igt@kms_frontbuffer_tracking@ps=
r-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-4/igt@kms_hdr@static-toggle-suspend=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1503">Intel XE#1503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_joiner@basic-ultra-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2927">Intel XE#2927</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-464/igt@kms_joiner@basic-ultra-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_plan=
e@plane-position-hole-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_plane@plane-po=
sition-hole-dpms.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3372">Intel XE#3372</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-466/igt@kms_plane_cursor@overlay@pi=
pe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-432/igt@kms_pl=
ane_cursor@viewport.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-432/igt@kms_plane_cursor@viewpo=
rt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-4/igt@kms_plane_lowres@tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-=
none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4596">Intel XE#4596</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-4/igt@kms_plane_multiple@2x-tiling=
-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_plane_multiple@2x-=
tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-2/igt@kms_plane_scaling@plane-down=
scale-factor-0-25-with-modifiers@pipe-a.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-4/igt@kms_plane_scaling@plane-downs=
cale-factor-0-25-with-modifiers@pipe-b.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-2/igt@kms_plane_scaling@plane-down=
scale-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-7/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-8/igt@kms_pm_backlight@fade-with-dp=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-8/igt@kms_pm_d=
c@dc5-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-148415v3/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel =
XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-8/igt@kms_pm_=
dc@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-148415v3/shard-adlp-3/igt@kms_pm_dc@dc6-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Inte=
l XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">In=
tel XE#718</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_pm_dc@dc6-psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">I=
ntel XE#2392</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_pm_dc@deep-pkgc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505"=
>Intel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-68:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_pm_rpm@legacy-planes-dpms=
@plane-68.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3428">Intel XE#3428</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-primary-=
plane-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-1/igt@kms_psr2_sf@pr-overlay-plane=
-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-=
move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-prim=
ary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-432/igt@kms_psr@fbc-psr-cursor-plan=
e-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-2/igt@kms_psr@fbc-psr-primary-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_psr@fbc-psr2-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
34">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-8/igt@kms_psr@fbc-psr2-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-8/igt@kms_psr@fbc-psr2-basic@edp-1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-8/igt@kms_rotation_crc@primary-rot=
ation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3414">Intel XE#3414</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-7/igt@kms_rotation_crc@primary-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-434/igt@kms_rotation_crc@sprite-rot=
ation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-7/igt@kms_scaling_modes@scaling-mod=
e-full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_setmode@basic.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4794">I=
ntel XE#4794</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4807">Intel XE#4807</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_setmode@basic@pipe-a-dp-2=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4807">Intel XE#4807</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_setmode@basic@pipe-a-hdmi=
-a-3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4794">Intel XE#4794</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-4/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-1/igt@kms_tv_load_detect@load-dete=
ct.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@kms_vbla=
nk@query-busy.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-148415v3/shard-bmg-6/igt@kms_vblank@query-busy.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4892"=
>Intel XE#4892</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-dr=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-4/igt@kms_writeback@writeback-pixel=
-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-434/igt@xe_eudebug@basic-close.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-7/igt@xe_eudebug@read-metadata.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-9/igt@xe_eudebug_online@reset-with=
-attention.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-1/igt@xe_eudebug_online@resume-dss.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-3/igt@xe_evict@evict-beng-large-ex=
ternal-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-4/igt@xe_evict_ccs@evict-overcommit=
-parallel-nofree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-5/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-432/igt@xe=
_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@xe_exec_basic@multigpu-once-b=
asic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2322">Intel XE#2322</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-432/igt@xe_exec_basic@multigpu-once=
-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_exe=
c_basic@multigpu-once-userptr.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-466/igt@xe_exec_basic=
@multigpu-once-userptr.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4842">Intel XE#4842</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-435/igt@xe_exec_fault_mode@once-use=
rptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-4/igt@xe_exec_fault_mode@twice-bin=
dexecqueue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-436/igt@xe_exec_mix_modes@exec-simp=
le-batch-store-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-bo-map:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-466/igt@xe_exec_system_allocator@th=
reads-many-execqueues-new-bo-map.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +42 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-nomemset=
:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-4/igt@xe_exec_system_allocator@thr=
eads-many-large-execqueues-mmap-nomemset.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +32 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-=
huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-4/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1=
6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-7/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-mmap-new-huge.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-pagesize:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-3/igt@xe_mmap@pci-membarrier-bad-pa=
gesize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4045">Intel XE#4045</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-1/igt@xe_mmap@pci-membarrier-bad-p=
agesize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4045">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-432/igt@xe_oa@non-privileged-map-oa=
-buffer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-adlp-4/igt@xe_oa@syncs-ufence-wait.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-464/igt@xe_oa@syncs-ufence-wait.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-4/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977=
">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-5/igt@xe_pm@d3hot-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/194=
8">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-1/igt@xe_pm@s3-basic-exec.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">=
Intel XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-8/igt@xe_pm@s3-d3cold-basic-exec.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-434/igt@xe_pmu=
@gt-frequency.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-148415v3/shard-dg2-432/igt@xe_pmu@gt-frequency.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4817"=
>Intel XE#4817</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-bind-po=
st-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4733">Intel XE#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-post-s=
uspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@xe_query@multigpu-query-inval=
id-query.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-lnl-4/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148415v3/shard-dg2-464/igt@xe_sriov_auto_provisioning@=
selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-4/igt@xe_srio=
v_scheduling@nonpreempt-engine-resets.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-8/igt@xe_sri=
ov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4738">Intel XE#4738</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@core_hot=
unplug@hotreplug.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-8/igt@core_hot=
unplug@hotreplug.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_asyn=
c_flips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-1/ig=
t@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-3/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel=
 XE#911</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148415v3/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-event=
s-linear@pipe-c-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-8/igt@kms_asy=
nc_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-=
2/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148415v3/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x=
1080p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-436/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-4/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> +3 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-8/igt@k=
ms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#=
3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148415v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@a=
b-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard=
-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-8/igt@kms_flip=
@wf_vblank-ts-check-interruptible@a-edp1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-ln=
l-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-9/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.=
html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-4/igt@kms_flip_scaled_crc@flip=
-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">PASS</a> +1=
2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-4/igt@kms_hdr@=
static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_hdr@static-to=
ggle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-2/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-lnl-6/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-463/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html">ABORT</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v=
3/shard-dg2-436/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-h=
dmi-a-6-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-463/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/421=
2">Intel XE#4212</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-148415v3/shard-dg2-436/igt@kms_setmode@invalid-clone-single-crt=
c-stealing@pipe-b-hdmi-a-6-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg=
2-434/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">PASS</a> +7 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-3/igt@xe_pm@s=
2idle-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-9/igt@xe_pm@s=
2idle-basic-exec.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-9/igt@xe_pm@s=
4-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-adlp-1/igt@xe_pm@s4-basic-e=
xec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-2/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/=
shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-dg2-436/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel X=
E#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@kms_cont=
ent_protection@atomic.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4862">Intel XE#4862</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_co=
ntent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-4/igt@kms_cont=
ent_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-3/igt@kms_=
content_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-7/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg=
-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#288=
2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148415v3/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1484=
15v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4141">Intel XE#4141</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48415v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148415v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48415v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-148415v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/shard-bmg-5/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/sha=
rd-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">=
Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-433/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148415v3/s=
hard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/36=
2">Intel XE#362</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8354 -&gt; IGT_8356</li>
<li>Linux: xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4 -&gt; xe-pw-148=
415v3</li>
</ul>
<p>IGT_8354: 59f7153426484367f58edfafb6567ce4e6a9e499 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8356: 4db4ba9b619fefa181cf0fc73cf8c35d282c61ae @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4: b5600d5671f0e468c0c73bc=
7a1de942097ddaab4<br />
  xe-pw-148415v3: 148415v3</p>

</body>
</html>

--===============2055209456891820556==--
