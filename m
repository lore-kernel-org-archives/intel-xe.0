Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74565C87FD2
	for <intel-xe@archiver.kernel.org>; Sat,  2 Aug 2025 05:43:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC4410E03B;
	Sat,  2 Aug 2025 05:43:09 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F115F10E03B;
 Sat,  2 Aug 2025 05:43:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7815283079581602453=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/vf=3A_Post-migratio?=
 =?utf-8?q?n_recovery_of_queues_and_jobs_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 02 Aug 2025 05:43:08 -0000
Message-ID: <175411338890.207044.16814631529141328547@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250802031045.1127138-1-tomasz.lis@intel.com>
In-Reply-To: <20250802031045.1127138-1-tomasz.lis@intel.com>
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

--===============7815283079581602453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Post-migration recovery of queues and jobs (rev10)
URL   : https://patchwork.freedesktop.org/series/148982/
State : failure

== Summary ==

CI Bug Log - changes from xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a_FULL -> xe-pw-148982v10_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148982v10_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148982v10_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148982v10_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@once-cm-parallel-userptr:
    - shard-adlp:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-6/igt@xe_exec_balancer@once-cm-parallel-userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-2/igt@xe_exec_balancer@once-cm-parallel-userptr.html

  * igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset:
    - shard-bmg:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-3/igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset.html

  * igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse:
    - shard-bmg:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html

  
