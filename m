Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17FCCAC5BB
	for <intel-xe@archiver.kernel.org>; Sat,  4 Oct 2025 19:43:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2FF10E0B8;
	Sat,  4 Oct 2025 19:43:07 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51A610E0B8;
 Sat,  4 Oct 2025 19:43:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0382295572214275149=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe/guc=3A_Check_CT_ena?=
 =?utf-8?q?ble_state_before_deregistering_exec_queue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 04 Oct 2025 19:43:05 -0000
Message-ID: <175960698564.5798.4798208382011647413@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251004173033.2511250-2-shuicheng.lin@intel.com>
In-Reply-To: <20251004173033.2511250-2-shuicheng.lin@intel.com>
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

--===============0382295572214275149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Check CT enable state before deregistering exec queue
URL   : https://patchwork.freedesktop.org/series/155417/
State : success

== Summary ==

CI Bug Log - changes from xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47_FULL -> xe-pw-155417v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-155417v1_FULL:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add}:
    - shard-dg2-set2:     [SKIP][1] ([Intel XE#6281]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-434/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-432/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  
Known issues
------------

  Here are the changes found in xe-pw-155417v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#2314] / [Intel XE#2894])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#787]) +125 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][7] -> [INCOMPLETE][8] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#6168])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][9] -> [INCOMPLETE][10] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][11] ([Intel XE#1727] / [Intel XE#3113])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][12] ([Intel XE#6168])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][13] ([Intel XE#1727] / [Intel XE#3113])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][15] ([Intel XE#1178]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-435/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][16] ([Intel XE#1178])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-1/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2320])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-bmg:          [PASS][18] -> [SKIP][19] ([Intel XE#2291])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][20] -> [FAIL][21] ([Intel XE#4633])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#4494])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][23] -> [FAIL][24] ([Intel XE#4367])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#2316]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-7/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][27] -> [FAIL][28] ([Intel XE#301])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [PASS][29] -> [INCOMPLETE][30] ([Intel XE#2049] / [Intel XE#2597])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][31] -> [DMESG-WARN][32] ([Intel XE#4543]) +9 other tests dmesg-warn
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][33] ([Intel XE#2049] / [Intel XE#2597])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#1503])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#3012])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][38] -> [FAIL][39] ([Intel XE#2883]) +2 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [PASS][40] -> [DMESG-WARN][41] ([Intel XE#2953] / [Intel XE#4173]) +5 other tests dmesg-warn
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#5626])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-434/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#4837])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][44] ([Intel XE#4842])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [PASS][45] -> [SKIP][46] ([Intel XE#1392]) +5 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [PASS][47] -> [DMESG-WARN][48] ([Intel XE#3876])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-8/igt@xe_exec_reset@parallel-gt-reset.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-adlp-6/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#4915]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-434/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [PASS][50] -> [DMESG-WARN][51] ([Intel XE#5893])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-433/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_pmu@gt-frequency:
    - shard-lnl:          [PASS][52] -> [FAIL][53] ([Intel XE#5841]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-lnl-2/igt@xe_pmu@gt-frequency.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-lnl-5/igt@xe_pmu@gt-frequency.html

  
#### Possible fixes ####

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [FAIL][54] ([Intel XE#3884]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][56] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][58] ([Intel XE#2291]) -> [PASS][59] +3 other tests pass
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][60] ([Intel XE#1475]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][62] ([Intel XE#1340]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-bmg:          [SKIP][64] ([Intel XE#2316]) -> [PASS][65] +3 other tests pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][66] ([Intel XE#4543]) -> [PASS][67] +8 other tests pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-9/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-adlp-8/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][68] ([Intel XE#301]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][70] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][71] +2 other tests pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-3/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][72] ([Intel XE#2571]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * {igt@xe_configfs@ctx-restore-mid-bb-invalid}:
    - shard-dg2-set2:     [ABORT][74] -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-433/igt@xe_configfs@ctx-restore-mid-bb-invalid.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-434/igt@xe_configfs@ctx-restore-mid-bb-invalid.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][76] ([Intel XE#1392]) -> [PASS][77] +5 other tests pass
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-434/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:
    - shard-bmg:          [FAIL][78] ([Intel XE#6050]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-8/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_system_allocator@twice-malloc-nomemset:
    - shard-bmg:          [DMESG-FAIL][80] ([Intel XE#5213]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-4/igt@xe_exec_system_allocator@twice-malloc-nomemset.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-8/igt@xe_exec_system_allocator@twice-malloc-nomemset.html

  * igt@xe_pm@s2idle-basic:
    - shard-adlp:         [DMESG-WARN][82] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-9/igt@xe_pm@s2idle-basic.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-adlp-8/igt@xe_pm@s2idle-basic.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][84] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][85] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][86] ([Intel XE#2341]) -> [FAIL][87] ([Intel XE#1178])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_content_protection@atomic.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-1/igt@kms_content_protection@atomic.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][88] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][89] ([Intel XE#301])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][90] ([Intel XE#2953] / [Intel XE#4173]) -> [DMESG-WARN][91] ([Intel XE#4543])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-3/igt@kms_flip@flip-vs-suspend.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][92] ([Intel XE#2312]) -> [SKIP][93] ([Intel XE#2311]) +6 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][94] ([Intel XE#2312]) -> [SKIP][95] ([Intel XE#5390]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][96] ([Intel XE#5390]) -> [SKIP][97] ([Intel XE#2312]) +6 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][98] ([Intel XE#2311]) -> [SKIP][99] ([Intel XE#2312]) +6 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][100] ([Intel XE#2313]) -> [SKIP][101] ([Intel XE#2312]) +7 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][102] ([Intel XE#2312]) -> [SKIP][103] ([Intel XE#2313]) +6 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4367
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#5841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5841
  [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
  [Intel XE#6050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6050
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787


Build changes
-------------

  * Linux: xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47 -> xe-pw-155417v1

  IGT_8574: 44a15713124663a622c6eddf7c6ee5ba732e0d41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47: 0ce21448d1c984adf76d9dbfb3ad626ef8f33e47
  xe-pw-155417v1: 155417v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/index.html

--===============0382295572214275149==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Check CT enable state before der=
egistering exec queue</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/155417/">https://patchwork.freedesktop.org/series/155417/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155417v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-155417v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef=
8f33e47_FULL -&gt; xe-pw-155417v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1554=
17v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add}:<=
ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-434/igt@xe_fau=
lt_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel X=
E#6281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-155417v1/shard-dg2-432/igt@xe_fault_injection@exec-queue-create-fail-xe_p=
xp_exec_queue_add.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155417v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-=
tiled-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +125 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v1/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg=
2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-432/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">In=
tel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-d-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3=
113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-yf-=
tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v1/shard-dg2-435/igt@kms_content_protection@atom=
ic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v1/shard-bmg-1/igt@kms_content_protection@atomic=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v1/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding=
-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-7/igt@kms_curs=
or_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-6/igt@kms_c=
ursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-7/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-6/igt@kms_cursor_le=
gacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-7/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-1/igt@kms_dp_linktrai=
n_fallback@dp-fallback.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4367">Intel XE#4367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-wf_vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-6/igt@kms_flip@=
2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-lnl-2/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-432/igt@kms_fl=
ip@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155417v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-3/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-adlp-8/igt@kms_flip@flip-vs=
-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +9 other tests dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-=
dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-4/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-155417v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-3/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-6/igt@kms_joine=
r@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-lnl-7/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-155417v1/shard-lnl-8/igt@kms_setmode@basic@pipe=
-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-9/igt@kms_vbl=
ank@ts-continuation-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-adlp-9/igt@kms_vblank@ts-co=
ntinuation-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +5 othe=
r tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v1/shard-dg2-434/igt@xe_eu_stall@invalid-event-r=
eport-count.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v1/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-disc=
overy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v1/shard-dg2-434/igt@xe_exec_basic@multigpu-many=
-execqueues-many-vm-bindexecqueue-userptr-rebind.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842">Intel XE#4=
842</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-434/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-=
dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-8/igt@xe_exec=
_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-adlp-6/igt@xe_exec_reset@paral=
lel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155417v1/shard-dg2-434/igt@xe_exec_system_allocator@ma=
ny-execqueues-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-433/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-4=
34/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
93">Intel XE#5893</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-lnl-2/igt@xe_pmu@g=
t-frequency.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-155417v1/shard-lnl-5/igt@xe_pmu@gt-frequency.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5841">Int=
el XE#5841</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-2/igt@kms_asy=
nc_flips@crc-atomic@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-adlp-=
8/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
05">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-4=
66/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-155417v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-trans=
itions-varying-size.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-5/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/sha=
rd-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-1/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-1/i=
gt@kms_flip@2x-flip-vs-panning-interruptible.html">PASS</a> +3 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-9/igt@kms_fli=
p@basic-flip-vs-dpms@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-adlp=
-8/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">PASS</a> +8 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shar=
d-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-3/igt@kms_fli=
p@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1=
/shard-adlp-8/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">PASS</a> +2 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-3/ig=
t@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_configfs@ctx-restore-mid-bb-invalid}:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-433/igt@xe_con=
figfs@ctx-restore-mid-bb-invalid.html">ABORT</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2-434/igt@xe_config=
fs@ctx-restore-mid-bb-invalid.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg=
2-434/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">PASS</a> +5 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-4/igt@xe_exec_=
fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6050">Intel =
XE#6050</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-155417v1/shard-bmg-8/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-=
invalidate-race-imm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-4/igt@xe_exec_=
system_allocator@twice-malloc-nomemset.html">DMESG-FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/sh=
ard-bmg-8/igt@xe_exec_system_allocator@twice-malloc-nomemset.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-9/igt@xe_pm@s=
2idle-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE#4504</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/s=
hard-adlp-8/igt@xe_pm@s2idle-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-dg2=
-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_cont=
ent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-bmg-1/igt@kms_conte=
nt_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1554=
17v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"=
>Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-adlp-3/igt@kms_fli=
p@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v1/shard-adl=
p-8/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155417v=
1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1554=
17v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5390">Intel XE#5390</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#=
5390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
155417v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-155417v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-155417v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
55417v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47 -&gt; xe-pw-155=
417v1</li>
</ul>
<p>IGT_8574: 44a15713124663a622c6eddf7c6ee5ba732e0d41 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3867-0ce21448d1c984adf76d9dbfb3ad626ef8f33e47: 0ce21448d1c984adf76d9db=
fb3ad626ef8f33e47<br />
  xe-pw-155417v1: 155417v1</p>

</body>
</html>

--===============0382295572214275149==--
