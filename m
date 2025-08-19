Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EDCCA0EF5
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 07:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE3210E556;
	Tue, 19 Aug 2025 07:54:52 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894BC10E548;
 Tue, 19 Aug 2025 07:54:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7021061575803188177=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Tile_and_GT_counting_impro?=
 =?utf-8?q?vements_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Aug 2025 07:54:51 -0000
Message-ID: <175559009155.246857.16703608210812796104@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250818-gt_count-improvements-v3-0-32f6901e42e6@intel.com>
In-Reply-To: <20250818-gt_count-improvements-v3-0-32f6901e42e6@intel.com>
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

--===============7021061575803188177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Tile and GT counting improvements (rev3)
URL   : https://patchwork.freedesktop.org/series/152026/
State : failure

== Summary ==

CI Bug Log - changes from xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697_FULL -> xe-pw-152026v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152026v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152026v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152026v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pmu@engine-activity-most-load-idle:
    - shard-adlp:         [PASS][1] -> [ABORT][2] +25 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-adlp-3/igt@xe_pmu@engine-activity-most-load-idle.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-adlp-9/igt@xe_pmu@engine-activity-most-load-idle.html
    - shard-bmg:          [PASS][3] -> [ABORT][4] +22 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-5/igt@xe_pmu@engine-activity-most-load-idle.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-3/igt@xe_pmu@engine-activity-most-load-idle.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_pmu@engine-activity-render-node-idle}:
    - shard-adlp:         [PASS][5] -> [ABORT][6] +9 other tests abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-adlp-4/igt@xe_pmu@engine-activity-render-node-idle.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-adlp-6/igt@xe_pmu@engine-activity-render-node-idle.html
    - shard-bmg:          [PASS][7] -> [ABORT][8] +9 other tests abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-1/igt@xe_pmu@engine-activity-render-node-idle.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-2/igt@xe_pmu@engine-activity-render-node-idle.html

  
