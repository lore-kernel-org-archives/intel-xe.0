Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C978C3600B
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 23:29:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CF310E22E;
	Thu, 27 Mar 2025 23:29:35 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2E310E18C;
 Thu, 27 Mar 2025 23:29:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4657121541685225519=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/xe2hpg=3A_Add_Wa=5F?=
 =?utf-8?q?16025250150_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aradhya Bhatia" <aradhya.bhatia@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Mar 2025 23:29:35 -0000
Message-ID: <174311817504.13007.12492813581667605313@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250325134421.1489416-1-aradhya.bhatia@intel.com>
In-Reply-To: <20250325134421.1489416-1-aradhya.bhatia@intel.com>
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

--===============4657121541685225519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2hpg: Add Wa_16025250150 (rev2)
URL   : https://patchwork.freedesktop.org/series/146709/
State : failure

== Summary ==

CI Bug Log - changes from xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def_FULL -> xe-pw-146709v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-146709v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-146709v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-146709v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:
    - shard-lnl:          [PASS][1] -> ([PASS][2], [INCOMPLETE][3]) +1 other test ( 1 incomplete, 1 pass )
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_vblank@query-busy-hang:
    - shard-dg2-set2:     [PASS][5] -> ([INCOMPLETE][6], [PASS][7]) +2 other tests ( 1 incomplete, 1 pass )
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_vblank@query-busy-hang.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_vblank@query-busy-hang.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_vblank@query-busy-hang.html

  * igt@kms_vblank@query-busy-hang@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_vblank@query-busy-hang@pipe-d-dp-2.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_compute0:
    - shard-lnl:          [PASS][9] -> [INCOMPLETE][10] +1 other test incomplete
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-lnl-4/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_compute0.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-7/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_compute0.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue:
    - shard-bmg:          [PASS][11] -> ([PASS][12], [ABORT][13])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-3/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html
    - shard-dg2-set2:     [PASS][14] -> ([ABORT][15], [PASS][16])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-435/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-436/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html

  
