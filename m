Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097AFE7716C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 15:56:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC42910EEED;
	Thu,  5 Dec 2024 15:56:09 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB07C10EEE2;
 Thu,  5 Dec 2024 15:56:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4803431159976846935=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/tests=3A_Wait_for_c?=
 =?utf-8?q?lear_fence_operation_to_complete?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Dec 2024 15:56:08 -0000
Message-ID: <173341416894.3009605.3470462063042711641@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241205114702.1963303-1-nirmoy.das@intel.com>
In-Reply-To: <20241205114702.1963303-1-nirmoy.das@intel.com>
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

--===============4803431159976846935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/tests: Wait for clear fence operation to complete
URL   : https://patchwork.freedesktop.org/series/142169/
State : failure

== Summary ==

CI Bug Log - changes from xe-2323-6d42506688c08f85240449e80658ab760d899ae2_full -> xe-pw-142169v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142169v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142169v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142169v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_vm@munmap-style-unbind-userptr-many-end:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +14 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-2/igt@xe_vm@munmap-style-unbind-userptr-many-end.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@xe_vm@munmap-style-unbind-userptr-many-end.html

  
#### Warnings ####

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [FAIL][3] -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled:
    - shard-bmg:          [DMESG-WARN][7] ([Intel XE#3468]) -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled.html

  * igt@xe_exec_reset@virtual-close-execqueues-close-fd:
    - shard-bmg:          [DMESG-WARN][9] ([Intel XE#1727]) -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24], [FAIL][25], [FAIL][26], [FAIL][27], [FAIL][28], [FAIL][29], [FAIL][30], [FAIL][31], [FAIL][32], [FAIL][33], [FAIL][34], [FAIL][35]) ([Intel XE#3699]) -> ([FAIL][36], [FAIL][37], [FAIL][38], [FAIL][39], [FAIL][40], [FAIL][41], [FAIL][42], [FAIL][43], [FAIL][44], [FAIL][45], [FAIL][46], [FAIL][47], [FAIL][48], [FAIL][49], [FAIL][50], [FAIL][51], [FAIL][52], [FAIL][53], [FAIL][54], [FAIL][55], [FAIL][56], [FAIL][57], [FAIL][58], [FAIL][59], [FAIL][60])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-434/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-466/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-466/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-466/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-466/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-434/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-466/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-436/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-434/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-435/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-436/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-436/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-434/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-435/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-435/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-434/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-466/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-434/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-435/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-435/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-436/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-435/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-436/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-435/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-436/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-435/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-435/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-435/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-435/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-435/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-435/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-466/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-466/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-466/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-466/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-466/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-466/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-436/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-436/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-436/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-436/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-436/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-436/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-436/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-434/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-434/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-434/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-434/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-434/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-434/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-142169v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][61] -> [DMESG-WARN][62] ([Intel XE#3467] / [Intel XE#3468])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-1/igt@core_hotunplug@hotreplug.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@core_hotunplug@hotreplug.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [PASS][63] -> [DMESG-FAIL][64] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#324])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][65] -> [DMESG-FAIL][66] ([Intel XE#1033] / [Intel XE#1727]) +1 other test dmesg-fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [PASS][67] -> [DMESG-WARN][68] ([Intel XE#324]) +3 other tests dmesg-warn
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][69] ([Intel XE#3468]) +7 other tests dmesg-warn
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#1124]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][71] -> [SKIP][72] ([Intel XE#2314] / [Intel XE#2894])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#367])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2887])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2252]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2320]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-a-dp-2:
    - shard-bmg:          [PASS][77] -> [DMESG-FAIL][78] ([Intel XE#3468]) +5 other tests dmesg-fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-a-dp-2.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-a-dp-2.html

  * igt@kms_cursor_edge_walk@128x128-top-bottom:
    - shard-lnl:          [PASS][79] -> [FAIL][80] ([Intel XE#2577]) +1 other test fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-3/igt@kms_cursor_edge_walk@128x128-top-bottom.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-lnl-4/igt@kms_cursor_edge_walk@128x128-top-bottom.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [PASS][81] -> [SKIP][82] ([Intel XE#2291]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2323])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][84] -> [SKIP][85] ([Intel XE#2316]) +7 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2:
    - shard-bmg:          [PASS][86] -> [FAIL][87] ([Intel XE#2882]) +1 other test fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-1/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2293] / [Intel XE#2380])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2293])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:
    - shard-bmg:          [PASS][90] -> [DMESG-FAIL][91] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [FAIL][92] ([Intel XE#2333]) +1 other test fail
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][93] ([Intel XE#1727])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2311]) +5 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2312]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2313]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#3544])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][98] -> [SKIP][99] ([Intel XE#1503])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#1503])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@kms_hdr@static-swap.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][101] -> [FAIL][102] ([Intel XE#1430])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#1439] / [Intel XE#836])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#1489]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-cursor-render:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_psr@fbc-psr-cursor-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2414])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][107] -> [SKIP][108] ([Intel XE#1435])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][109] ([Intel XE#1727] / [Intel XE#3468]) +3 other tests dmesg-warn
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2168])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@kms_vrr@cmrr.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2905])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][112] ([Intel XE#1473])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-bmg:          NOTRUN -> [TIMEOUT][113] ([Intel XE#1473])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [PASS][114] -> [FAIL][115] ([Intel XE#1000])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-2/igt@xe_evict@evict-beng-threads-large.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-3/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          [PASS][116] -> [TIMEOUT][117] ([Intel XE#1473] / [Intel XE#2472])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-8/igt@xe_evict@evict-threads-large.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-2/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][118] ([Intel XE#1727]) +3 other tests dmesg-warn
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2322]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind:
    - shard-bmg:          [PASS][120] -> [DMESG-WARN][121] ([Intel XE#2705] / [Intel XE#3468])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-1/igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind:
    - shard-bmg:          [PASS][122] -> [DMESG-WARN][123] ([Intel XE#2705])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-adlp:         [PASS][124] -> [DMESG-WARN][125] ([Intel XE#3086]) +1 other test dmesg-warn
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-adlp:         [PASS][126] -> [DMESG-WARN][127] ([Intel XE#3086] / [Intel XE#3343])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][128] ([Intel XE#3467] / [Intel XE#3468]) +1 other test dmesg-warn
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][129] ([Intel XE#1727] / [Intel XE#3468])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#1192])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-bmg:          [PASS][131] -> [DMESG-WARN][132] ([Intel XE#3468]) +33 other tests dmesg-warn
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-2/igt@xe_oa@mmio-triggered-reports.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [PASS][133] -> [ABORT][134] ([Intel XE#1358] / [Intel XE#1607])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#579])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html

  
#### Possible fixes ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [DMESG-WARN][136] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][138] ([Intel XE#877]) -> [PASS][139] +1 other test pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-3/igt@kms_color@ctm-signed@pipe-b-hdmi-a-3.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_color@ctm-signed@pipe-b-hdmi-a-3.html

  * igt@kms_draw_crc@draw-method-blt@rgb565-4tiled:
    - shard-bmg:          [DMESG-WARN][140] -> [PASS][141] +1 other test pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html

  * igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:
    - shard-bmg:          [DMESG-FAIL][142] ([Intel XE#2705]) -> [PASS][143] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-bmg:          [INCOMPLETE][144] ([Intel XE#2635]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][146] -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-3/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a3.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a3.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [FAIL][148] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [FAIL][150] ([Intel XE#886]) -> [PASS][151] +1 other test pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_flip@plain-flip-ts-check@b-dp2:
    - shard-bmg:          [FAIL][152] ([Intel XE#2882]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-2/igt@kms_flip@plain-flip-ts-check@b-dp2.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-8/igt@kms_flip@plain-flip-ts-check@b-dp2.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-linear:
    - shard-bmg:          [DMESG-FAIL][154] ([Intel XE#3468]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-linear.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-linear.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][156] ([Intel XE#2029]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][158] ([Intel XE#2883]) -> [PASS][159] +1 other test pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-4/igt@kms_setmode@basic.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-3/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][160] ([Intel XE#2883]) -> [PASS][161] +2 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][162] ([Intel XE#899]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_exec_compute_mode@non-blocking:
    - shard-bmg:          [DMESG-WARN][164] ([Intel XE#3468]) -> [PASS][165] +9 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-8/igt@xe_exec_compute_mode@non-blocking.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@xe_exec_compute_mode@non-blocking.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-adlp:         [DMESG-WARN][166] ([Intel XE#3086]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][168] ([Intel XE#958]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [DMESG-FAIL][170] ([Intel XE#3468]) -> [DMESG-WARN][171] ([Intel XE#3468]) +4 other tests dmesg-warn
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [DMESG-WARN][172] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-FAIL][173] ([Intel XE#1727] / [Intel XE#3468])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-WARN][174] ([Intel XE#324]) -> [FAIL][175] ([Intel XE#1231])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_color@deep-color:
    - shard-bmg:          [DMESG-WARN][176] ([Intel XE#3468]) -> [DMESG-FAIL][177] ([Intel XE#3468]) +7 other tests dmesg-fail
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-4/igt@kms_color@deep-color.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-3/igt@kms_color@deep-color.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          [DMESG-WARN][178] ([Intel XE#3468]) -> [SKIP][179] ([Intel XE#2291])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][180] ([Intel XE#2882]) -> [SKIP][181] ([Intel XE#2316])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          [DMESG-WARN][182] ([Intel XE#3468]) -> [SKIP][183] ([Intel XE#2316]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [ABORT][184] ([Intel XE#3468]) -> [SKIP][185] ([Intel XE#2316])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-bmg:          [DMESG-FAIL][186] ([Intel XE#3468]) -> [INCOMPLETE][187] ([Intel XE#1727] / [Intel XE#3468])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:
    - shard-bmg:          [DMESG-WARN][188] ([Intel XE#2705]) -> [DMESG-FAIL][189] ([Intel XE#2705] / [Intel XE#3468])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][190] ([Intel XE#2311]) -> [SKIP][191] ([Intel XE#2312]) +23 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-bmg:          [INCOMPLETE][192] ([Intel XE#1727] / [Intel XE#2050]) -> [DMESG-FAIL][193] ([Intel XE#3468])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [FAIL][194] ([Intel XE#2333]) -> [DMESG-FAIL][195] ([Intel XE#3468])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [FAIL][196] ([Intel XE#2333]) -> [SKIP][197] ([Intel XE#2312]) +5 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [DMESG-FAIL][198] ([Intel XE#3468]) -> [SKIP][199] ([Intel XE#2312]) +3 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][200] ([Intel XE#2313]) -> [SKIP][201] ([Intel XE#2312]) +17 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][202] ([Intel XE#2426]) -> [FAIL][203] ([Intel XE#1729])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-bmg:          [INCOMPLETE][204] ([Intel XE#1473]) -> [INCOMPLETE][205] ([Intel XE#1473] / [Intel XE#3468])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-bmg:          [DMESG-WARN][206] -> [DMESG-WARN][207] ([Intel XE#3468])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@xe_exec_reset@gt-reset-stress.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-8/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [DMESG-WARN][208] ([Intel XE#1727]) -> [DMESG-WARN][209] ([Intel XE#1727] / [Intel XE#3467])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-bmg:          [DMESG-WARN][210] ([Intel XE#3343]) -> [DMESG-WARN][211] ([Intel XE#3343] / [Intel XE#3468])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [DMESG-WARN][212] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][213] ([Intel XE#3467])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-bmg:          [DMESG-WARN][214] ([Intel XE#3467]) -> [DMESG-WARN][215] ([Intel XE#3467] / [Intel XE#3468])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_pm@s2idle-basic:
    - shard-lnl:          [ABORT][216] ([Intel XE#1358]) -> [ABORT][217] ([Intel XE#1358] / [Intel XE#3673])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-4/igt@xe_pm@s2idle-basic.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-lnl-5/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s4-basic-exec:
    - shard-bmg:          [DMESG-WARN][218] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-WARN][219] ([Intel XE#3468])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-2/igt@xe_pm@s4-basic-exec.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-bmg:          [DMESG-WARN][220] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468]) -> [DMESG-WARN][221] ([Intel XE#2280] / [Intel XE#3468])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@xe_pm@s4-vm-bind-userptr.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [DMESG-WARN][222] ([Intel XE#2919]) -> [DMESG-WARN][223] ([Intel XE#2919] / [Intel XE#3468])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-1/igt@xe_wedged@basic-wedged.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3673]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673
  [Intel XE#3699]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3699
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2323-6d42506688c08f85240449e80658ab760d899ae2 -> xe-pw-142169v1

  IGT_8138: 8138
  xe-2323-6d42506688c08f85240449e80658ab760d899ae2: 6d42506688c08f85240449e80658ab760d899ae2
  xe-pw-142169v1: 142169v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/index.html

--===============4803431159976846935==
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
<tr><td><b>Series:</b></td><td>drm/xe/tests: Wait for clear fence operation=
 to complete</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142169/">https://patchwork.freedesktop.org/series/142169/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142169v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142169v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2323-6d42506688c08f85240449e80658ab760=
d899ae2_full -&gt; xe-pw-142169v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142169v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-142169v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1421=
69v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_vm@munmap-style-unbind-userptr-many-end:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-2/igt@xe_vm@mu=
nmap-style-unbind-userptr-many-end.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@xe_vm@munm=
ap-style-unbind-userptr-many-end.html">DMESG-WARN</a> +14 other tests dmesg=
-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-2/igt@kms_asy=
nc_flips@crc-atomic@pipe-c-hdmi-a-1.html">FAIL</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-adlp-2/igt@kms_asyn=
c_flips@crc-atomic@pipe-c-hdmi-a-1.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-2/igt@kms_asy=
nc_flips@crc-atomic@pipe-d-hdmi-a-1.html">DMESG-FAIL</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-adlp-2/igt@km=
s_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-2/igt@kms_draw=
_crc@draw-method-blt@xrgb2101010-xtiled.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/s=
hard-bmg-4/igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled.html">FAIL</=
a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-close-execqueues-close-fd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@xe_exec_=
reset@virtual-close-execqueues-close-fd.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/s=
hard-bmg-4/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html">DMESG-=
WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-434/igt@xe_mo=
dule_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-466/igt=
@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-4=
66/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard=
-dg2-466/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2=
/shard-dg2-466/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d=
899ae2/shard-dg2-434/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658=
ab760d899ae2/shard-dg2-466/igt@xe_module_load@load.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f8524044=
9e80658ab760d899ae2/shard-dg2-436/igt@xe_module_load@load.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f8=
5240449e80658ab760d899ae2/shard-dg2-434/igt@xe_module_load@load.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d4250668=
8c08f85240449e80658ab760d899ae2/shard-dg2-435/igt@xe_module_load@load.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d4=
2506688c08f85240449e80658ab760d899ae2/shard-dg2-436/igt@xe_module_load@load=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-23=
23-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-436/igt@xe_module_loa=
d@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-434/igt@xe_modu=
le_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-435/igt@x=
e_module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-435=
/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-d=
g2-434/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/s=
hard-dg2-466/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d89=
9ae2/shard-dg2-434/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab=
760d899ae2/shard-dg2-435/igt@xe_module_load@load.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e8=
0658ab760d899ae2/shard-dg2-435/igt@xe_module_load@load.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f8524=
0449e80658ab760d899ae2/shard-dg2-436/igt@xe_module_load@load.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c0=
8f85240449e80658ab760d899ae2/shard-dg2-435/igt@xe_module_load@load.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d4250=
6688c08f85240449e80658ab760d899ae2/shard-dg2-436/igt@xe_module_load@load.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-=
6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-435/igt@xe_module_load@l=
oad.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-dg2-436/igt@xe_module_=
load@load.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3699">Intel XE#3699</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-435/igt@xe_module_load@lo=
ad.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142169v1/shard-dg2-435/igt@xe_module_load@load.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-435/=
igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-142169v1/shard-dg2-435/igt@xe_module_load@load.html=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
69v1/shard-dg2-435/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-435/igt@xe_mo=
dule_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-142169v1/shard-dg2-466/igt@xe_module_load@load.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shar=
d-dg2-466/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-466/igt@xe_module_load=
@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-142169v1/shard-dg2-466/igt@xe_module_load@load.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-466=
/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-466/igt@xe_module_load@load.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
169v1/shard-dg2-436/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-436/igt@xe_m=
odule_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-142169v1/shard-dg2-436/igt@xe_module_load@load.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/sha=
rd-dg2-436/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-436/igt@xe_module_loa=
d@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-142169v1/shard-dg2-436/igt@xe_module_load@load.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-43=
6/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-434/igt@xe_module_load@load.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2169v1/shard-dg2-434/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-434/igt@xe_=
module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-142169v1/shard-dg2-434/igt@xe_module_load@load.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/sh=
ard-dg2-434/igt@xe_module_load@load.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-dg2-434/igt@xe_module_lo=
ad@load.html">FAIL</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142169v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-1/igt@core_hot=
unplug@hotreplug.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@core_hotunplug@hotreplug.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3467">Intel XE#3467</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-4/igt@kms_asy=
nc_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-adlp-6/igt@kms_async=
_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#172=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"=
>Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-4/igt@kms_asy=
nc_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-adlp=
-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-6/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/s=
hard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdm=
i-a-1-y.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-str=
ide-32bpp-rotate-180-async-flip.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +7 other=
 tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-64bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-1/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/ig=
t@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_bw@linear-tiling-2-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-for-=
each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscre=
en-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-1/igt@kms_curs=
or_crc@cursor-offscreen-64x64@pipe-a-dp-2.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@kms=
_cursor_crc@cursor-offscreen-64x64@pipe-a-dp-2.html">DMESG-FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#346=
8</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-bottom:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-3/igt@kms_curs=
or_edge_walk@128x128-top-bottom.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-lnl-4/igt@kms_cursor_ed=
ge_walk@128x128-top-bottom.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-8/igt@kms_curs=
or_legacy@cursorb-vs-flipb-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@kms_cursor_=
legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_display_modes@mst-extende=
d-mode-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2323">Intel XE#2323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/ig=
t@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2=
316</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-1/igt@kms_flip=
@basic-flip-vs-wf_vblank@b-dp2.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-7/igt@kms_flip@basic=
-flip-vs-wf_vblank@b-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bp=
p-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bp=
p-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#=
2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@kms_flip=
_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-8/ig=
t@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html">DMESG-FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
1p-offscren-pri-indfb-draw-render.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other tes=
t fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
tiling-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-2/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@kms_hdr@static-swap.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"=
>Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-3/igt@kms_pm_d=
c@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-142169v1/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel=
 XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plan=
e-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_psr@fbc-psr-cursor-render=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-2/igt@kms_setm=
ode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@kms_setmode@clone-ex=
clusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@kms_vblank@ts-continuation-dp=
ms-rpm@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 =
other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@kms_vrr@cmrr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@xe_eudebug@discovery-empty-cl=
ients.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@xe_evict@evict-beng-mixed-man=
y-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@xe_evict@evict-beng-mixed-thr=
eads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-2/igt@xe_evict=
@evict-beng-threads-large.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-3/igt@xe_evict@evict-beng=
-threads-large.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-8/igt@xe_evict=
@evict-threads-large.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-2/igt@xe_evict@evict-threads-l=
arge.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1473">Intel XE#1473</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@xe_exec_basic@many-bindexecqu=
eue-rebind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1727">Intel XE#1727</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-1/igt@xe_exec_=
threads@threads-bal-shared-vm-userptr-rebind.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/ig=
t@xe_exec_threads@threads-bal-shared-vm-userptr-rebind.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Inte=
l XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@xe_exec_=
threads@threads-cm-shared-vm-userptr-rebind.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@x=
e_exec_threads@threads-cm-shared-vm-userptr-rebind.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-4/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_guc_ads_init.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard=
-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3086">Intel XE#3086</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-6/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_guc_ct_init.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-=
adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3086">Intel XE#3086</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@xe_fault_injection@inject-fau=
lt-probe-function-xe_sriov_init.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@xe_gt_freq@freq_suspend.html"=
>DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@xe_live_ktest@xe_dma_buf.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-2/igt@xe_oa@mm=
io-triggered-reports.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@xe_oa@mmio-triggered-rep=
orts.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3468">Intel XE#3468</a>) +33 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-6/igt@xe_pm@s=
4-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-142169v1/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-8/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"=
>Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142169v1/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-r=
otate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-3/igt@kms_colo=
r@ctm-signed@pipe-b-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/ig=
t@kms_color@ctm-signed@pipe-b-hdmi-a-3.html">PASS</a> +1 other test pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@rgb565-4tiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-2/igt@kms_draw=
_crc@draw-method-blt@rgb565-4tiled.html">DMESG-WARN</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@kms_=
draw_crc@draw-method-blt@rgb565-4tiled.html">PASS</a> +1 other test pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-2/igt@kms_draw=
_crc@draw-method-blt@xrgb8888-4tiled.html">DMESG-FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shar=
d-bmg-4/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-3/igt@kms_flip=
@flip-vs-absolute-wf_vblank.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/i=
gt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-3/igt@kms_flip=
@flip-vs-absolute-wf_vblank@b-hdmi-a3.html">INCOMPLETE</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@k=
ms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-3/igt@kms_flip=
@plain-flip-fb-recreate@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shar=
d-lnl-4/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-3/igt@kms_flip=
@plain-flip-ts-check@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-lnl-4/igt@kms_f=
lip@plain-flip-ts-check@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-2/igt@kms_flip=
@plain-flip-ts-check@b-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-8/igt@kms_=
flip@plain-flip-ts-check@b-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-linear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@kms_flip=
_tiling@flip-change-tiling@pipe-a-dp-2-4-to-linear.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE=
#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-142169v1/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-=
to-linear.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-8/igt@kms_pm_d=
c@deep-pkgc.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2029">Intel XE#2029</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-4/igt@kms_setm=
ode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-3/igt@kms_setmode@basic.htm=
l">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-3/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-lnl-4/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-4/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-lnl=
-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@non-blocking:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-8/igt@xe_exec_=
compute_mode@non-blocking.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/ig=
t@xe_exec_compute_mode@non-blocking.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-3/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_sriov_init.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel=
 XE#3086</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-142169v1/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-functio=
n-xe_sriov_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-4/igt@xe_pm_re=
sidency@toggle-gt-c6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-lnl-5/igt@xe_pm_reside=
ncy@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">DMESG-FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/s=
hard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
68">Intel XE#3468</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-3/igt@kms_big_=
fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#17=
27</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/346=
8">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-142169v1/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp=
-rotate-180-hflip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-adlp-1/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">=
Intel XE#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-142169v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-ro=
tate-180-hflip-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-4/igt@kms_colo=
r@deep-color.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-3/igt@kms_color@de=
ep-color.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3468">Intel XE#3468</a>) +7 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-b=
mg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-=
5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-5/igt@kms_flip@2=
x-flip-vs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@kms_flip=
_tiling@flip-change-tiling.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-8/ig=
t@kms_flip_tiling@flip-change-tiling.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE=
#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@kms_flip=
_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
69v1/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.=
html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
169v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">INCOMPLETE</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#17=
27</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/205=
0">Intel XE#2050</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-142169v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primsc=
rn-cur-indfb-move.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
69v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-=
blt.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2=
333</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42169v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">DMESG-FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3=
468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42169v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@psr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/sha=
rd-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">=
Intel XE#2312</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-8/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-1/igt@km=
s_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-2/igt@xe_evict=
@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shar=
d-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">In=
tel XE#1473</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@xe_exec_=
reset@gt-reset-stress.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-8/igt@xe_exec_reset@gt-=
reset-stress.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-3/igt@xe_fault=
_injection@inject-fault-probe-function-wait_for_lmem_ready.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">=
Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-142169v1/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-fun=
ction-wait_for_lmem_ready.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@xe_fault=
_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel=
 XE#3343</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-142169v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function=
-xe_guc_ct_init.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-1/igt@xe_fault=
_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3=
467</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
68">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-142169v1/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_pt=
_update_ops_prepare.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-1/igt@xe_fault=
_injection@vm-bind-fail-xe_pt_update_ops_run.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
69v1/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3467">Intel XE#3467</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-lnl-4/igt@xe_pm@s2=
idle-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-lnl-5/igt@xe_pm@s2idle-basic.=
html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3673">Intel XE#3673</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-2/igt@xe_pm@s4=
-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/ig=
t@xe_pm@s4-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-5/igt@xe_pm@s4=
-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
69v1/shard-bmg-4/igt@xe_pm@s4-vm-bind-userptr.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"=
>Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/shard-bmg-1/igt@xe_wedge=
d@basic-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2919">Intel XE#2919</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/shard-bmg-4/igt@xe_wedged@=
basic-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2919">Intel XE#2919</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2323-6d42506688c08f85240449e80658ab760d899ae2 -&gt; xe-pw-142=
169v1</li>
</ul>
<p>IGT_8138: 8138<br />
  xe-2323-6d42506688c08f85240449e80658ab760d899ae2: 6d42506688c08f85240449e=
80658ab760d899ae2<br />
  xe-pw-142169v1: 142169v1</p>

</body>
</html>

--===============4803431159976846935==--