#### Warnings ####

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [SKIP][7] ([Intel XE#4945]) -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  
New tests
---------

  New tests have been introduced between xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a_FULL and xe-pw-148982v10_FULL:

### New IGT tests (10) ###

  * igt@kms_async_flips@crc@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.29] s

  * igt@kms_async_flips@test-cursor@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_async_flips@test-time-stamp@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_async_flips@test-time-stamp@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_async_flips@test-time-stamp@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_async_flips@test-time-stamp@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_cdclk@plane-scaling@pipe-a-dp-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_cdclk@plane-scaling@pipe-c-dp-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_plane_lowres@tiling-x@pipe-d-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [8.97, 9.36] s

  

Known issues
------------

  Here are the changes found in xe-pw-148982v10_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#4963])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@core_hotunplug@hotreplug-lateclose.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [PASS][11] -> [FAIL][12] ([Intel XE#4672])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@core_setmaster@master-drop-set-root.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@write:
    - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#2134])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@fbdev@write.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@fbdev@write.html

  * igt@kms_atomic_transition@modeset-transition:
    - shard-adlp:         [PASS][15] -> [DMESG-WARN][16] ([Intel XE#2953] / [Intel XE#4173]) +4 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-1/igt@kms_atomic_transition@modeset-transition.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-8/igt@kms_atomic_transition@modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#4947]) +12 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][19] -> [DMESG-FAIL][20] ([Intel XE#4543])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#2314] / [Intel XE#2894])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#787]) +55 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#787]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][27] -> [INCOMPLETE][28] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][29] -> [INCOMPLETE][30] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) +1 other test incomplete
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][31] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][32] -> [INCOMPLETE][33] ([Intel XE#3124])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][34] -> [DMESG-WARN][35] ([Intel XE#1727] / [Intel XE#3113])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][36] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#373])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][38] ([Intel XE#1178]) +1 other test fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][39] ([Intel XE#1178])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#2291])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#4950]) +56 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#3009])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_dp_aux_dev.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1:
    - shard-adlp:         [PASS][46] -> [DMESG-WARN][47] ([Intel XE#4543])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-6/igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2293])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#651])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#4947])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][51] -> [SKIP][52] ([Intel XE#3012])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2763]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#4962]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][56] -> [FAIL][57] ([Intel XE#2883]) +1 other test fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-dg2-set2:     [PASS][58] -> [SKIP][59] ([Intel XE#1392]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_system_allocator@process-many-large-malloc-race:
    - shard-bmg:          [PASS][60] -> [SKIP][61] ([Intel XE#4945]) +306 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-malloc-race.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-malloc-race.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-fork-read:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#4915] / [Intel XE#5560])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-4/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-fork-read.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-dg2-set2:     [PASS][63] -> [DMESG-WARN][64] ([Intel XE#3876])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          [SKIP][65] ([Intel XE#4963]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@core_hotunplug@hotunplug-rescan.html

  * igt@fbdev@info:
    - shard-bmg:          [SKIP][67] ([Intel XE#2134]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@fbdev@info.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@fbdev@info.html

  * igt@kms_addfb_basic@bad-pitch-999:
    - shard-bmg:          [SKIP][69] ([Intel XE#4950]) -> [PASS][70] +45 other tests pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_addfb_basic@bad-pitch-999.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_addfb_basic@bad-pitch-999.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:
    - shard-bmg:          [SKIP][71] ([Intel XE#4947]) -> [PASS][72] +7 other tests pass
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-lnl:          [FAIL][73] ([Intel XE#1231]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][75] ([Intel XE#4543]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][77] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][79] ([Intel XE#2291]) -> [PASS][80] +2 other tests pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][81] ([Intel XE#2316]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@basic-plain-flip@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][83] ([Intel XE#4543]) -> [PASS][84] +2 other tests pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-6/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-3/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-bmg:          [SKIP][85] ([Intel XE#4962]) -> [PASS][86] +1 other test pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][87] ([Intel XE#1435]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][89] ([Intel XE#4459]) -> [PASS][90] +1 other test pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-dg2-set2:     [SKIP][91] ([Intel XE#1392]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-436/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_system_allocator@process-many-new-nomemset:
    - shard-bmg:          [SKIP][93] ([Intel XE#4945]) -> [PASS][94] +230 other tests pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_exec_system_allocator@process-many-new-nomemset.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_exec_system_allocator@process-many-new-nomemset.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][95] ([Intel XE#2229]) -> [PASS][96] +1 other test pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_live_ktest@xe_bo.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@xe_live_ktest@xe_bo.html

  
#### Warnings ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [FAIL][97] ([Intel XE#4665]) -> [SKIP][98] ([Intel XE#5177])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@intel_hwmon@hwmon-write.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          [SKIP][99] ([Intel XE#4947]) -> [SKIP][100] ([Intel XE#2327]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          [SKIP][101] ([Intel XE#2327]) -> [SKIP][102] ([Intel XE#4947]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-bmg:          [SKIP][103] ([Intel XE#4947]) -> [SKIP][104] ([Intel XE#1124]) +7 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][105] ([Intel XE#1124]) -> [SKIP][106] ([Intel XE#4947]) +8 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          [SKIP][107] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][108] ([Intel XE#4950])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          [SKIP][109] ([Intel XE#367]) -> [SKIP][110] ([Intel XE#4950]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][111] ([Intel XE#4950]) -> [SKIP][112] ([Intel XE#367])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][113] ([Intel XE#4947]) -> [SKIP][114] ([Intel XE#2887]) +4 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][115] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][116] ([Intel XE#4947])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][117] ([Intel XE#3432]) -> [SKIP][118] ([Intel XE#4947]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][119] ([Intel XE#4947]) -> [SKIP][120] ([Intel XE#3432]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][121] ([Intel XE#2887]) -> [SKIP][122] ([Intel XE#4947]) +11 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][123] ([Intel XE#4950]) -> [SKIP][124] ([Intel XE#2325]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][125] ([Intel XE#2325]) -> [SKIP][126] ([Intel XE#4950])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-bmg:          [SKIP][127] ([Intel XE#4950]) -> [SKIP][128] ([Intel XE#2252]) +5 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_chamelium_frames@dp-crc-single.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-bmg:          [SKIP][129] ([Intel XE#2252]) -> [SKIP][130] ([Intel XE#4950]) +7 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][131] ([Intel XE#4950]) -> [FAIL][132] ([Intel XE#1178]) +1 other test fail
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_content_protection@atomic.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][133] ([Intel XE#2390]) -> [SKIP][134] ([Intel XE#4950]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          [SKIP][135] ([Intel XE#2341]) -> [SKIP][136] ([Intel XE#4950])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_content_protection@lic-type-1.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][137] ([Intel XE#4950]) -> [SKIP][138] ([Intel XE#2341])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_content_protection@type1.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          [SKIP][139] ([Intel XE#2321]) -> [SKIP][140] ([Intel XE#4950])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-bmg:          [SKIP][141] ([Intel XE#2320]) -> [SKIP][142] ([Intel XE#4950])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          [SKIP][143] ([Intel XE#4950]) -> [SKIP][144] ([Intel XE#2320])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][145] ([Intel XE#4950]) -> [SKIP][146] ([Intel XE#2321])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][147] ([Intel XE#1508]) -> [SKIP][148] ([Intel XE#4947])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          [SKIP][149] ([Intel XE#4354]) -> [SKIP][150] ([Intel XE#4947])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-mst.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [SKIP][151] ([Intel XE#4947]) -> [SKIP][152] ([Intel XE#4354])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][153] ([Intel XE#4947]) -> [SKIP][154] ([Intel XE#2244])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][155] ([Intel XE#4950]) -> [SKIP][156] ([Intel XE#1138])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_feature_discovery@display-4x.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][157] ([Intel XE#2374]) -> [SKIP][158] ([Intel XE#4950])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_feature_discovery@psr2.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][159] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][160] ([Intel XE#4947]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][161] ([Intel XE#4947]) -> [SKIP][162] ([Intel XE#2293] / [Intel XE#2380])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][163] ([Intel XE#4947]) -> [SKIP][164] ([Intel XE#2311]) +13 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][165] ([Intel XE#2312]) -> [SKIP][166] ([Intel XE#2311]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][167] ([Intel XE#2311]) -> [SKIP][168] ([Intel XE#2312]) +3 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][169] ([Intel XE#2311]) -> [SKIP][170] ([Intel XE#4947]) +22 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][171] ([Intel XE#4947]) -> [SKIP][172] ([Intel XE#5390]) +7 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          [SKIP][173] ([Intel XE#4947]) -> [SKIP][174] ([Intel XE#5427])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][175] ([Intel XE#2312]) -> [SKIP][176] ([Intel XE#5390])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][177] ([Intel XE#5390]) -> [SKIP][178] ([Intel XE#4947]) +10 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][179] ([Intel XE#5390]) -> [SKIP][180] ([Intel XE#2312]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][181] ([Intel XE#2313]) -> [SKIP][182] ([Intel XE#4947]) +24 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][183] ([Intel XE#2313]) -> [SKIP][184] ([Intel XE#2312]) +3 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][185] ([Intel XE#2312]) -> [SKIP][186] ([Intel XE#2313]) +4 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [SKIP][187] ([Intel XE#4947]) -> [SKIP][188] ([Intel XE#5672])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][189] ([Intel XE#4947]) -> [SKIP][190] ([Intel XE#2313]) +18 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][191] ([Intel XE#4947]) -> [SKIP][192] ([Intel XE#2934])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][193] ([Intel XE#4090]) -> [SKIP][194] ([Intel XE#4947])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][195] ([Intel XE#4950]) -> [SKIP][196] ([Intel XE#2501])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          [SKIP][197] ([Intel XE#4329]) -> [SKIP][198] ([Intel XE#4947])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][199] ([Intel XE#4950]) -> [SKIP][200] ([Intel XE#2393])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][201] ([Intel XE#5020]) -> [SKIP][202] ([Intel XE#4950])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][203] ([Intel XE#4950]) -> [SKIP][204] ([Intel XE#2763])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][205] ([Intel XE#870]) -> [SKIP][206] ([Intel XE#4947])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_pm_backlight@fade.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][207] ([Intel XE#2391]) -> [SKIP][208] ([Intel XE#4947])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][209] ([Intel XE#2392]) -> [SKIP][210] ([Intel XE#4947])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][211] ([Intel XE#4947]) -> [SKIP][212] ([Intel XE#1489]) +3 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][213] ([Intel XE#1489]) -> [SKIP][214] ([Intel XE#4947]) +5 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][215] ([Intel XE#4947]) -> [SKIP][216] ([Intel XE#2387])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][217] ([Intel XE#2387]) -> [SKIP][218] ([Intel XE#4947]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_psr2_su@page_flip-p010.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][219] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][220] ([Intel XE#4947]) +7 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][221] ([Intel XE#2234]) -> [SKIP][222] ([Intel XE#4947])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_psr@psr2-primary-render.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          [SKIP][223] ([Intel XE#4947]) -> [SKIP][224] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][225] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][226] ([Intel XE#4950])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-90.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][227] ([Intel XE#2330]) -> [SKIP][228] ([Intel XE#4950])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][229] ([Intel XE#4950]) -> [SKIP][230] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          [SKIP][231] ([Intel XE#2413]) -> [SKIP][232] ([Intel XE#4950])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][233] ([Intel XE#4950]) -> [FAIL][234] ([Intel XE#1729])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#362]) -> [SKIP][236] ([Intel XE#1500])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          [SKIP][237] ([Intel XE#4950]) -> [SKIP][238] ([Intel XE#1499])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          [SKIP][239] ([Intel XE#4950]) -> [SKIP][240] ([Intel XE#1091] / [Intel XE#2849])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_eudebug@basic-vm-access-faultable:
    - shard-bmg:          [SKIP][241] ([Intel XE#4837]) -> [SKIP][242] ([Intel XE#4945]) +9 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@xe_eudebug@basic-vm-access-faultable.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_eudebug@basic-vm-access-faultable.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][243] ([Intel XE#4945]) -> [SKIP][244] ([Intel XE#4837]) +9 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          [SKIP][245] ([Intel XE#4518]) -> [SKIP][246] ([Intel XE#4945])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@xe_eudebug_sriov@deny-eudebug.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][247] ([Intel XE#2322]) -> [SKIP][248] ([Intel XE#4945]) +6 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][249] ([Intel XE#4945]) -> [SKIP][250] ([Intel XE#2322]) +3 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [SKIP][251] ([Intel XE#4945]) -> [DMESG-WARN][252] ([Intel XE#3876])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@once-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][253] ([Intel XE#4945]) -> [SKIP][254] ([Intel XE#4943]) +16 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][255] ([Intel XE#4943]) -> [SKIP][256] ([Intel XE#4945]) +12 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [SKIP][257] ([Intel XE#4945]) -> [ABORT][258] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-bmg:          [ABORT][259] ([Intel XE#5530]) -> [SKIP][260] ([Intel XE#4945])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [SKIP][261] ([Intel XE#4945]) -> [SKIP][262] ([Intel XE#2459] / [Intel XE#2596])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_media_fill@media-fill.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_media_fill@media-fill.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][263] ([Intel XE#4945]) -> [SKIP][264] ([Intel XE#2245])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_pat@pat-index-xelp.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          [SKIP][265] ([Intel XE#4945]) -> [SKIP][266] ([Intel XE#2284])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_pm@d3cold-basic.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][267] ([Intel XE#5694]) -> [SKIP][268] ([Intel XE#4945])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_pm@d3cold-i2c.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][269] ([Intel XE#2284]) -> [SKIP][270] ([Intel XE#4945]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          [SKIP][271] ([Intel XE#4945]) -> [SKIP][272] ([Intel XE#4650])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          [SKIP][273] ([Intel XE#4945]) -> [SKIP][274] ([Intel XE#4733]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          [SKIP][275] ([Intel XE#4733]) -> [SKIP][276] ([Intel XE#4945])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_query@multigpu-query-config:
    - shard-bmg:          [SKIP][277] ([Intel XE#944]) -> [SKIP][278] ([Intel XE#4945]) +2 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_query@multigpu-query-config.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][279] ([Intel XE#4945]) -> [SKIP][280] ([Intel XE#944]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          [SKIP][281] ([Intel XE#4130]) -> [SKIP][282] ([Intel XE#4945])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-bmg:          [SKIP][283] ([Intel XE#4351]) -> [SKIP][284] ([Intel XE#4945])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_sriov_scheduling@equal-throughput.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
  [Intel XE#4672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5427
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560
  [Intel XE#5672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a -> xe-pw-148982v10

  IGT_8482: 8482
  xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a: acb5c859a41719652f1807b30240ca4ee82a473a
  xe-pw-148982v10: 148982v10

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/index.html

--===============7815283079581602453==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Post-migration recovery of queues and jobs (rev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148982/">https://patchwork.freedesktop.org/series/148982/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a_FULL -&gt; xe-pw-148982v10_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148982v10_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-148982v10_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-148982v10_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-6/igt@xe_exec_balancer@once-cm-parallel-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-2/igt@xe_exec_balancer@once-cm-parallel-userptr.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-3/igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@xe_exec_system_allocator@process-many-malloc-bo-unmap-nomemset.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-xe_sync_entry_parse.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a_FULL and xe-pw-148982v10_FULL:</p>
<h3>New IGT tests (10)</h3>
<ul>
<li>
<p>igt@kms_async_flips@crc@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [8.97, 9.36] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148982v10_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@core_setmaster@master-drop-set-root.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672">Intel XE#4672</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-1/igt@kms_atomic_transition@modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-8/igt@kms_atomic_transition@modeset-transition.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_content_protection@atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-6/igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-malloc-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-malloc-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +306 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-fork-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-4/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-fork-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560">Intel XE#5560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@core_hotunplug@hotunplug-rescan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@fbdev@info.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_addfb_basic@bad-pitch-999.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_addfb_basic@bad-pitch-999.html">PASS</a> +45 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-adlp-6/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-adlp-3/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-436/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_exec_system_allocator@process-many-new-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_exec_system_allocator@process-many-new-nomemset.html">PASS</a> +230 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@xe_live_ktest@xe_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665">Intel XE#4665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177">Intel XE#5177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5427">Intel XE#5427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672">Intel XE#5672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-faultable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@xe_eudebug@basic-vm-access-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_eudebug@basic-vm-access-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-4/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-8/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a/shard-bmg-2/igt@xe_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148982v10/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a -&gt; xe-pw-148982v10</li>
</ul>
<p>IGT_8482: 8482<br />
  xe-3498-acb5c859a41719652f1807b30240ca4ee82a473a: acb5c859a41719652f1807b30240ca4ee82a473a<br />
  xe-pw-148982v10: 148982v10</p>

</body>
</html>

--===============7815283079581602453==--