Known issues
------------

  Here are the changes found in xe-pw-146709v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-adlp:         [PASS][17] -> ([PASS][18], [DMESG-WARN][19]) ([Intel XE#4173])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-2/igt@core_hotunplug@hotrebind-lateclose.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@core_hotunplug@hotrebind-lateclose.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-4/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#3767]) +7 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][21], [SKIP][22]) ([Intel XE#3767]) +7 other tests ( 2 skip )
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#3768])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#3279])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][26] -> ([FAIL][27], [PASS][28]) ([Intel XE#3908]) +1 other test ( 1 fail, 1 pass )
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1407]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> ([PASS][30], [INCOMPLETE][31]) ([Intel XE#3225])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#316]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-adlp:         NOTRUN -> ([SKIP][33], [SKIP][34]) ([Intel XE#619])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_big_fb@4-tiled-addfb.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-9/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2327]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         [PASS][36] -> ([PASS][37], [DMESG-FAIL][38]) ([Intel XE#4543]) +4 other tests ( 1 dmesg-fail, 1 pass )
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][39] ([Intel XE#4543])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> ([SKIP][40], [SKIP][41]) ([Intel XE#1124]) +2 other tests ( 2 skip )
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#610])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> ([SKIP][43], [SKIP][44]) ([Intel XE#1124])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> ([SKIP][45], [SKIP][46]) ([Intel XE#2328])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#619])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1467])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1477])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1124]) +4 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#1124]) +9 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][52], [SKIP][53]) ([Intel XE#1124]) +1 other test ( 2 skip )
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1124]) +4 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1124]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#2191])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][57], [SKIP][58]) ([Intel XE#2191])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1512])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2314] / [Intel XE#2894])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][61], [SKIP][62]) ([Intel XE#367])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#367]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> ([SKIP][64], [SKIP][65]) ([Intel XE#367])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#367])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-6/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#367])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#367])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][69], [SKIP][70]) ([Intel XE#2887]) +3 other tests ( 2 skip )
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2887]) +7 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][72], [SKIP][73]) ([Intel XE#787]) +58 other tests ( 2 skip )
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-6.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-adlp:         NOTRUN -> ([SKIP][74], [SKIP][75]) ([Intel XE#455] / [Intel XE#787]) +5 other tests ( 2 skip )
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][76], [SKIP][77]) ([Intel XE#455] / [Intel XE#787]) +15 other tests ( 2 skip )
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#2669]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> ([SKIP][79], [SKIP][80]) ([Intel XE#787]) +8 other tests ( 2 skip )
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][81] -> ([PASS][82], [INCOMPLETE][83]) ([Intel XE#3862])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> ([PASS][84], [INCOMPLETE][85]) ([Intel XE#3862])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][86] -> ([PASS][87], [INCOMPLETE][88]) ([Intel XE#3862])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][89] ([Intel XE#3862])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#787]) +171 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#3432])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#2887]) +5 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#787]) +14 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][94], [SKIP][95]) ([Intel XE#2887])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> ([SKIP][97], [SKIP][98]) ([Intel XE#2907])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-9/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][99] -> ([INCOMPLETE][100], [INCOMPLETE][101]) ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345] / [Intel XE#4522])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([DMESG-WARN][102], [PASS][103]) ([Intel XE#1727] / [Intel XE#3113])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][104], [INCOMPLETE][105]) ([Intel XE#2705] / [Intel XE#3124] / [Intel XE#4345] / [Intel XE#4522])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2652] / [Intel XE#787]) +25 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#455] / [Intel XE#787]) +36 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2724])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#4417]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#4416]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#306])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_chamelium_color@ctm-green-to-red.html
    - shard-lnl:          NOTRUN -> ([SKIP][112], [SKIP][113]) ([Intel XE#306])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_chamelium_color@ctm-green-to-red.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-1/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][114], [SKIP][115]) ([Intel XE#306])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#306]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-5/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@degamma:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#306]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-6/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> ([SKIP][118], [SKIP][119]) ([Intel XE#373]) +2 other tests ( 2 skip )
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-4/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2252]) +9 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#373]) +4 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@kms_chamelium_edid@hdmi-edid-read.html
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#373]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][123], [SKIP][124]) ([Intel XE#373]) +1 other test ( 2 skip )
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_chamelium_frames@dp-crc-single.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-bmg:          NOTRUN -> ([SKIP][125], [SKIP][126]) ([Intel XE#2252]) +2 other tests ( 2 skip )
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#373])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
    - shard-lnl:          NOTRUN -> ([SKIP][128], [SKIP][129]) ([Intel XE#373])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][130] ([Intel XE#1178]) +1 other test fail
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#307])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#307])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][133] ([Intel XE#1178]) +5 other tests fail
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> ([SKIP][134], [SKIP][135]) ([Intel XE#2320]) +1 other test ( 2 skip )
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html
    - shard-lnl:          NOTRUN -> ([SKIP][136], [SKIP][137]) ([Intel XE#1424])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#1424]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2321])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-adlp:         NOTRUN -> ([SKIP][140], [SKIP][141]) ([Intel XE#308])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-6/igt@kms_cursor_crc@cursor-random-512x512.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#2320]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          NOTRUN -> ([SKIP][143], [SKIP][144]) ([Intel XE#2321])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#308])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#309])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
    - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#309])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][148] -> ([PASS][149], [SKIP][150]) ([Intel XE#2291]) +5 other tests ( 1 pass, 1 skip )
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#2291]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
    - shard-dg2-set2:     [PASS][152] -> ([PASS][153], [SKIP][154]) ([Intel XE#309]) +4 other tests ( 1 pass, 1 skip )
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-433/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-bmg:          NOTRUN -> ([PASS][155], [INCOMPLETE][156]) ([Intel XE#3226])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#2286]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-dg2-set2:     [PASS][158] -> [SKIP][159] ([Intel XE#309]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2-set2:     [PASS][160] -> ([SKIP][161], [SKIP][162]) ([Intel XE#309])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][163] -> ([PASS][164], [SKIP][165]) ([Intel XE#1340])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#1340])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          NOTRUN -> ([SKIP][167], [SKIP][168]) ([Intel XE#4354])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_dp_link_training@uhbr-sst.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst.html
    - shard-lnl:          NOTRUN -> ([SKIP][169], [SKIP][170]) ([Intel XE#4354])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_dp_link_training@uhbr-sst.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-4/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#2244]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-adlp:         NOTRUN -> ([SKIP][172], [SKIP][173]) ([Intel XE#4422])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][174], [SKIP][175]) ([Intel XE#4422])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][176] ([Intel XE#776])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][177] -> ([SKIP][178], [SKIP][179]) ([Intel XE#2373])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-8/igt@kms_feature_discovery@display-2x.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-busy-flip:
    - shard-bmg:          [PASS][180] -> ([INCOMPLETE][181], [SKIP][182]) ([Intel XE#2049] / [Intel XE#2316])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-7/igt@kms_flip@2x-busy-flip.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_flip@2x-busy-flip.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-busy-flip@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][183] -> [INCOMPLETE][184] ([Intel XE#2049])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-7/igt@kms_flip@2x-busy-flip@bd-dp2-hdmi-a3.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_flip@2x-busy-flip@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-dg2-set2:     [PASS][185] -> ([SKIP][186], [PASS][187]) ([Intel XE#310]) +8 other tests ( 1 pass, 1 skip )
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-463/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-dpms-vs-vblank-race@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][188], [PASS][189]) ([Intel XE#3098])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race@ab-hdmi-a6-dp4.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_flip@2x-dpms-vs-vblank-race@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][190] -> [SKIP][191] ([Intel XE#310]) +3 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-463/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-adlp:         NOTRUN -> ([SKIP][192], [SKIP][193]) ([Intel XE#310])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][194] ([Intel XE#301]) +2 other tests fail
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a2-dp2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> ([PASS][195], [FAIL][196]) ([Intel XE#301]) +4 other tests ( 1 fail, 1 pass )
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][197], [FAIL][198]) ([Intel XE#301])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-dg2-set2:     NOTRUN -> [SKIP][199] ([Intel XE#310])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [PASS][200] -> [SKIP][201] ([Intel XE#2316])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][202] -> ([PASS][203], [SKIP][204]) ([Intel XE#2316]) +12 other tests ( 1 pass, 1 skip )
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][205] ([Intel XE#310]) +3 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@kms_flip@2x-plain-flip-interruptible.html
    - shard-lnl:          NOTRUN -> [SKIP][206] ([Intel XE#1421]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-1/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [PASS][207] -> ([SKIP][208], [SKIP][209]) ([Intel XE#2316]) +1 other test ( 2 skip )
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][210] ([Intel XE#2316]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][211] -> [FAIL][212] ([Intel XE#301]) +1 other test fail
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][213] -> [FAIL][214] ([Intel XE#301])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [PASS][215] -> [INCOMPLETE][216] ([Intel XE#2049] / [Intel XE#2597])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][217] ([Intel XE#2049] / [Intel XE#2597])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-hdmi-a2.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
    - shard-lnl:          [PASS][218] -> ([FAIL][219], [PASS][220]) ([Intel XE#886]) +3 other tests ( 1 fail, 1 pass )
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][221] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][222] ([Intel XE#1401]) +5 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> ([SKIP][223], [SKIP][224]) ([Intel XE#2293] / [Intel XE#2380])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> ([SKIP][225], [SKIP][226]) ([Intel XE#2293])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][227], [SKIP][228]) ([Intel XE#1401] / [Intel XE#1745])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][229], [SKIP][230]) ([Intel XE#1401])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][231], [SKIP][232]) ([Intel XE#455]) +3 other tests ( 2 skip )
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][233] ([Intel XE#1401] / [Intel XE#1745]) +5 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][234] ([Intel XE#455]) +4 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][235] ([Intel XE#455]) +11 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][236] ([Intel XE#2293]) +3 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][237] ([Intel XE#651]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][238], [SKIP][239]) ([Intel XE#651] / [Intel XE#656])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][240], [SKIP][241]) ([Intel XE#2311] / [Intel XE#2312])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][242] ([Intel XE#656]) +12 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-rte.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][243] ([Intel XE#2311]) +18 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][244], [SKIP][245]) ([Intel XE#651]) +4 other tests ( 2 skip )
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [PASS][246] -> ([PASS][247], [SKIP][248]) ([Intel XE#656]) +4 other tests ( 1 pass, 1 skip )
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][249], [SKIP][250]) ([Intel XE#4141]) +2 other tests ( 2 skip )
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> ([SKIP][251], [SKIP][252]) ([Intel XE#2312] / [Intel XE#4141])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][253], [PASS][254]) ([Intel XE#656])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][255] -> [SKIP][256] ([Intel XE#656]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][257] ([Intel XE#4141]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [PASS][258] -> ([SKIP][259], [SKIP][260]) ([Intel XE#656])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][261] ([Intel XE#2312]) +15 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> ([SKIP][262], [SKIP][263]) ([Intel XE#651]) +1 other test ( 2 skip )
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> ([SKIP][264], [SKIP][265]) ([Intel XE#2311]) +6 other tests ( 2 skip )
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][266] ([Intel XE#651]) +7 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
    - shard-lnl:          NOTRUN -> ([SKIP][267], [SKIP][268]) ([Intel XE#651]) +1 other test ( 2 skip )
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][269] ([Intel XE#656]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> ([SKIP][270], [SKIP][271]) ([Intel XE#656]) +8 other tests ( 2 skip )
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][272] ([Intel XE#651]) +3 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> ([SKIP][273], [SKIP][274]) ([Intel XE#653])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][275] ([Intel XE#653]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][276], [SKIP][277]) ([Intel XE#2312] / [Intel XE#2313]) +2 other tests ( 2 skip )
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
    - shard-lnl:          NOTRUN -> ([SKIP][278], [SKIP][279]) ([Intel XE#656]) +1 other test ( 2 skip )
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> ([SKIP][280], [SKIP][281]) ([Intel XE#2313]) +5 other tests ( 2 skip )
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][282] ([Intel XE#656]) +14 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> ([SKIP][283], [SKIP][284]) ([Intel XE#2312])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][285] ([Intel XE#653]) +7 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][286], [SKIP][287]) ([Intel XE#653]) +4 other tests ( 2 skip )
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][288] ([Intel XE#2313]) +20 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][289], [SKIP][290]) ([Intel XE#605])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html
    - shard-lnl:          NOTRUN -> ([SKIP][291], [SKIP][292]) ([Intel XE#605])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_getfb@getfb-reject-ccs.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-4/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-adlp:         NOTRUN -> ([SKIP][293], [SKIP][294]) ([Intel XE#1339])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-4/igt@kms_getfb@getfb2-accept-ccs.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][295] -> ([SKIP][296], [SKIP][297]) ([Intel XE#455])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_hdr@invalid-hdr.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_hdr@invalid-hdr.html
    - shard-bmg:          [PASS][298] -> [SKIP][299] ([Intel XE#1503])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-adlp:         NOTRUN -> ([SKIP][300], [SKIP][301]) ([Intel XE#346])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-4/igt@kms_joiner@basic-big-joiner.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][302] ([Intel XE#4298])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> ([SKIP][303], [SKIP][304]) ([Intel XE#2927])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][305] ([Intel XE#2925])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][306], [SKIP][307]) ([Intel XE#2927])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][308] ([Intel XE#616])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][309] ([Intel XE#599])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-4/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-adlp:         NOTRUN -> ([SKIP][310], [SKIP][311]) ([Intel XE#455]) +3 other tests ( 2 skip )
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-6/igt@kms_plane_multiple@tiling-yf.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [ABORT][312] ([Intel XE#4502] / [Intel XE#4540])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][313], [SKIP][314]) ([Intel XE#2763] / [Intel XE#455]) +1 other test ( 2 skip )
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][315], [SKIP][316]) ([Intel XE#2763]) +2 other tests ( 2 skip )
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> ([SKIP][317], [SKIP][318]) ([Intel XE#2763] / [Intel XE#455]) +1 other test ( 2 skip )
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-adlp:         NOTRUN -> ([SKIP][319], [SKIP][320]) ([Intel XE#2763]) +2 other tests ( 2 skip )
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][321] ([Intel XE#2763]) +3 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][322] ([Intel XE#2763]) +2 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][323] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][324] ([Intel XE#870])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-adlp:         NOTRUN -> ([SKIP][325], [SKIP][326]) ([Intel XE#2938])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_pm_backlight@brightness-with-dpms.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][327] ([Intel XE#3309])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-lnl:          NOTRUN -> [SKIP][328] ([Intel XE#3309])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-1/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> ([SKIP][329], [SKIP][330]) ([Intel XE#2499])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> ([SKIP][331], [SKIP][332]) ([Intel XE#836])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> ([SKIP][333], [SKIP][334]) ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][335] -> [SKIP][336] ([Intel XE#836]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][337] ([Intel XE#1489]) +2 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][338], [SKIP][339]) ([Intel XE#1489])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][340] ([Intel XE#1489]) +2 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> ([SKIP][341], [SKIP][342]) ([Intel XE#1489]) +2 other tests ( 2 skip )
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> ([FAIL][343], [FAIL][344]) ([Intel XE#4570]) +2 other tests ( 2 fail )
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> ([SKIP][345], [SKIP][346]) ([Intel XE#1489])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][347] ([Intel XE#2893])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][348] ([Intel XE#1489]) +4 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][349] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][350] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-adlp:         NOTRUN -> ([SKIP][351], [SKIP][352]) ([Intel XE#2850] / [Intel XE#929])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_psr@fbc-pr-primary-render.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@kms_psr@fbc-pr-primary-render.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][353] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][354], [SKIP][355]) ([Intel XE#2234] / [Intel XE#2850]) +3 other tests ( 2 skip )
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-blt.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@pr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][356] ([Intel XE#1406]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-6/igt@kms_psr@pr-basic.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][357], [SKIP][358]) ([Intel XE#2850] / [Intel XE#929]) +5 other tests ( 2 skip )
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_psr@pr-sprite-blt.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][359] ([Intel XE#1127])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][360] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][361] ([Intel XE#2330])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][362] ([Intel XE#3414])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][363] -> ([FAIL][364], [PASS][365]) ([Intel XE#2883]) +2 other tests ( 1 fail, 1 pass )
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][366] -> ([PASS][367], [SKIP][368]) ([Intel XE#1435])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_setmode@clone-exclusive-crtc.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html
    - shard-dg2-set2:     [PASS][369] -> ([SKIP][370], [PASS][371]) ([Intel XE#455])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-463/igt@kms_setmode@clone-exclusive-crtc.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          NOTRUN -> ([SKIP][372], [PASS][373]) ([Intel XE#1435])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][374] ([Intel XE#1499]) +2 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> ([SKIP][375], [SKIP][376]) ([Intel XE#2168])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_vrr@lobf.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_vrr@lobf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][377] ([Intel XE#2168])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_vrr@lobf.html
    - shard-lnl:          NOTRUN -> [SKIP][378] ([Intel XE#1499])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_vrr@lobf.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-adlp:         NOTRUN -> [SKIP][379] ([Intel XE#455] / [Intel XE#488])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-6/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
    - shard-lnl:          [PASS][380] -> ([PASS][381], [FAIL][382]) ([Intel XE#4278]) +1 other test ( 1 fail, 1 pass )
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-lnl-1/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-1/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-3/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][383] ([Intel XE#1126])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][384] ([Intel XE#1126])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-6/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][385], [SKIP][386]) ([Intel XE#944])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@xe_create@multigpu-create-massive-size.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@xe_create@multigpu-create-massive-size.html
    - shard-lnl:          NOTRUN -> [SKIP][387] ([Intel XE#944]) +1 other test skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-6/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eu_stall@blocking-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][388] ([Intel XE#4497])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][389] ([Intel XE#2905]) +3 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@xe_eudebug@basic-close.html
    - shard-lnl:          NOTRUN -> [SKIP][390] ([Intel XE#2905]) +3 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-7/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-bmg:          NOTRUN -> ([SKIP][391], [SKIP][392]) ([Intel XE#2905]) +3 other tests ( 2 skip )
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@xe_eudebug@basic-exec-queues.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          NOTRUN -> [SKIP][393] ([Intel XE#2905]) +6 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          NOTRUN -> ([SKIP][394], [SKIP][395]) ([Intel XE#2905] / [Intel XE#3889])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-bmg:          NOTRUN -> [SKIP][396] ([Intel XE#2905] / [Intel XE#3889])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-adlp:         NOTRUN -> [SKIP][397] ([Intel XE#2905]) +5 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][398], [SKIP][399]) ([Intel XE#2905])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html
    - shard-lnl:          NOTRUN -> ([SKIP][400], [SKIP][401]) ([Intel XE#2905]) +1 other test ( 2 skip )
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-2/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][402] ([Intel XE#4518])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-beng-large-external:
    - shard-adlp:         NOTRUN -> ([SKIP][403], [SKIP][404]) ([Intel XE#261] / [Intel XE#688])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@xe_evict@evict-beng-large-external.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@xe_evict@evict-beng-large-external.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][405] ([Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-lnl:          NOTRUN -> ([SKIP][406], [SKIP][407]) ([Intel XE#688])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-7/igt@xe_evict@evict-large-external-cm.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][408] ([Intel XE#688])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
    - shard-lnl:          NOTRUN -> [SKIP][409] ([Intel XE#688]) +1 other test skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [PASS][410] -> [SKIP][411] ([Intel XE#1392]) +3 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-dg2-set2:     [PASS][412] -> ([SKIP][413], [SKIP][414]) ([Intel XE#1392])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-basic.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][415] ([Intel XE#1392]) +1 other test skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
    - shard-lnl:          NOTRUN -> ([SKIP][416], [SKIP][417]) ([Intel XE#1392])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][418] -> ([PASS][419], [SKIP][420]) ([Intel XE#1392]) +4 other tests ( 1 pass, 1 skip )
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][421] ([Intel XE#2322]) +6 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][422] ([Intel XE#1392]) +3 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][423] ([Intel XE#1392]) +2 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-7/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> ([SKIP][424], [SKIP][425]) ([Intel XE#2322]) +2 other tests ( 2 skip )
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-imm:
    - shard-adlp:         NOTRUN -> ([SKIP][426], [SKIP][427]) ([Intel XE#288]) +4 other tests ( 2 skip )
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-imm:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][428], [SKIP][429]) ([Intel XE#288]) +3 other tests ( 2 skip )
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][430] ([Intel XE#288]) +6 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][431] ([Intel XE#288]) +8 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][432] ([Intel XE#2360])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-adlp:         NOTRUN -> ([SKIP][433], [SKIP][434]) ([Intel XE#2360])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy:
    - shard-adlp:         NOTRUN -> ([SKIP][435], [SKIP][436]) ([Intel XE#2905])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][437] ([Intel XE#2229])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_mmap@pci-membarrier:
    - shard-lnl:          NOTRUN -> [SKIP][438] ([Intel XE#4045])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-6/igt@xe_mmap@pci-membarrier.html
    - shard-adlp:         NOTRUN -> [SKIP][439] ([Intel XE#4045])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@xe_mmap@pci-membarrier.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][440] ([Intel XE#586])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@xe_mmap@small-bar.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][441] ([Intel XE#1416])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-4/igt@xe_mmap@vram.html

  * igt@xe_oa@mi-rpc:
    - shard-adlp:         NOTRUN -> ([SKIP][442], [SKIP][443]) ([Intel XE#2541] / [Intel XE#3573])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-9/igt@xe_oa@mi-rpc.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@xe_oa@mi-rpc.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][444] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@rc6-disable:
    - shard-adlp:         NOTRUN -> [SKIP][445] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@xe_oa@rc6-disable.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][446], [SKIP][447]) ([Intel XE#2541] / [Intel XE#3573])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@xe_oa@rc6-disable.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@xe_oa@rc6-disable.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][448] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-9/igt@xe_oa@syncs-syncobj-cfg.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][449], [SKIP][450]) ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@xe_oa@syncs-syncobj-cfg.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-adlp:         NOTRUN -> ([SKIP][451], [SKIP][452]) ([Intel XE#979])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@xe_pat@pat-index-xelpg.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][453] ([Intel XE#1173]) +1 other test fail
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][454], [SKIP][455]) ([Intel XE#2284] / [Intel XE#366])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][456] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@xe_pm@s2idle-d3cold-basic-exec.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][457] ([Intel XE#2284] / [Intel XE#366])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@xe_pm@s2idle-d3cold-basic-exec.html
    - shard-lnl:          NOTRUN -> [SKIP][458] ([Intel XE#2284] / [Intel XE#366])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-4/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][459] -> ([ABORT][460], [ABORT][461]) ([Intel XE#1794])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-2/igt@xe_pm@s4-basic.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-9/igt@xe_pm@s4-basic.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-9/igt@xe_pm@s4-basic.html
    - shard-lnl:          [PASS][462] -> ([PASS][463], [ABORT][464]) ([Intel XE#1794]) +2 other tests ( 1 abort, 1 pass )
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-lnl-7/igt@xe_pm@s4-basic.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-6/igt@xe_pm@s4-basic.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][465] ([Intel XE#579])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          NOTRUN -> ([SKIP][466], [SKIP][467]) ([Intel XE#944]) +1 other test ( 2 skip )
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@xe_query@multigpu-query-hwconfig.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][468] ([Intel XE#944]) +1 other test skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         NOTRUN -> [SKIP][469] ([Intel XE#944]) +2 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][470] ([Intel XE#944])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@xe_query@multigpu-query-uc-fw-version-guc.html
    - shard-lnl:          NOTRUN -> ([SKIP][471], [SKIP][472]) ([Intel XE#944])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-4/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          NOTRUN -> [SKIP][473] ([Intel XE#4130])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][474], [SKIP][475]) ([Intel XE#4130])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          NOTRUN -> ([SKIP][476], [SKIP][477]) ([Intel XE#4273])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@xe_sriov_flr@flr-vfs-parallel.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@xe_sriov_flr@flr-vfs-parallel.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][478] ([Intel XE#4273])
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@xe_sriov_flr@flr-vfs-parallel.html
    - shard-lnl:          NOTRUN -> ([SKIP][479], [SKIP][480]) ([Intel XE#4273])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-2/igt@xe_sriov_flr@flr-vfs-parallel.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [PASS][481] -> ([ABORT][482], [PASS][483]) ([Intel XE#3075] / [Intel XE#3084] / [Intel XE#4582])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@xe_wedged@wedged-mode-toggle.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][484] ([Intel XE#4173]) -> ([PASS][485], [PASS][486])
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][487] ([Intel XE#2705]) -> ([PASS][488], [PASS][489]) +1 other test ( 2 pass )
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_color@deep-color:
    - shard-bmg:          [INCOMPLETE][490] ([Intel XE#4346]) -> ([PASS][491], [PASS][492])
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-8/igt@kms_color@deep-color.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_color@deep-color.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_color@deep-color.html

  * igt@kms_color@deep-color@pipe-b-dp-2-degamma:
    - shard-bmg:          [INCOMPLETE][493] -> ([PASS][494], [PASS][495])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-8/igt@kms_color@deep-color@pipe-b-dp-2-degamma.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_color@deep-color@pipe-b-dp-2-degamma.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_color@deep-color@pipe-b-dp-2-degamma.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][496] ([Intel XE#2291]) -> ([PASS][497], [PASS][498]) +1 other test ( 2 pass )
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#309]) -> ([PASS][500], [PASS][501]) +2 other tests ( 2 pass )
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][502] ([Intel XE#309]) -> [PASS][503]
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@torture-bo:
    - shard-bmg:          [INCOMPLETE][504] ([Intel XE#3226]) -> [PASS][505] +1 other test pass
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@kms_cursor_legacy@torture-bo.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_cursor_legacy@torture-bo.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][506] ([Intel XE#3009]) -> ([PASS][507], [PASS][508])
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_dp_aux_dev.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_dp_aux_dev.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2-set2:     [SKIP][509] ([Intel XE#4354]) -> ([PASS][510], [PASS][511])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_dp_link_training@non-uhbr-sst.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-bmg:          [SKIP][512] ([Intel XE#2316]) -> ([PASS][513], [PASS][514]) +1 other test ( 2 pass )
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][515] ([Intel XE#2049]) -> [PASS][516] +1 other test pass
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ad-hdmi-a6-dp4.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     [SKIP][517] ([Intel XE#310]) -> ([PASS][518], [PASS][519])
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [FAIL][520] ([Intel XE#301]) -> [PASS][521] +3 other tests pass
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:
    - shard-bmg:          [FAIL][522] ([Intel XE#3321]) -> ([PASS][523], [PASS][524]) +2 other tests ( 2 pass )
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][525] ([Intel XE#2953] / [Intel XE#4173]) -> ([PASS][526], [PASS][527]) +1 other test ( 2 pass )
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@c-dp2:
    - shard-bmg:          [INCOMPLETE][528] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][529] +1 other test pass
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-8/igt@kms_flip@flip-vs-suspend@c-dp2.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_flip@flip-vs-suspend@c-dp2.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][530] ([Intel XE#656]) -> ([PASS][531], [PASS][532]) +2 other tests ( 2 pass )
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][533] ([Intel XE#656]) -> [PASS][534] +2 other tests pass
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64:
    - shard-dg2-set2:     [FAIL][535] ([Intel XE#616]) -> [PASS][536]
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg2-set2:     [SKIP][537] -> [PASS][538]
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-x.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][539] ([Intel XE#2883]) -> ([PASS][540], [PASS][541]) +2 other tests ( 2 pass )
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@kms_setmode@basic.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_setmode@basic.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-3/igt@kms_setmode@basic.html
    - shard-adlp:         [FAIL][542] ([Intel XE#2883]) -> ([PASS][543], [PASS][544]) +2 other tests ( 2 pass )
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-9/igt@kms_setmode@basic.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@kms_setmode@basic.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][545] ([Intel XE#899]) -> [PASS][546] +1 other test pass
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-dg2-set2:     [SKIP][547] ([Intel XE#1392]) -> ([PASS][548], [PASS][549]) +1 other test ( 2 pass )
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-dg2-set2:     [SKIP][550] ([Intel XE#1392]) -> [PASS][551] +2 other tests pass
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early:
    - shard-adlp:         [DMESG-WARN][552] ([Intel XE#4173]) -> [PASS][553]
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [ABORT][554] ([Intel XE#1794]) -> ([PASS][555], [PASS][556])
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@xe_pm@s4-exec-after.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-3/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][557] ([Intel XE#1794]) -> ([PASS][558], [PASS][559])
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [DMESG-WARN][560] ([Intel XE#4173] / [Intel XE#4543]) -> ([PASS][561], [DMESG-WARN][562]) ([Intel XE#4543])
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][563] ([Intel XE#4543]) -> ([DMESG-WARN][564], [PASS][565]) ([Intel XE#4543]) +1 other test ( 1 dmesg-warn, 1 pass )
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          [FAIL][566] ([Intel XE#3719] / [Intel XE#911]) -> ([FAIL][567], [PASS][568]) ([Intel XE#3719] / [Intel XE#911]) +3 other tests ( 1 fail, 1 pass )
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][569] ([Intel XE#787]) -> [SKIP][570] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][571] ([Intel XE#787]) -> ([SKIP][572], [SKIP][573]) ([Intel XE#455] / [Intel XE#787]) +10 other tests ( 2 skip )
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][574] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][575] ([Intel XE#787]) +3 other tests skip
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][576] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][577], [SKIP][578]) ([Intel XE#787]) +4 other tests ( 2 skip )
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][579] ([Intel XE#4418]) -> ([SKIP][580], [SKIP][581]) ([Intel XE#4418] / [Intel XE#4440])
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][582] ([Intel XE#1178]) -> ([SKIP][583], [SKIP][584]) ([Intel XE#2341])
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@kms_content_protection@atomic.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_content_protection@atomic.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][585] ([Intel XE#1178]) -> ([SKIP][586], [FAIL][587]) ([Intel XE#1178] / [Intel XE#455]) +1 other test ( 1 fail, 1 skip )
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][588] ([Intel XE#1188]) -> ([SKIP][589], [FAIL][590]) ([Intel XE#1188] / [Intel XE#2341])
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@kms_content_protection@uevent.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_content_protection@uevent.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][591] ([Intel XE#309]) -> ([SKIP][592], [PASS][593]) ([Intel XE#309]) +1 other test ( 1 pass, 1 skip )
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][594] ([Intel XE#2291]) -> ([SKIP][595], [PASS][596]) ([Intel XE#2291])
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [SKIP][597] ([Intel XE#310]) -> ([FAIL][598], [PASS][599]) ([Intel XE#3098])
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg2-set2:     [SKIP][600] ([Intel XE#310]) -> ([SKIP][601], [PASS][602]) ([Intel XE#310]) +2 other tests ( 1 pass, 1 skip )
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][603] ([Intel XE#2316]) -> ([PASS][604], [SKIP][605]) ([Intel XE#2316])
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][606] ([Intel XE#3321]) -> [SKIP][607] ([Intel XE#2316])
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html
    - shard-dg2-set2:     [SKIP][608] ([Intel XE#310]) -> ([FAIL][609], [FAIL][610]) ([Intel XE#301])
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][611] ([Intel XE#301]) -> ([PASS][612], [FAIL][613]) ([Intel XE#301])
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][614] ([Intel XE#324] / [Intel XE#4543]) -> ([DMESG-FAIL][615], [PASS][616]) ([Intel XE#324] / [Intel XE#4543]) +1 other test ( 1 dmesg-fail, 1 pass )
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][617] ([Intel XE#2312]) -> ([SKIP][618], [SKIP][619]) ([Intel XE#2311] / [Intel XE#2312]) +12 other tests ( 2 skip )
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][620] ([Intel XE#2311]) -> ([SKIP][621], [SKIP][622]) ([Intel XE#2312]) +5 other tests ( 2 skip )
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][623] ([Intel XE#2312]) -> ([SKIP][624], [SKIP][625]) ([Intel XE#2311]) +2 other tests ( 2 skip )
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][626] ([Intel XE#651]) -> ([SKIP][627], [SKIP][628]) ([Intel XE#656]) +1 other test ( 2 skip )
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][629] ([Intel XE#656]) -> [SKIP][630] ([Intel XE#651]) +2 other tests skip
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][631] ([Intel XE#2311]) -> [SKIP][632] ([Intel XE#2312]) +3 other tests skip
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [DMESG-FAIL][633] ([Intel XE#4543]) -> ([PASS][634], [DMESG-FAIL][635]) ([Intel XE#4543]) +7 other tests ( 1 dmesg-fail, 1 pass )
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-dg2-set2:     [INCOMPLETE][636] ([Intel XE#2050]) -> [SKIP][637] ([Intel XE#656])
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][638] ([Intel XE#2312]) -> [SKIP][639] ([Intel XE#4141])
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][640] ([Intel XE#656]) -> ([SKIP][641], [PASS][642]) ([Intel XE#656]) +2 other tests ( 1 pass, 1 skip )
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][643] ([Intel XE#4141]) -> ([SKIP][644], [SKIP][645]) ([Intel XE#2312]) +4 other tests ( 2 skip )
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][646] ([Intel XE#4141]) -> ([SKIP][647], [SKIP][648]) ([Intel XE#2312] / [Intel XE#4141]) +6 other tests ( 2 skip )
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][649] ([Intel XE#2312]) -> ([SKIP][650], [SKIP][651]) ([Intel XE#4141]) +2 other tests ( 2 skip )
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][652] ([Intel XE#2312]) -> ([SKIP][653], [SKIP][654]) ([Intel XE#2312] / [Intel XE#4141]) +3 other tests ( 2 skip )
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][655] ([Intel XE#2311]) -> ([SKIP][656], [SKIP][657]) ([Intel XE#2311] / [Intel XE#2312]) +14 other tests ( 2 skip )
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][658] ([Intel XE#651]) -> ([SKIP][659], [SKIP][660]) ([Intel XE#651] / [Intel XE#656]) +17 other tests ( 2 skip )
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][661] ([Intel XE#656]) -> ([SKIP][662], [SKIP][663]) ([Intel XE#651]) +6 other tests ( 2 skip )
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][664] ([Intel XE#651]) -> [SKIP][665] ([Intel XE#656]) +1 other test skip
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][666] ([Intel XE#656]) -> ([SKIP][667], [SKIP][668]) ([Intel XE#651] / [Intel XE#656]) +4 other tests ( 2 skip )
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][669] ([Intel XE#2313]) -> [SKIP][670] ([Intel XE#2312]) +1 other test skip
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][671] ([Intel XE#2312]) -> ([SKIP][672], [SKIP][673]) ([Intel XE#2313]) +2 other tests ( 2 skip )
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][674] ([Intel XE#2312]) -> [SKIP][675] ([Intel XE#2313]) +1 other test skip
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][676] ([Intel XE#656]) -> ([SKIP][677], [SKIP][678]) ([Intel XE#653]) +5 other tests ( 2 skip )
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][679] ([Intel XE#2313]) -> ([SKIP][680], [SKIP][681]) ([Intel XE#2312] / [Intel XE#2313]) +15 other tests ( 2 skip )
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][682] ([Intel XE#653]) -> ([SKIP][683], [SKIP][684]) ([Intel XE#653] / [Intel XE#656]) +18 other tests ( 2 skip )
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][685] ([Intel XE#653]) -> [SKIP][686] ([Intel XE#656]) +6 other tests skip
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][687] ([Intel XE#656]) -> [SKIP][688] ([Intel XE#653])
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][689] ([Intel XE#2313]) -> ([SKIP][690], [SKIP][691]) ([Intel XE#2312]) +5 other tests ( 2 skip )
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
    - shard-dg2-set2:     [SKIP][692] ([Intel XE#656]) -> ([SKIP][693], [SKIP][694]) ([Intel XE#653] / [Intel XE#656]) +6 other tests ( 2 skip )
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][695] ([Intel XE#2312]) -> ([SKIP][696], [SKIP][697]) ([Intel XE#2312] / [Intel XE#2313]) +9 other tests ( 2 skip )
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][698] ([Intel XE#3374] / [Intel XE#3544]) -> ([SKIP][699], [SKIP][700]) ([Intel XE#3544])
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane_cursor@overlay:
    - shard-dg2-set2:     [FAIL][701] ([Intel XE#616]) -> ([PASS][702], [FAIL][703]) ([Intel XE#616])
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-432/igt@kms_plane_cursor@overlay.html
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_plane_cursor@overlay.html
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [ABORT][704] ([Intel XE#4540]) -> ([ABORT][705], [ABORT][706]) ([Intel XE#2705] / [Intel XE#4540])
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg2-set2:     [SKIP][707] ([Intel XE#455]) -> ([SKIP][708], [PASS][709]) ([Intel XE#455])
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc.html
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc.html
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][710] ([Intel XE#1500]) -> ([SKIP][711], [SKIP][712]) ([Intel XE#1500] / [Intel XE#362])
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][713] ([Intel XE#1499]) -> ([PASS][714], [SKIP][715]) ([Intel XE#1499])
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-6/igt@kms_vrr@negative-basic.html
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_vrr@negative-basic.html
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_vrr@negative-basic.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
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
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
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
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4346
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4502
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4570]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4570
  [Intel XE#4582]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4582
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def -> xe-pw-146709v2

  IGT_8289: 8289
  xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def: 1e750490a76bbb8bcb8ea8d5fba2a68bf0845def
  xe-pw-146709v2: 146709v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/index.html

--===============4657121541685225519==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2hpg: Add Wa_16025250150 (rev2)</td=
></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/146709/">https://patchwork.freedesktop.org/series/146709/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-146709v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-146709v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf=
0845def_FULL -&gt; xe-pw-146709v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-146709v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-146709v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1467=
09v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-lnl-2/igt@kms_flip=
_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html">PASS</a> -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shar=
d-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-146709v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-li=
near-upscaling.html">INCOMPLETE</a>) +1 other test ( 1 incomplete, 1 pass )=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-=
yf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_vb=
lank@query-busy-hang.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_vblank@query-busy=
-hang.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_vblank@query-busy-hang.html">PAS=
S</a>) +2 other tests ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_vblank@query-busy-hang@=
pipe-d-dp-2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_comput=
e0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-lnl-4/igt@xe_exec_=
sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_compute0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v=
2/shard-lnl-7/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_c=
lass_compute0.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exe=
c_queue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@xe_fault=
_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html">P=
ASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
46709v2/shard-bmg-3/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_eng=
ine_group_add_exec_queue.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@xe_fault_injection@exec-q=
ueue-create-fail-xe_hw_engine_group_add_exec_queue.html">ABORT</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-435/igt@xe_fau=
lt_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html"=
>PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-146709v2/shard-dg2-435/igt@xe_fault_injection@exec-queue-create-fail-xe_hw=
_engine_group_add_exec_queue.html">ABORT</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-436/igt@xe_fault_injection=
@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html">PASS</a>)</=
li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-146709v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-2/igt@core_ho=
tunplug@hotrebind-lateclose.html">PASS</a> -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@core_hotunplug@=
hotrebind-lateclose.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-146709v2/shard-adlp-4/igt@core_hotunplug@hotrebind-late=
close.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-4-=
4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_async_flips@async-flip-=
with-page-flip-events-atomic@pipe-b-dp-4-4-rc-ccs-cc.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#376=
7</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-=
a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_async_flips@async-flip=
-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-4=
64/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-=
a-6-4-mc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3767">Intel XE#3767</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-cc=
s-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_async_flips@async-flip-=
with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel=
 XE#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_async_flips@invalid-async=
-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-4/igt@kms_atomic_transition@plane-a=
ll-modeset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-2/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-4/=
igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-ad=
lp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">I=
ntel XE#3908</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-1/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-r=
otate-180.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-rotate-180.ht=
ml">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3225">Intel XE#3225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_big_fb@4-tiled-64bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_big_fb@4-tiled-addfb.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
6709v2/shard-adlp-9/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-4/igt@kms_big=
_fb@x-tiled-8bpp-rotate-0.html">PASS</a> -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-4/igt@kms_big_fb@x-tile=
d-8bpp-rotate-0.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.=
html">DMESG-FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4543">Intel XE#4543</a>) +4 other tests ( 1 dmesg-fail, 1 pass )=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-st=
ride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_big_fb@y-tiled-32bpp-rot=
ate-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-146709v2/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
124">Intel XE#1124</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-lnl-7/igt@kms_big_fb@yf-tiled-64bpp-ro=
tate-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-146709v2/shard-lnl-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
6709v2/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328=
</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/619">Intel XE#619</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw=
-stride-64bpp-rotate-0-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_big_fb@yf-tiled=
-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other =
test ( 2 skip )</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@kms_bw@connected-linear-tili=
ng-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_bw@connected-linear-ti=
ling-4-displays-2160x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_bw@connected-line=
ar-tiling-4-displays-2160x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-1/igt@kms_bw@connected-linear-tilin=
g-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_bw@connected-linear-tilin=
g-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_bw@linear-tiling-1-dis=
plays-1920x1080p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays=
-1920x1080p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_bw@linear-tiling-1-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_bw@linear-tiling-2-disp=
lays-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-146709v2/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-2=
560x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-6/igt@kms_bw@linear-tiling-3-displ=
ays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-2/igt@kms_bw@linear-tiling-3-displa=
ys-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_bw@linear-tiling-3-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_ccs@bad-aux-stride-y-til=
ed-gen12-mc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen=
12-mc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-ti=
led-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_ccs@bad-rotation-90-yf=
-tiled-ccs@pipe-c-hdmi-a-6.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_ccs@bad-rotation-=
90-yf-tiled-ccs@pipe-c-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +58 other tests=
 ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_ccs@ccs-on-another-bo-4=
-tiled-mtl-rc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_ccs@ccs-on-another-bo-4-til=
ed-mtl-rc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-=
y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_ccs@ccs-=
on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) +15 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-t=
iled-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi=
-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@kms_ccs@crc-primary-rotatio=
n-180-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms=
_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
787">Intel XE#787</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; (<a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_ccs@crc-pr=
imary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-=
4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_ccs@crc-primar=
y-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">INCOMPLETE</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-433/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@k=
ms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@km=
s_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_ccs@crc-primary-suspend=
-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_ccs@crc-primary-suspend=
-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +171 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-4=
-tiled-mtl-rc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_ccs@missing-ccs-buffer-4-til=
ed-mtl-rc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-y=
-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-9/igt@kms_ccs@random-ccs-data-4-t=
iled-bmg-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-=
ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_=
ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel=
 XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-=
tiled-dg2-mc-ccs@pipe-a-dp-4.html">DMESG-WARN</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_ccs@rando=
m-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-=
tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_ccs@r=
andom-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +36 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_cdclk@mode-transition-all=
-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_cdclk@mode-transition@p=
ipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_chamelium_color@ctm-gre=
en-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_chamelium_color@ctm-gree=
n-to-red.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-146709v2/shard-lnl-1/igt@kms_chamelium_color@ctm-green-to-red.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_chamelium_color@ctm-li=
mited-range.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-rang=
e.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/306">Intel XE#306</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-5/igt@kms_chamelium_color@ctm-limit=
ed-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-6/igt@kms_chamelium_color@degamma.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_chamelium_edid@dp-edid-=
resolution-list.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-146709v2/shard-adlp-4/igt@kms_chamelium_edid@dp-edid-resolu=
tion-list.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373">Intel XE#373</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-=
change-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +9 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@kms_chamelium_edid@hdmi-edid=
-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/373">Intel XE#373</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_chamelium_edid@hdmi-edid-=
read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_chamelium_frames@dp-cr=
c-single.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-146709v2/shard-dg2-433/igt@kms_chamelium_frames@dp-crc-single.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/373">Intel XE#373</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-a=
fter-hibernate.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-after-hi=
bernate.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2252">Intel XE#2252</a>) +2 other tests ( 2 skip )</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-=
after-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-a=
fter-hibernate.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-146709v2/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-after-hi=
bernate.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_content_protection@atom=
ic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_content_protection@dp-m=
st-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-5/igt@kms_content_protection@dp-mst=
-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_content_protection@legacy=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_cursor_crc@cursor-offscr=
een-128x42.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-128x42.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2320">Intel XE#2320</a>) +1 other test ( 2 skip )</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-lnl-6/igt@kms_cursor_crc@cursor-offscr=
een-128x42.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-128x42.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_cursor_crc@cursor-onscree=
n-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_cursor_crc@cursor-onscree=
n-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-6/igt@kms_cursor_crc@cursor-rando=
m-512x512.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_cursor_crc@cursor-random-512x512.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-m=
ovement-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-=
movement-512x512.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movem=
ent-512x512.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_cursor_crc@cursor-slidin=
g-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-4/igt@kms_cursor_legacy@2x-cursor-v=
s-flip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_cursor_legacy@2x-cursor-=
vs-flip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-3/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_curso=
r_legacy@2x-flip-vs-cursor-atomic.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_cursor_legac=
y@2x-flip-vs-cursor-atomic.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +5 other tests ( 1=
 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-=
cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-433/igt@kms_cu=
rsor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_c=
ursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +4 other tests=
 ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_cursor_legacy@2x-long-cu=
rsor-vs-flip-atomic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_cursor_legacy@2x-long-curs=
or-vs-flip-atomic.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-433/igt@kms_cu=
rsor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@k=
ms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-463/igt@kms_cu=
rsor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> -&gt; (<a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_cursor_l=
egacy@cursorb-vs-flipb-toggle.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_dither@fb-8bpc-=
vs-panel-6bpc.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.htm=
l">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_dp_link_training@uhbr-ss=
t.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-146709v2/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel X=
E#4354</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_dp_link_training@uhbr-ss=
t.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-146709v2/shard-lnl-4/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel X=
E#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_fbc_dirty_rect@fbc-dirt=
y-rectangle-different-formats.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-4/igt@kms_fbc_dirty_rect@=
fbc-dirty-rectangle-different-formats.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dir=
ty-rectangle-dirtyfb-tests.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_fbc_dirty_rect@fb=
c-dirty-rectangle-dirtyfb-tests.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-6/igt@kms_fbcon_fbt@psr-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-8/igt@kms_feat=
ure_discovery@display-2x.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_feature_discove=
ry@display-2x.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_feature_discovery@display-2x.htm=
l">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-7/igt@kms_flip=
@2x-busy-flip.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_flip@2x-busy-flip.html">IN=
COMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
6709v2/shard-bmg-4/igt@kms_flip@2x-busy-flip.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel=
 XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-7/igt@kms_flip=
@2x-busy-flip@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_flip@2x-busy=
-flip@bd-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-463/igt@kms_fl=
ip@2x-dpms-vs-vblank-race-interruptible.html">PASS</a> -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@km=
s_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_=
flip@2x-dpms-vs-vblank-race-interruptible.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +8 ot=
her tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank=
-race@ab-hdmi-a6-dp4.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_flip@2x-dpms-vs-vblank-=
race@ab-hdmi-a6-dp4.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-463/igt@kms_fl=
ip@2x-flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_flip@2=
x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_flip@2x-flip-vs-absolut=
e-wf_vblank-interruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_flip@2x-flip-vs-abs=
olute-wf_vblank-interruptible.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@bc-hdmi-a2-dp2.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expire=
d-vblank@ab-hdmi-a6-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expi=
red-vblank@ab-hdmi-a6-dp4.html">FAIL</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests ( 1 fa=
il, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expire=
d-vblank@bd-hdmi-a6-dp4.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expi=
red-vblank@bd-hdmi-a6-dp4.html">FAIL</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning=
-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-8/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms=
_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_=
flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) =
+12 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@kms_flip@2x-plain-flip-inter=
ruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/310">Intel XE#310</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-1/igt@kms_flip@2x-plain-flip-interr=
uptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-3/igt@kms_flip=
@2x-wf_vblank-ts-check.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_flip@2x-wf_vblank=
-ts-check.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316=
">Intel XE#2316</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-chec=
k-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-433/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-4=
64/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Int=
el XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-436/igt@kms_fl=
ip@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_flip@flip-vs-suspend=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-=
hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-lnl-6/igt@kms_flip=
@plain-flip-fb-recreate-interruptible@a-edp1.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-4/ig=
t@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-7=
/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html">PASS</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel X=
E#886</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">In=
tel XE#1401</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64b=
pp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">In=
tel XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64b=
pp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-=
bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upsca=
ling@pipe-a-valid-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-3/igt@kms_flip_scale=
d_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745"=
>Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-=
3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-=
a-default-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-6=
4bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-=
433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pip=
e-a-valid-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Inte=
l XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@d=
rrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_frontbuffer=
_tracking@drrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_frontbuff=
er_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312=
">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs=
-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/656">Intel XE#656</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +18 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_frontbuffer_tracking@d=
rrs-shrfb-scaledprimary.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_frontbuffer_tracking=
@drrs-shrfb-scaledprimary.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">PASS</a> -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2=
-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/=
shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/656">Intel XE#656</a>) +4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_frontbuffe=
r_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_frontbuffer_=
tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Inte=
l XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@f=
bc-2p-primscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_frontbuffer_t=
racking@fbc-2p-primscrn-spr-indfb-onoff.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/sha=
rd-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap=
-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html">PASS</a> -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg=
2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v=
2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-b=
lt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +15 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-pri-indfb-multidraw.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_frontbuffer_trac=
king@fbcdrrs-1p-pri-indfb-multidraw.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other te=
st ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-spr-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_frontbuffer_tr=
acking@fbcdrrs-1p-primscrn-spr-indfb-move.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 =
other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-rte.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rt=
e.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/651">Intel XE#651</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@kms_front=
buffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel X=
E#656</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc=
drrs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_front=
buffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel X=
E#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc=
psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_frontbuffer=
_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">In=
tel XE#2313</a>) +2 other tests ( 2 skip )</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc=
psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_frontbuffer=
_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)=
 +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc=
psr-2p-primscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_frontbuffer_tr=
acking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 =
other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +14 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc=
psr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_frontbuffer_tr=
acking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_frontbuffer_tracking@p=
sr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_frontbuffe=
r_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +=
4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +20 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-146709v2/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#6=
05</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_getfb@getfb-reject-ccs.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
46709v2/shard-lnl-4/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-4/igt@kms_getfb@getfb2-accept-ccs=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-146709v2/shard-adlp-2/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339">Intel XE#=
1339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-463/igt@kms_hd=
r@invalid-hdr.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2=
/shard-dg2-464/igt@kms_hdr@invalid-hdr.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-3/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-4/igt@kms_joiner@basic-big-joiner=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-146709v2/shard-adlp-2/igt@kms_joiner@basic-big-joiner.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#3=
46</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_joiner@basic-max-non-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_joiner@basic-ultra-joine=
r.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-146709v2/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel X=
E#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-4/igt@kms_joiner@invalid-modeset-f=
orce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_joiner@invalid-modeset=
-ultra-joiner.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_joiner@invalid-modeset-ultra-j=
oiner.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_plane_cursor@overlay@pi=
pe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-4/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-6/igt@kms_plane_multiple@tiling-y=
f.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-146709v2/shard-adlp-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-hdmi-a-6.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4502">Intel XE#4502</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_plane_scaling@plane-do=
wnscale-factor-0-25-with-rotation.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_plane_scal=
ing@plane-downscale-factor-0-25-with-rotation.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_plane_scaling@plane-do=
wnscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_pla=
ne_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Inte=
l XE#2763</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_plane_scaling@planes-down=
scale-factor-0-25.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test (=
 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25@pipe-b.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_plane_scaling@plan=
es-downscale-factor-0-25@pipe-b.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other test=
s ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_plane_scaling@planes-down=
scale-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_plane_scaling@planes-un=
ity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_plane_scaling@planes-un=
ity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_pm_backlight@bad-brightne=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_pm_backlight@brightness=
-with-dpms.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-146709v2/shard-adlp-1/igt@kms_pm_backlight@brightness-with-dpms.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flo=
ps.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3309">Intel XE#3309</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-1/igt@kms_pm_dc@dc5-retention-flops=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v=
2/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
6709v2/shard-adlp-2/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stre=
ss-no-wait.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-463/igt@kms_pm=
_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_pm=
_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-4/igt@kms_psr2_sf@fbc-pr-cursor-pl=
ane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-overlay=
-plane-move-continuous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-ove=
rlay-plane-move-continuous-sf.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-overla=
y-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay=
-primary-update-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-o=
verlay-primary-update-sf-dmg-area.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other te=
sts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay=
-primary-update-sf-dmg-area@pipe-b-edp-1.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_psr2_=
sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html">FAIL</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4570">Inte=
l XE#4570</a>) +2 other tests ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@kms_psr2_sf@pr-overlay-prim=
ary-update-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_psr2_sf@pr-overlay-pri=
mary-update-sf-dmg-area.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-6/igt@kms_psr2_sf@pr-primary-plane-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_psr@fbc-pr-dpms.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/285=
0">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_psr@fbc-pr-no-drrs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
34">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_psr@fbc-pr-primary-rend=
er.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-146709v2/shard-adlp-8/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel=
 XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@kms_psr@fbc-psr-primary-page=
-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-blt.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
146709v2/shard-bmg-8/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#22=
34</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/285=
0">Intel XE#2850</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-6/igt@kms_psr@pr-basic.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">In=
tel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_psr@pr-sprite-blt.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1467=
09v2/shard-dg2-433/igt@kms_psr@pr-sprite-blt.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel =
XE#929</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-lnl-3/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-1/igt@kms_setmode@basic@pip=
e-b-edp-1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html">PAS=
S</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883=
">Intel XE#2883</a>) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-3/igt@kms_setm=
ode@clone-exclusive-crtc.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_setmode@clone-e=
xclusive-crtc.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.htm=
l">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1435">Intel XE#1435</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-463/igt@kms_se=
tmode@clone-exclusive-crtc.html">PASS</a> -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_setmode@clo=
ne-exclusive-crtc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_setmode@clone-exclusive-cr=
tc.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_setmode@invalid-clone-si=
ngle-crtc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-146709v2/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.ht=
ml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_vrr@flip-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499=
">Intel XE#1499</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_vrr@lobf.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-=
bmg-4/igt@kms_vrr@lobf.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_vrr@lobf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Inte=
l XE#2168</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel =
XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-6/igt@xe_ccs@ctrl-surf-copy-new-ct=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_c=
ompute:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-lnl-1/igt@xe_compu=
te_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
6709v2/shard-lnl-1/igt@xe_compute_preempt@compute-preempt-many@engine-drm_x=
e_engine_class_compute.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-146709v2/shard-lnl-3/igt@xe_compute_preempt@compute-=
preempt-many@engine-drm_xe_engine_class_compute.html">FAIL</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278">Intel XE#4278</a=
>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@xe_copy_basic@mem-set-linea=
r-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-6/igt@xe_copy_basic@mem-set-linear=
-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@xe_create@multigpu-create-=
massive-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-146709v2/shard-dg2-435/igt@xe_create@multigpu-create-massive-s=
ize.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-6/igt@xe_create@multigpu-create-mas=
sive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@xe_eu_stall@blocking-read.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@xe_eudebug@basic-close.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2905">Intel XE#2905</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-7/igt@xe_eudebug@basic-close.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
05">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@xe_eudebug@basic-exec-queues=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-146709v2/shard-bmg-1/igt@xe_eudebug@basic-exec-queues.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#=
2905</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@xe_eudebug@basic-read-event.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufe=
nce-reconnect.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-146709v2/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence-reco=
nnect.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufen=
ce-sigint-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@xe_eudebug_online@single-ste=
p-one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@xe_eudebug_online@writes-c=
aching-vram-bb-sram-target-sram.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@xe_eudebug_onlin=
e@writes-caching-vram-bb-sram-target-sram.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-lnl-2/igt@xe_eudebug_online@writes-cac=
hing-vram-bb-sram-target-sram.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@xe_eudebug_online@wr=
ites-caching-vram-bb-sram-target-sram.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 othe=
r test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@xe_eudebug_sriov@deny-eudebug=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@xe_evict@evict-beng-large-e=
xternal.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-146709v2/shard-adlp-1/igt@xe_evict@evict-beng-large-external.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
61">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@xe_evict@evict-beng-large-ex=
ternal-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-lnl-7/igt@xe_evict@evict-large-externa=
l-cm.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-146709v2/shard-lnl-8/igt@xe_evict@evict-large-external-cm.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">In=
tel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@xe_evict_ccs@evict-overcommi=
t-standalone-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit=
-standalone-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/sha=
rd-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-b=
ind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-466/igt@xe_exe=
c_basic@multigpu-no-exec-basic.html">PASS</a> -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@xe_exec_bas=
ic@multigpu-no-exec-basic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@xe_exec_basic@multigpu=
-no-exec-basic.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-e=
xec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test=
 skip</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@xe_exec_basic@multigpu-no-ex=
ec-bindexecqueue-userptr-rebind.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-3/igt@xe_exec_basic@mult=
igpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">PASS</a> -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@xe_=
exec_basic@multigpu-once-basic-defer-mmap.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 oth=
er tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +6 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-7/igt@xe_exec_basic@multigpu-once-u=
serptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@xe_exec_basic@multigpu-once-=
userptr-invalidate-race.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@xe_exec_basic@multigpu-onc=
e-userptr-invalidate-race.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests ( 2 =
skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@xe_exec_fault_mode@many-bin=
dexecqueue-imm.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-146709v2/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqu=
eue-imm.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/288">Intel XE#288</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@xe_exec_fault_mode@many-us=
erptr-invalidate-imm.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@xe_exec_fault_mode@many-use=
rptr-invalidate-imm.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests ( 2 skip )</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@xe_exec_fault_mode@once-user=
ptr-invalidate-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@xe_exec_fault_mode@once-use=
rptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@xe_exec_mix_modes@exec-simp=
le-batch-store-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@xe_exec_mix_modes@exec-spin=
ner-interrupted-dma-fence.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@xe_exec_mix_modes@exec-=
spinner-interrupted-dma-fence.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@xe_exec_sip_eudebug@breakpo=
int-waitsip-heavy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@xe_exec_sip_eudebug@breakpoint-=
waitsip-heavy.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@xe_live_ktest@xe_bo@xe_ccs_mi=
grate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-6/igt@xe_mmap@pci-membarrier.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/40=
45">Intel XE#4045</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@xe_mmap@pci-membarrier.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
045">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@xe_mmap@small-bar.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">In=
tel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-4/igt@xe_mmap@vram.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel =
XE#1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-9/igt@xe_oa@mi-rpc.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard=
-adlp-2/igt@xe_oa@mi-rpc.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@xe_oa@non-privileged-map-oa=
-buffer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@xe_oa@rc6-disable.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">=
Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@xe_oa@rc6-disable.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2=
/shard-dg2-432/igt@xe_oa@rc6-disable.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-9/igt@xe_oa@syncs-syncobj-cfg.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@xe_oa@syncs-syncobj-cfg.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
6709v2/shard-dg2-435/igt@xe_oa@syncs-syncobj-cfg.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573"=
>Intel XE#3573</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@xe_pat@pat-index-xelpg.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1467=
09v2/shard-adlp-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146=
709v2/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Inte=
l XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@xe_pm@s2idle-d3cold-basic-ex=
ec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@xe_pm@s2idle-d3cold-basic-e=
xec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-lnl-4/igt@xe_pm@s2idle-d3cold-basic-exe=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-2/igt@xe_pm@s=
4-basic.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-146709v2/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp=
-9/igt@xe_pm@s4-basic.html">ABORT</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-lnl-7/igt@xe_pm@s4=
-basic.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-146709v2/shard-lnl-6/igt@xe_pm@s4-basic.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-2/i=
gt@xe_pm@s4-basic.html">ABORT</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +2 other tests ( 1 abort, =
1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-7/igt@xe_query@multigpu-query-hwco=
nfig.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-146709v2/shard-bmg-2/igt@xe_query@multigpu-query-hwconfig.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">In=
tel XE#944</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@xe_query@multigpu-query-inval=
id-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@xe_query@multigpu-query-inva=
lid-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@xe_query@multigpu-query-uc-=
fw-version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-lnl-4/igt@xe_query@multigpu-query-uc-f=
w-version-guc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-146709v2/shard-lnl-8/igt@xe_query@multigpu-query-uc-fw-versio=
n-guc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@xe_sriov_auto_provisioning@ex=
clusive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@xe_sriov_auto_provisioning=
@selfconfig-reprovision-reduce-numvfs.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@xe_sriov_a=
uto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4=
130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@xe_sriov_flr@flr-vfs-paralle=
l.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-146709v2/shard-bmg-4/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel X=
E#4273</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@xe_sriov_flr@flr-vfs-parall=
el.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4273">Intel XE#4273</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-lnl-2/igt@xe_sriov_flr@flr-vfs-paralle=
l.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-146709v2/shard-lnl-8/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel X=
E#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-433/igt@xe_wed=
ged@wedged-mode-toggle.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@xe_wedged@wedged-mo=
de-toggle.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-146709v2/shard-dg2-463/igt@xe_wedged@wedged-mode-toggle.html">PA=
SS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307=
5">Intel XE#3075</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3084">Intel XE#3084</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4582">Intel XE#4582</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-2/igt@kms_asy=
nc_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE=
#4173</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-146709v2/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-=
a-hdmi-a-1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-146709v2/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-res=
ume@pipe-a-hdmi-a-1.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel X=
E#2705</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-146709v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc=
@pipe-c-dp-4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2=
-rc-ccs-cc@pipe-c-dp-4.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-8/igt@kms_colo=
r@deep-color.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4346">Intel XE#4346</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_color@d=
eep-color.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_color@deep-color.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-b-dp-2-degamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-8/igt@kms_colo=
r@deep-color@pipe-b-dp-2-degamma.html">INCOMPLETE</a> -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_c=
olor@deep-color@pipe-b-dp-2-degamma.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_color@deep=
-color@pipe-b-dp-2-degamma.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-146709v2/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-tran=
sitions-varying-size.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-=
flipa-atomic-transitions-varying-size.html">PASS</a>) +1 other test ( 2 pas=
s )</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel=
 XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-146709v2/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-tr=
ansitions-varying-size.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_cursor_legacy@cursorb=
-vs-flipa-atomic-transitions-varying-size.html">PASS</a>) +2 other tests ( =
2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel=
 XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-146709v2/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-tra=
nsitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@kms_curs=
or_legacy@torture-bo.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_=
cursor_legacy@torture-bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_dp=
_aux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3009">Intel XE#3009</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_dp_aux_dev.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1467=
09v2/shard-dg2-463/igt@kms_dp_aux_dev.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_dp=
_link_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@=
kms_dp_link_training@non-uhbr-sst.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_dp_link_tr=
aining@non-uhbr-sst.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-=
8/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/ig=
t@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">PASS</a>) +1 other test=
 ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-433/igt@kms_fl=
ip@2x-plain-flip-fb-recreate-interruptible@ad-hdmi-a6-dp4.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">I=
ntel XE#2049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-146709v2/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate-inter=
ruptible@ad-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_fl=
ip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg=
2-463/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-=
463/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-466/igt@kms_fl=
ip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-466=
/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> +3 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-6/igt@kms_flip=
@flip-vs-expired-vblank@c-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/=
igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_=
flip@flip-vs-expired-vblank@c-hdmi-a3.html">PASS</a>) +2 other tests ( 2 pa=
ss )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-ad=
lp-2/igt@kms_flip@flip-vs-suspend.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-6/igt@kms_flip@flip-v=
s-suspend.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-8/igt@kms_flip=
@flip-vs-suspend@c-dp2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shar=
d-bmg-1/igt@kms_flip@flip-vs-suspend@c-dp2.html">PASS</a> +1 other test pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14670=
9v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-mo=
ve.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-146709v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-=
indfb-move.html">PASS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
46709v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrf=
b-draw-render.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-432/igt@kms_pl=
ane_cursor@overlay@pipe-a-hdmi-a-2-size-64.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-=
dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-64.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_pl=
ane_multiple@2x-tiling-x.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_plane_multiple=
@2x-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@kms_setm=
ode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2883">Intel XE#2883</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_setmode@basic.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
6709v2/shard-bmg-3/igt@kms_setmode@basic.html">PASS</a>) +2 other tests ( 2=
 pass )</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-9/igt@kms_set=
mode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2883">Intel XE#2883</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-1/igt@kms_setmode@basic.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
146709v2/shard-adlp-2/igt@kms_setmode@basic.html">PASS</a>) +2 other tests =
( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-lnl-1/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl=
-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-d=
g2-464/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-=
433/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">PASS</a>) +1 oth=
er test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2=
-433/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">PASS</a> +2 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-2/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_mmio_probe_early.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173"=
>Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-146709v2/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-f=
unction-xe_mmio_probe_early.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-lnl-2/igt@xe_pm@s4=
-exec-after.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@xe_pm@s4-exec-aft=
er.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-146709v2/shard-lnl-3/igt@xe_pm@s4-exec-after.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-9/igt@xe_pm@s=
4-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@xe_pm@s4-mu=
ltiple-execs.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-146709v2/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html">PASS</=
a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-2/igt@kms_asy=
nc_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4=
543</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
146709v2/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v=
2/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WA=
RN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/454=
3">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-2/igt@kms_asy=
nc_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-146709v2/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-=
b-hdmi-a-1.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-146709v2/shard-adlp-8/igt@kms_async_flips@async-flip-suspe=
nd-resume@pipe-b-hdmi-a-1.html">PASS</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test ( 1 d=
mesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-lnl-5/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-atomic.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719">Intel XE#3719</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Inte=
l XE#911</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-146709v2/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-eve=
nts-atomic.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-146709v2/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-fl=
ip-events-atomic.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3719">Intel XE#3719</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests (=
 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-436/igt@kms_cc=
s@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709=
v2/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-=
a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-466/igt@kms_cc=
s@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146=
709v2/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-=
hdmi-a-6.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-146709v2/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc=
-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +10 other test=
s ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_cc=
s@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#4=
55</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787=
">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-yf-ti=
led-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/787">Intel XE#787</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_ccs@crc-s=
prite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#78=
7</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-433/igt@kms_cd=
clk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4418</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/=
igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_cd=
clk@mode-transition-all-outputs.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4418</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4440">Intel XE#4440</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@kms_cont=
ent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; (<a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_cont=
ent_protection@atomic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_content_protection@atomi=
c.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-466/igt@kms_co=
ntent_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt=
@kms_content_protection@atomic-dpms.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_content_=
protection@atomic-dpms.html">FAIL</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other t=
est ( 1 fail, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; (<a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_cont=
ent_protection@uevent.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_content_protection@ueven=
t.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1188">Intel XE#1188</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_cu=
rsor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14670=
9v2/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-at=
omic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-146709v2/shard-dg2-466/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs=
-cursor-atomic.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test ( 1 pass, 1 skip )=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/=
igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-1/igt@kms_=
cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_fl=
ip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_=
flip@2x-dpms-vs-vblank-race.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_flip@2x-dpms-vs-=
vblank-race.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_flip@2x=
-flip-vs-dpms.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-dpms.html">PAS=
S</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310"=
>Intel XE#310</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-8/ig=
t@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-433/igt@k=
ms_flip@2x-flip-vs-expired-vblank.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_flip@2x-fl=
ip-vs-expired-vblank.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-466/igt@kms_fl=
ip@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_=
flip@flip-vs-expired-vblank.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_flip@flip-vs-exp=
ired-vblank.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-1/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.=
html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/324">Intel XE#324</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-adlp-2/igt@kms_flip_sc=
aled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html=
">DMESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-146709v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-y=
tile-downscaling@pipe-a-valid-mode.html">PASS</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>=
) +1 other test ( 1 dmesg-fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/s=
hard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v=
2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2311">Intel XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-146709v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-=
primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other test=
s ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146=
709v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msfli=
p-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-146709v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-sh=
rfb-msflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-i=
ndfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2=
p-primscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test =
( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709=
v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-mo=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1467=
09v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">DMESG-FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel =
XE#4543</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-146709v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-=
shrfb-draw-blt.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-146709v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-of=
fscren-pri-shrfb-draw-blt.html">DMESG-FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +7 other test=
s ( 1 dmesg-fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1467=
09v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1467=
09v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14670=
9v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-on=
off.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-146709v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur=
-indfb-onoff.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests ( 1 pass, 1 skip )<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-146709v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indf=
b-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-146709v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests (=
 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-146709v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indf=
b-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
146709v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scnds=
crn-spr-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests ( 2 =
skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v=
2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
46709v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
move.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests ( 2 skip )<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146=
709v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indf=
b-move.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-146709v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscr=
n-cur-indfb-move.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +14 other test=
s ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Inte=
l XE#651</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscr=
n-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@kms_frontbuffer_trackin=
g@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE=
#656</a>) +17 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#6=
56</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
46709v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrf=
b-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p=
-primscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests ( 2 s=
kip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Inte=
l XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn=
-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Inte=
l XE#656</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-146709v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscr=
n-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_trackin=
g@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE=
#656</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/=
shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146=
709v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb=
-move.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-146709v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-=
cur-indfb-move.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel X=
E#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-146709v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#65=
6</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
6709v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-=
msflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-pr=
imscrn-shrfb-msflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests ( 2 skip=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
6709v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pg=
flip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-146709v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndsc=
rn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +15 other t=
ests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14670=
9v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip=
-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-sh=
rfb-msflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/653">Intel XE#653</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +18 other tests ( 2 =
skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709=
v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
46709v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#=
2313</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-146709v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indf=
b-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests (=
 2 skip )</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE=
#656</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-146709v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-146709v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p=
-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146=
709v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip=
-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-146709v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrf=
b-plflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests ( 2=
 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-8/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-6/=
igt@kms_hdr@brightness-with-hdr.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@kms_hdr@brightness=
-with-hdr.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-432/igt@kms_pl=
ane_cursor@overlay.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_plane_c=
ursor@overlay.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-146709v2/shard-dg2-433/igt@kms_plane_cursor@overlay.html">FAI=
L</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616"=
>Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-432/igt@kms_pl=
ane_scaling@intel-max-src-size.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/=
igt@kms_plane_scaling@intel-max-src-size.html">ABORT</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/igt@kms_pl=
ane_scaling@intel-max-src-size.html">ABORT</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4540">Intel XE#4540</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_se=
tmode@invalid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-464/=
igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_se=
tmode@invalid-clone-single-crtc.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-432/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/=
shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14670=
9v2/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1500">Intel XE#1500</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-6/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-2/igt@kms_vrr@negativ=
e-basic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-146709v2/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE=
#1499</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def -&gt; xe-pw-146=
709v2</li>
</ul>
<p>IGT_8289: 8289<br />
  xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def: 1e750490a76bbb8bcb8ea8d=
5fba2a68bf0845def<br />
  xe-pw-146709v2: 146709v2</p>

</body>
</html>

--===============4657121541685225519==--