Known issues
------------

  Here are the changes found in xe-pw-152026v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1124]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-adlp:         [PASS][10] -> [DMESG-WARN][11] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-adlp-6/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#2314] / [Intel XE#2894])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#787]) +48 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][16] -> [INCOMPLETE][17] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) +1 other test incomplete
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][18] -> [INCOMPLETE][19] ([Intel XE#3124])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][20] -> [DMESG-WARN][21] ([Intel XE#1727] / [Intel XE#3113])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][22] ([Intel XE#1178])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-5/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-dg2-set2:     [PASS][23] -> [INCOMPLETE][24] ([Intel XE#3226])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [PASS][25] -> [FAIL][26] ([Intel XE#1475])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#4354])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-sst.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#455])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#2316]) +6 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][32] -> [FAIL][33] ([Intel XE#301])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-adlp:         [PASS][34] -> [DMESG-WARN][35] ([Intel XE#4543])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][36] -> [FAIL][37] ([Intel XE#1874])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][38] -> [DMESG-FAIL][39] ([Intel XE#4543]) +2 other tests dmesg-fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#1503]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#2571])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_psr@fbc-psr2-primary-page-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#2850] / [Intel XE#5899] / [Intel XE#929])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-page-flip.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1127])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#1435])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#4837])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-dg2-set2:     [PASS][49] -> [SKIP][50] ([Intel XE#1392]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-dg2-433/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#288]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-remap-ro-dontunmap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#4915]) +4 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-435/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-remap-ro-dontunmap-eocheck.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [FAIL][53] ([Intel XE#911]) -> [PASS][54] +3 other tests pass
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][55] ([Intel XE#4543]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][57] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][59] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][61] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][63] ([Intel XE#2291]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-bmg:          [SKIP][65] ([Intel XE#2316]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-5/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][67] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][69] ([Intel XE#4543]) -> [PASS][70] +3 other tests pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][71] ([Intel XE#616]) -> [PASS][72] +1 other test pass
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-dg2-434/igt@kms_plane_cursor@viewport.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-436/igt@kms_plane_cursor@viewport.html

  * igt@kms_sequence@queue-idle@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][73] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][74] +2 other tests pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-adlp-6/igt@kms_sequence@queue-idle@pipe-a-hdmi-a-1.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-adlp-8/igt@kms_sequence@queue-idle@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][75] ([Intel XE#4459]) -> [PASS][76] +1 other test pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][77] ([Intel XE#1392]) -> [PASS][78] +1 other test pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  
#### Warnings ####

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][79] ([Intel XE#2341]) -> [FAIL][80] ([Intel XE#1178])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-6/igt@kms_content_protection@legacy.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-5/igt@kms_content_protection@legacy.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][81] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][82] ([Intel XE#301])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][83] ([Intel XE#2312]) -> [SKIP][84] ([Intel XE#5390]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][85] ([Intel XE#5390]) -> [SKIP][86] ([Intel XE#2312]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][87] ([Intel XE#2312]) -> [SKIP][88] ([Intel XE#2311]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][89] ([Intel XE#2311]) -> [SKIP][90] ([Intel XE#2312]) +7 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][91] ([Intel XE#2313]) -> [SKIP][92] ([Intel XE#2312]) +5 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][93] ([Intel XE#2312]) -> [SKIP][94] ([Intel XE#2313]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-lnl:          [ABORT][95] ([Intel XE#4917] / [Intel XE#5466]) -> [ABORT][96] ([Intel XE#5466])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-lnl-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-lnl-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#5899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929


Build changes
-------------

  * Linux: xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697 -> xe-pw-152026v3

  IGT_8495: b412b144685feadfd5675f3108de3d6820a4d1db @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697: edead24a80ae92312f75626eb92f2771ec5a7697
  xe-pw-152026v3: 152026v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/index.html

--===============7021061575803188177==
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
<tr><td><b>Series:</b></td><td>Tile and GT counting improvements (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152026/">https://patchwork.freedesktop.org/series/152026/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697_FULL -&gt; xe-pw-152026v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152026v3_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-152026v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-152026v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pmu@engine-activity-most-load-idle:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-adlp-3/igt@xe_pmu@engine-activity-most-load-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-adlp-9/igt@xe_pmu@engine-activity-most-load-idle.html">ABORT</a> +25 other tests abort</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-5/igt@xe_pmu@engine-activity-most-load-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-3/igt@xe_pmu@engine-activity-most-load-idle.html">ABORT</a> +22 other tests abort</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_pmu@engine-activity-render-node-idle}:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-adlp-4/igt@xe_pmu@engine-activity-render-node-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-adlp-6/igt@xe_pmu@engine-activity-render-node-idle.html">ABORT</a> +9 other tests abort</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-1/igt@xe_pmu@engine-activity-render-node-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-2/igt@xe_pmu@engine-activity-render-node-idle.html">ABORT</a> +9 other tests abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152026v3_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-adlp-6/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-5/igt@kms_content_protection@legacy@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899">Intel XE#5899</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-dg2-433/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-remap-ro-dontunmap-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-435/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-remap-ro-dontunmap-eocheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +4 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-5/igt@kms_flip@2x-absolute-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-dg2-434/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-436/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-idle@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-adlp-6/igt@kms_sequence@queue-idle@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-adlp-8/igt@kms_sequence@queue-idle@pipe-a-hdmi-a-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-5/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697/shard-lnl-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v3/shard-lnl-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697 -&gt; xe-pw-152026v3</li>
</ul>
<p>IGT_8495: b412b144685feadfd5675f3108de3d6820a4d1db @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3569-edead24a80ae92312f75626eb92f2771ec5a7697: edead24a80ae92312f75626eb92f2771ec5a7697<br />
  xe-pw-152026v3: 152026v3</p>

</body>
</html>

--===============7021061575803188177==--
