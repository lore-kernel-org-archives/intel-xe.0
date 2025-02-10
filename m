Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4B5C0219B
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 06:55:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7AA210E15F;
	Mon, 10 Feb 2025 06:55:53 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA07210E15F;
 Mon, 10 Feb 2025 06:55:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6611743187792277329=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Cleanup_error_handling_on_?=
 =?utf-8?q?probe_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Feb 2025 06:55:52 -0000
Message-ID: <173917055274.149141.2436087773233862981@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
In-Reply-To: <20250207221945.2878241-1-lucas.demarchi@intel.com>
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

--===============6611743187792277329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Cleanup error handling on probe (rev3)
URL   : https://patchwork.freedesktop.org/series/144211/
State : failure

== Summary ==

CI Bug Log - changes from xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085_full -> xe-pw-144211v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144211v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144211v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144211v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color@ctm-0-75:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-2/igt@kms_color@ctm-0-75.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-1/igt@kms_color@ctm-0-75.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2-set2:     [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-436/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-adlp:         [PASS][5] -> [ABORT][6] +16 other tests abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-9/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [ABORT][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [ABORT][8] ([Intel XE#3914]) -> [ABORT][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-8/igt@core_hotunplug@hotreplug.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-4/igt@core_hotunplug@hotreplug.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [DMESG-WARN][10] ([Intel XE#1033]) -> [DMESG-WARN][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-adlp:         [DMESG-WARN][12] ([Intel XE#4173]) -> [ABORT][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  
Known issues
------------

  Here are the changes found in xe-pw-144211v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-4-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#2550] / [Intel XE#3767]) +7 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-4-4-mc-ccs.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][15] -> [FAIL][16] ([Intel XE#3908]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-9/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1407])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-lnl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [PASS][18] -> [DMESG-WARN][19] ([Intel XE#877])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][20] -> [SKIP][21] ([Intel XE#2314] / [Intel XE#2894])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
    - shard-dg2-set2:     [PASS][22] -> [SKIP][23] ([Intel XE#2191])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#787]) +47 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][26] ([Intel XE#1033]) +3 other tests dmesg-warn
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][27] -> [INCOMPLETE][28] ([Intel XE#4010])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3:
    - shard-bmg:          [PASS][30] -> [DMESG-WARN][31] ([Intel XE#877]) +1 other test dmesg-warn
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-6/igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-2/igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][32] ([Intel XE#1178])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-4/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][33] ([Intel XE#1188])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][34] ([Intel XE#1188])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-435/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2-set2:     [PASS][35] -> [SKIP][36] ([Intel XE#309]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#2291]) +7 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [PASS][39] -> [INCOMPLETE][40] ([Intel XE#3226])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2-set2:     [PASS][41] -> [SKIP][42] ([Intel XE#455])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#3009])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-1/igt@kms_dp_aux_dev.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-dg2-set2:     [PASS][45] -> [SKIP][46] ([Intel XE#310]) +5 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#2316]) +7 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][49] -> [FAIL][50] ([Intel XE#3321]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][51] ([Intel XE#2049] / [Intel XE#2597])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
    - shard-dg2-set2:     [PASS][52] -> [FAIL][53] ([Intel XE#301]) +2 other tests fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][54] -> [DMESG-WARN][55] ([Intel XE#2953]) +1 other test dmesg-warn
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [PASS][56] -> [FAIL][57] ([Intel XE#3149] / [Intel XE#886])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-lnl-2/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1:
    - shard-lnl:          [PASS][58] -> [FAIL][59] ([Intel XE#886]) +2 other tests fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-lnl-2/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html

  * igt@kms_flip@wf_vblank-ts-check@b-dp2:
    - shard-bmg:          [PASS][60] -> [INCOMPLETE][61] ([Intel XE#2049]) +1 other test incomplete
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check@b-dp2.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check@b-dp2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-bmg:          [PASS][62] -> [DMESG-WARN][63] ([Intel XE#4172]) +8 other tests dmesg-warn
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [PASS][64] -> [SKIP][65] ([Intel XE#656]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#656])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2-set2:     [PASS][67] -> [DMESG-WARN][68] ([Intel XE#1033]) +14 other tests dmesg-warn
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_hdr@bpc-switch-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-435/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][69] -> [SKIP][70] ([Intel XE#3012])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [PASS][71] -> [SKIP][72] ([Intel XE#836])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-dg2-set2:     [PASS][73] -> [DMESG-WARN][74] ([Intel XE#1033] / [Intel XE#2042])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_pm_rpm@universal-planes-dpms.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-435/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][75] -> [SKIP][76] ([Intel XE#1435])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][77] -> [FAIL][78] ([Intel XE#2159]) +1 other test fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#1091] / [Intel XE#2849])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][80] -> [SKIP][81] ([Intel XE#1192])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-5/igt@xe_live_ktest@xe_bo.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-bmg:          [PASS][82] -> [DMESG-WARN][83] ([Intel XE#4172] / [Intel XE#569])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-4/igt@xe_pm@s3-vm-bind-prefetch.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-1/igt@xe_pm@s3-vm-bind-prefetch.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][84] ([Intel XE#2191]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
    - shard-bmg:          [SKIP][86] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][88] ([Intel XE#4010]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][90] ([Intel XE#309]) -> [PASS][91] +3 other tests pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-435/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][92] ([Intel XE#2291]) -> [PASS][93] +5 other tests pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [SKIP][94] ([Intel XE#310]) -> [PASS][95] +9 other tests pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-435/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][96] ([Intel XE#301]) -> [PASS][97] +1 other test pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][98] ([Intel XE#2316]) -> [PASS][99] +6 other tests pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp2:
    - shard-bmg:          [FAIL][100] ([Intel XE#3321]) -> [PASS][101] +3 other tests pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][102] ([Intel XE#2953]) -> [PASS][103] +1 other test pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-8/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-8/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2:
    - shard-bmg:          [FAIL][104] ([Intel XE#2882]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [DMESG-WARN][106] ([Intel XE#1033]) -> [PASS][107] +4 other tests pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][108] ([Intel XE#656]) -> [PASS][109] +5 other tests pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][110] ([Intel XE#616]) -> [PASS][111] +1 other test pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_plane_cursor@viewport.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_plane_cursor@viewport.html
    - shard-lnl:          [INCOMPLETE][112] -> [PASS][113] +1 other test pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-lnl-1/igt@kms_plane_cursor@viewport.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-lnl-1/igt@kms_plane_cursor@viewport.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][114] ([Intel XE#1435]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#455]) -> [PASS][117] +1 other test pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-436/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind:
    - shard-bmg:          [DMESG-WARN][118] ([Intel XE#4172]) -> [PASS][119] +3 other tests pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-5/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-2/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_threads@threads-hang-userptr-rebind:
    - shard-dg2-set2:     [DMESG-WARN][120] ([Intel XE#3876]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@xe_exec_threads@threads-hang-userptr-rebind.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-435/igt@xe_exec_threads@threads-hang-userptr-rebind.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [SKIP][122] ([Intel XE#1192]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-6/igt@xe_live_ktest@xe_migrate.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-4/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][124], [PASS][125], [PASS][126], [SKIP][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149]) ([Intel XE#378]) -> ([PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-3/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-4/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-4/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-6/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-4/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-6/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-8/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-3/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-3/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-3/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-2/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-2/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-6/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-6/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-3/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-4/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-8/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-8/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-8/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-2/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-9/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-2/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-9/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-9/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-6/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-3/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-3/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-3/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-3/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-3/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-2/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-8/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-4/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-6/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-6/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-6/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-8/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-8/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-9/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-8/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-4/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-9/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-9/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-9/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-6/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-6/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-2/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-2/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-2/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-4/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-4/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][176] ([Intel XE#787]) +15 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#787]) -> [SKIP][178] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][179] ([Intel XE#2341]) -> [FAIL][180] ([Intel XE#1178])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-6/igt@kms_content_protection@legacy.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][181] ([Intel XE#1178]) -> [SKIP][182] ([Intel XE#2341])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-7/igt@kms_content_protection@srm.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-6/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#455]) -> [FAIL][184] ([Intel XE#1188])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_content_protection@uevent.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-435/igt@kms_content_protection@uevent.html
    - shard-bmg:          [SKIP][185] ([Intel XE#2341]) -> [FAIL][186] ([Intel XE#1188])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-6/igt@kms_content_protection@uevent.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#309]) -> [DMESG-WARN][188] ([Intel XE#1033])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-dg2-set2:     [DMESG-WARN][189] ([Intel XE#1033]) -> [SKIP][190] ([Intel XE#309]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [SKIP][191] ([Intel XE#2291]) -> [DMESG-WARN][192] ([Intel XE#877])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][193] ([i915#3804]) -> [SKIP][194] ([Intel XE#455] / [i915#3804])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][195] ([Intel XE#3321]) -> [SKIP][196] ([Intel XE#2316])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#310]) -> [INCOMPLETE][198] ([Intel XE#2049] / [Intel XE#2597])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][199] ([Intel XE#1033]) -> [SKIP][200] ([Intel XE#310])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-436/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-bmg:          [DMESG-FAIL][201] ([Intel XE#4172]) -> [DMESG-WARN][202] ([Intel XE#4172])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][203] ([Intel XE#2312]) -> [SKIP][204] ([Intel XE#2311]) +16 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#651]) -> [SKIP][206] ([Intel XE#656]) +17 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][207] ([Intel XE#4141]) -> [SKIP][208] ([Intel XE#2312]) +10 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#656]) -> [DMESG-WARN][210] ([Intel XE#1033])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [DMESG-WARN][211] ([Intel XE#1033]) -> [SKIP][212] ([Intel XE#656]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][213] ([Intel XE#2312]) -> [SKIP][214] ([Intel XE#4141]) +6 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][215] ([Intel XE#2311]) -> [SKIP][216] ([Intel XE#2312]) +21 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#656]) -> [SKIP][218] ([Intel XE#651]) +17 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#653]) -> [SKIP][220] ([Intel XE#656]) +18 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][221] ([Intel XE#2313]) -> [SKIP][222] ([Intel XE#2312]) +24 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#656]) -> [SKIP][224] ([Intel XE#653]) +19 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][225] ([Intel XE#2312]) -> [SKIP][226] ([Intel XE#2313]) +22 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][227] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][228] ([Intel XE#3544])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#362]) -> [FAIL][230] ([Intel XE#1729])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#3914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085 -> xe-pw-144211v3

  IGT_8227: 8227
  xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085: 4f934139887fd60bd4ac9027b7eec3e86ade8085
  xe-pw-144211v3: 144211v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/index.html

--===============6611743187792277329==
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
<tr><td><b>Series:</b></td><td>Cleanup error handling on probe (rev3)</td><=
/tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/144211/">https://patchwork.freedesktop.org/series/144211/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-144211v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144211v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2621-4f934139887fd60bd4ac9027b7eec3e86=
ade8085_full -&gt; xe-pw-144211v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144211v3_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-144211v3_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1442=
11v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-2/igt@kms_colo=
r@ctm-0-75.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-144211v3/shard-bmg-1/igt@kms_color@ctm-0-75.html">INCOMPLET=
E</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-436/igt@kms_jo=
iner@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_j=
oiner@invalid-modeset-force-big-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-2/igt@xe_faul=
t_injection@vm-create-fail-xe_vm_create_scratch.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-9/=
igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">ABORT</a> =
+16 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v3/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.htm=
l">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-8/igt@core_ho=
tunplug@hotreplug.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3914">Intel XE#3914</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-4/igt@core_hotunp=
lug@hotreplug.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1442=
11v3/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.ht=
ml">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-2/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Inte=
l XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-144211v3/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-functi=
on-xe_guc_ct_init.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144211v3_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-4-4-mc-cc=
s:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v3/shard-dg2-436/igt@kms_async_flips@async-flip-=
with-page-flip-events@pipe-d-dp-4-4-mc-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE=
#3767</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-9/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-2/i=
gt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE=
#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v3/shard-lnl-1/igt@kms_big_fb@4-tiled-8bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_bi=
g_fb@linear-64bpp-rotate-180.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_big_fb@lin=
ear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-4/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-466/igt@kms_bw=
@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/=
igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE=
#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v3/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +47 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v3/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v3/shard-dg2-436/igt@kms_ccs@crc-primary-suspend=
-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +3 ot=
her tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg=
2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v3/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-6/igt@kms_colo=
r@ctm-red-to-blue@pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-2/igt@kms_color@c=
tm-red-to-blue@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other te=
st dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v3/shard-bmg-4/igt@kms_content_protection@legacy=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v3/shard-bmg-7/igt@kms_content_protection@uevent=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v3/shard-dg2-435/igt@kms_content_protection@ueve=
nt@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/=
shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-var=
ying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-8/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-6/igt@kms_cursor_=
legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +7 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-7/igt@kms_curs=
or_legacy@cursorb-vs-flipb-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-7/igt@kms_cursor_=
legacy@cursorb-vs-flipb-legacy.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_dither@fb-8b=
pc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-1/igt@kms_dp_a=
ux_dev.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-144211v3/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_fl=
ip@2x-dpms-vs-vblank-race-interruptible.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms=
_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +5 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-4/ig=
t@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#=
2316</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard=
-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v3/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend=
-interruptible@ac-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_fl=
ip@flip-vs-expired-vblank@c-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_fli=
p@flip-vs-expired-vblank@c-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-8/igt@kms_flip@flip-vs=
-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +1 other test dmesg-w=
arn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-lnl-2/igt@kms_flip=
@plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-lnl-3/igt@kms_flip@p=
lain-flip-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-lnl-2/igt@kms_flip=
@plain-flip-ts-check-interruptible@c-edp1.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-lnl-3/igt@kms=
_flip@plain-flip-ts-check-interruptible@c-edp1.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +=
2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-4/igt@kms_flip=
@wf_vblank-ts-check@b-dp2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-5/igt@kms_flip@wf_vblank-=
ts-check@b-dp2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test incomplete<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-4/igt@kms_flip=
_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard=
-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4172">Intel XE#4172</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-d=
g2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_hd=
r@bpc-switch-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-435/igt@kms_hdr@bpc-switch-sus=
pend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1033">Intel XE#1033</a>) +14 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-8/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-6/igt@kms_joine=
r@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-466/igt@kms_pm=
_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_pm_rpm@modeset-no=
n-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_pm=
_rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-435/igt@kms_pm_rpm@unive=
rsal-planes-dpms.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-1/igt@kms_setm=
ode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-4/igt@kms_setmode@inv=
alid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-lnl-8/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-144211v3/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@sriov_basic@enable-vfs-bind=
-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-5/igt@xe_live_=
ktest@xe_bo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-144211v3/shard-bmg-2/igt@xe_live_ktest@xe_bo.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Int=
el XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-4/igt@xe_pm@s3=
-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-144211v3/shard-bmg-1/igt@xe_pm@s3-vm-bind-prefetch.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4172">Intel XE#4172</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/=
shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html=
">PASS</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144211v3/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x=
2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/s=
hard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_cu=
rsor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211=
v3/shard-dg2-435/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-ato=
mic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144211v3/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-trans=
itions-varying-size.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_fl=
ip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-=
435/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">PASS</a> +9 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144211v3/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@ad-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg=
-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> +6 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-5/igt@kms_flip=
@flip-vs-expired-vblank@d-dp2.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-2/igt@k=
ms_flip@flip-vs-expired-vblank@d-dp2.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-8/=
igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a> +1 other test pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-5/igt@kms_flip=
@wf_vblank-ts-check-interruptible@a-dp2.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-b=
mg-2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel X=
E#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144211v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb=
-pgflip-blt.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211=
v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-ono=
ff.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_pl=
ane_cursor@viewport.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-464/igt@kms_plane_c=
ursor@viewport.html">PASS</a> +1 other test pass</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-lnl-1/igt@kms_plan=
e_cursor@viewport.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-144211v3/shard-lnl-1/igt@kms_plane_cursor@view=
port.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-6/igt@kms_setm=
ode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-2/igt@kms_se=
tmode@clone-exclusive-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg=
2-436/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-5/igt@xe_exec_=
basic@many-execqueues-bindexecqueue-userptr-rebind.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE=
#4172</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-144211v3/shard-bmg-2/igt@xe_exec_basic@many-execqueues-bindexecqueue-userp=
tr-rebind.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@xe_exe=
c_threads@threads-hang-userptr-rebind.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/sha=
rd-dg2-435/igt@xe_exec_threads@threads-hang-userptr-rebind.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-6/igt@xe_live_=
ktest@xe_migrate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-4/igt@xe_live_ktest@=
xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-ad=
lp-6/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/sha=
rd-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade808=
5/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86a=
de8085/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec=
3e86ade8085/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027=
b7eec3e86ade8085/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4a=
c9027b7eec3e86ade8085/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd6=
0bd4ac9027b7eec3e86ade8085/shard-adlp-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f9341398=
87fd60bd4ac9027b7eec3e86ade8085/shard-adlp-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f93=
4139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621=
-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-3/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-adlp-8/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-ad=
lp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/sha=
rd-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade808=
5/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec3e86a=
de8085/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027b7eec=
3e86ade8085/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4ac9027=
b7eec3e86ade8085/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd60bd4a=
c9027b7eec3e86ade8085/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2621-4f934139887fd6=
0bd4ac9027b7eec3e86ade8085/shard-adlp-3/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-144211v3/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-3/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1442=
11v3/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-144211v3/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-a=
dlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-6/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-144211v3/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-6/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-144211v3/shard-adlp-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/sh=
ard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-9/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-144211v3/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-4/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-144211v3/shard-adlp-9/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211=
v3/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-9/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-144211v3/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adl=
p-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44211v3/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-adlp-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-144211v3/shard-adlp-4/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shar=
d-adlp-4/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_cc=
s@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#4=
55</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787=
">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-144211v3/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl=
-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_cc=
s@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE=
#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144211v3/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@=
pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-6/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-4/igt@kms_conte=
nt_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-7/igt@kms_cont=
ent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-6/igt@kms_content_=
protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_co=
ntent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-435/igt@kms_con=
tent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-6/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-7/igt@kms_conte=
nt_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel=
 XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144211v3/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-tra=
nsitions-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-436/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-legacy.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard=
-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#30=
9</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-b=
mg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Int=
el XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shar=
d-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-6/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-436=
/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#204=
9</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597=
">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-wf_vblank-interruptible.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/sha=
rd-dg2-464/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel X=
E#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-5/igt@kms_flip=
@wf_vblank-ts-check-interruptible.html">DMESG-FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-b=
mg-2/igt@kms_flip@wf_vblank-ts-check-interruptible.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE=
#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/sh=
ard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311=
">Intel XE#2311</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44211v3/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144211v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1442=
11v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-d=
raw-blt.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel X=
E#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144211v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44211v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-144211v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel =
XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144211v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-s=
pr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1442=
11v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indf=
b-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/656">Intel XE#656</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1442=
11v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE=
#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144211v3/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/653">Intel XE#653</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4211v3/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-bmg-5/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-bmg-4/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085/shard-dg2-464/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144211v3/shard-dg2-435/igt@=
kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085 -&gt; xe-pw-144=
211v3</li>
</ul>
<p>IGT_8227: 8227<br />
  xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085: 4f934139887fd60bd4ac902=
7b7eec3e86ade8085<br />
  xe-pw-144211v3: 144211v3</p>

</body>
</html>

--===============6611743187792277329==--
