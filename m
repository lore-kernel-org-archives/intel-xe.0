Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A16BE7716E
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 21:57:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8AF910EFA9;
	Thu,  5 Dec 2024 21:57:05 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26D110EFA9;
 Thu,  5 Dec 2024 21:57:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8668112130639830427=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_VF=3A_Avoid_reading_inacce?=
 =?utf-8?q?ssible_registers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jakub Kolakowski" <jakub1.kolakowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Dec 2024 21:57:04 -0000
Message-ID: <173343582464.3072218.1125040295973164814@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241205181814.1484975-1-jakub1.kolakowski@intel.com>
In-Reply-To: <20241205181814.1484975-1-jakub1.kolakowski@intel.com>
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

--===============8668112130639830427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: VF: Avoid reading inaccessible registers
URL   : https://patchwork.freedesktop.org/series/142196/
State : failure

== Summary ==

CI Bug Log - changes from xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce_full -> xe-pw-142196v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142196v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142196v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142196v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@many-virtual-rebind:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +9 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_exec_balancer@many-virtual-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-4/igt@xe_exec_balancer@many-virtual-rebind.html

  
#### Warnings ####

  * igt@xe_ccs@block-copy-uncompressed@tile64-uncompressed-compfmt0-vram01-vram01:
    - shard-bmg:          [DMESG-WARN][3] ([Intel XE#3468]) -> [DMESG-WARN][4] +3 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_ccs@block-copy-uncompressed@tile64-uncompressed-compfmt0-vram01-vram01.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-4/igt@xe_ccs@block-copy-uncompressed@tile64-uncompressed-compfmt0-vram01-vram01.html

  
Known issues
------------

  Here are the changes found in xe-pw-142196v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][5] ([Intel XE#1727] / [Intel XE#3468])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-hdmi-a-3.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][6] -> [FAIL][7] ([Intel XE#1426]) +1 other test fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          [PASS][8] -> [DMESG-FAIL][9] ([Intel XE#3468])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][10] ([Intel XE#2715] / [Intel XE#3468])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][11] ([Intel XE#3468])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-dp-2.html

  * igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][12] ([Intel XE#3468]) +1 other test dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-dp-2.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#2291]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-blt@xrgb2101010-4tiled:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][15] ([Intel XE#1727] / [Intel XE#3468])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@xrgb2101010-4tiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][16] -> [FAIL][17] ([Intel XE#3321])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][18] -> [FAIL][19] ([Intel XE#2882]) +4 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][20] -> [SKIP][21] ([Intel XE#2316]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-adlp:         [PASS][22] -> [FAIL][23] ([Intel XE#301]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:
    - shard-bmg:          [PASS][24] -> [FAIL][25] ([Intel XE#3674])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [PASS][26] -> [FAIL][27] ([Intel XE#886]) +3 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-5/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [PASS][28] -> [INCOMPLETE][29] ([Intel XE#2635]) +1 other test incomplete
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#1503])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-3/igt@kms_hdr@static-toggle.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@kms_hdr@static-toggle.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - shard-bmg:          [PASS][32] -> [DMESG-WARN][33] ([Intel XE#2705] / [Intel XE#3468])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - shard-bmg:          [PASS][34] -> [DMESG-WARN][35] ([Intel XE#3468]) +10 other tests dmesg-warn
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][36] -> [FAIL][37] ([Intel XE#1430]) +1 other test fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-adlp:         [PASS][38] -> [DMESG-WARN][39] ([Intel XE#3086] / [Intel XE#3343])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_oa@mi-rpc:
    - shard-bmg:          [PASS][40] -> [DMESG-WARN][41] ([Intel XE#1727])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@xe_oa@mi-rpc.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@xe_oa@mi-rpc.html

  * igt@xe_oa@mi-rpc@rcs-0:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][42] ([Intel XE#1727])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@xe_oa@mi-rpc@rcs-0.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][43] -> [ABORT][44] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-4/igt@xe_pm@s4-basic-exec.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@legacy-format:
    - shard-bmg:          [DMESG-WARN][45] ([Intel XE#2705]) -> [PASS][46] +1 other test pass
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_addfb_basic@legacy-format.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-4/igt@kms_addfb_basic@legacy-format.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-adlp:         [DMESG-FAIL][47] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][48] +1 other test pass
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][49] ([Intel XE#324]) -> [PASS][50] +1 other test pass
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][51] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1:
    - shard-lnl:          [FAIL][53] ([Intel XE#2577]) -> [PASS][54] +1 other test pass
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-5/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-lnl-8/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][55] ([Intel XE#3009]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_dp_aux_dev.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_dp_aux_dev.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][57] ([Intel XE#2373]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_feature_discovery@display-2x.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][59] ([Intel XE#3321]) -> [PASS][60] +1 other test pass
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [SKIP][61] ([Intel XE#2316]) -> [PASS][62] +5 other tests pass
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-lnl:          [FAIL][63] ([Intel XE#3036]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-8/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-lnl-8/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - shard-lnl:          [FAIL][65] -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-8/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-lnl-8/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-bmg:          [FAIL][67] ([Intel XE#2882]) -> [PASS][68] +1 other test pass
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-3/igt@kms_flip@plain-flip-ts-check.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-1/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [SKIP][69] ([Intel XE#1503]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_hdr@static-toggle-dpms.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-dp-2:
    - shard-bmg:          [DMESG-WARN][71] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-dp-2.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-4/igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-dp-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-bmg:          [DMESG-WARN][73] ([Intel XE#2566]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_pm_rpm@legacy-planes@plane-41:
    - shard-adlp:         [DMESG-WARN][75] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][76] +1 other test pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-2/igt@kms_pm_rpm@legacy-planes@plane-41.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-1/igt@kms_pm_rpm@legacy-planes@plane-41.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][77] ([Intel XE#2883]) -> [PASS][78] +2 other tests pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][79] ([Intel XE#899]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          [DMESG-WARN][81] -> [PASS][82] +11 other tests pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-4/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_basic@many-rebind:
    - shard-bmg:          [DMESG-WARN][83] ([Intel XE#3468]) -> [PASS][84] +6 other tests pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@xe_exec_basic@many-rebind.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@xe_exec_basic@many-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-adlp:         [DMESG-WARN][85] ([Intel XE#3086]) -> [PASS][86] +2 other tests pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [FAIL][87] ([Intel XE#958]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [DMESG-WARN][89] ([Intel XE#3468]) -> [DMESG-FAIL][90] ([Intel XE#3468]) +5 other tests dmesg-fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [DMESG-FAIL][91] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-WARN][92] ([Intel XE#1727] / [Intel XE#3468])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][93] -> [FAIL][94] ([Intel XE#1231])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][95] ([Intel XE#324]) -> [FAIL][96] ([Intel XE#1231] / [Intel XE#3052])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][97] ([Intel XE#324]) -> [FAIL][98] ([Intel XE#1231])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_color@deep-color:
    - shard-bmg:          [DMESG-FAIL][99] ([Intel XE#3468] / [Intel XE#877]) -> [DMESG-FAIL][100] ([Intel XE#3468]) +1 other test dmesg-fail
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_color@deep-color.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-4/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][101] ([Intel XE#2341]) -> [INCOMPLETE][102] ([Intel XE#2715] / [Intel XE#3468])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_content_protection@atomic.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][103] ([Intel XE#2291]) -> [DMESG-WARN][104] ([Intel XE#3468])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@torture-move@pipe-c:
    - shard-bmg:          [DMESG-WARN][105] -> [DMESG-WARN][106] ([Intel XE#3468])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_cursor_legacy@torture-move@pipe-c.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-4/igt@kms_cursor_legacy@torture-move@pipe-c.html

  * igt@kms_draw_crc@draw-method-blt:
    - shard-bmg:          [INCOMPLETE][107] ([Intel XE#3468]) -> [INCOMPLETE][108] ([Intel XE#1727] / [Intel XE#3468])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_draw_crc@draw-method-blt.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@kms_draw_crc@draw-method-blt.html

  * igt@kms_draw_crc@draw-method-blt@rgb565-4tiled:
    - shard-bmg:          [INCOMPLETE][109] ([Intel XE#3468]) -> [DMESG-FAIL][110] ([Intel XE#1727] / [Intel XE#3468])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html

  * igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:
    - shard-bmg:          [DMESG-FAIL][111] ([Intel XE#2705]) -> [DMESG-FAIL][112] ([Intel XE#2705] / [Intel XE#3468])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html

  * igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-FAIL][113] ([Intel XE#1727] / [Intel XE#3468]) -> [ABORT][114] ([Intel XE#3468])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-bmg:          [DMESG-WARN][115] ([Intel XE#3468]) -> [SKIP][116] ([Intel XE#2316])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [DMESG-FAIL][117] ([Intel XE#3468]) -> [INCOMPLETE][118] ([Intel XE#1727])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][119] ([Intel XE#2312]) -> [FAIL][120] ([Intel XE#2333]) +5 other tests fail
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][121] ([Intel XE#2312]) -> [DMESG-FAIL][122] ([Intel XE#3468]) +1 other test dmesg-fail
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [FAIL][123] ([Intel XE#2333]) -> [SKIP][124] ([Intel XE#2312]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][125] ([Intel XE#2311]) -> [SKIP][126] ([Intel XE#2312]) +4 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][127] ([Intel XE#2312]) -> [SKIP][128] ([Intel XE#2311]) +10 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][129] ([Intel XE#2313]) -> [SKIP][130] ([Intel XE#2312]) +4 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][131] ([Intel XE#2312]) -> [SKIP][132] ([Intel XE#2313]) +9 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-bmg:          [DMESG-WARN][133] ([Intel XE#3468]) -> [DMESG-WARN][134] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_pm_rpm@dpms-non-lpsp.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-bmg:          [DMESG-FAIL][135] ([Intel XE#3468]) -> [INCOMPLETE][136] ([Intel XE#1727] / [Intel XE#2870])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][137] ([Intel XE#2509]) -> [SKIP][138] ([Intel XE#2426])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          [DMESG-FAIL][139] -> [FAIL][140] ([Intel XE#1000])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind:
    - shard-bmg:          [DMESG-WARN][141] ([Intel XE#3468]) -> [DMESG-WARN][142] ([Intel XE#1727])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-bmg:          [DMESG-WARN][143] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][144] ([Intel XE#3467])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-bmg:          [DMESG-WARN][145] ([Intel XE#3343] / [Intel XE#3468]) -> [DMESG-WARN][146] ([Intel XE#3343])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [DMESG-WARN][147] ([Intel XE#3467]) -> [DMESG-WARN][148] ([Intel XE#3467] / [Intel XE#3468]) +1 other test dmesg-warn
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [DMESG-WARN][149] ([Intel XE#2919] / [Intel XE#3468]) -> [DMESG-WARN][150] ([Intel XE#2919])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@xe_wedged@basic-wedged.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2870
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3036]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3036
  [Intel XE#3052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3674]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3674
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce -> xe-pw-142196v1

  IGT_8138: 8138
  xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce: ab26b8eb1a5191f86d7b778e71a15d34fb4737ce
  xe-pw-142196v1: 142196v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/index.html

--===============8668112130639830427==
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
<tr><td><b>Series:</b></td><td>VF: Avoid reading inaccessible registers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142196/">https://patchwork.freedesktop.org/series/142196/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce_full -&gt; xe-pw-142196v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142196v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-142196v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-142196v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_balancer@many-virtual-rebind:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_exec_balancer@many-virtual-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-4/igt@xe_exec_balancer@many-virtual-rebind.html">DMESG-WARN</a> +9 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_ccs@block-copy-uncompressed@tile64-uncompressed-compfmt0-vram01-vram01:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_ccs@block-copy-uncompressed@tile64-uncompressed-compfmt0-vram01-vram01.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-4/igt@xe_ccs@block-copy-uncompressed@tile64-uncompressed-compfmt0-vram01-vram01.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142196v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_content_protection@atomic@pipe-a-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xrgb2101010-4tiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@xrgb2101010-4tiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3674">Intel XE#3674</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-5/igt@kms_flip@plain-flip-ts-check@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-3/igt@kms_hdr@static-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +10 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@xe_oa@mi-rpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@xe_oa@mi-rpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc@rcs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@xe_oa@mi-rpc@rcs-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-4/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@legacy-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_addfb_basic@legacy-format.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-4/igt@kms_addfb_basic@legacy-format.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-5/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-lnl-8/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_feature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-wf_vblank.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-8/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3036">Intel XE#3036</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-lnl-8/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-8/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-lnl-8/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-3/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-1/igt@kms_flip@plain-flip-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_hdr@static-toggle-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-4/igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-41:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-2/igt@kms_pm_rpm@legacy-planes@plane-41.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-1/igt@kms_pm_rpm@legacy-planes@plane-41.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-4/igt@xe_exec_basic@many-execqueues-many-vm-userptr-rebind.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@xe_exec_basic@many-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@xe_exec_basic@many-rebind.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052">Intel XE#3052</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_color@deep-color.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-4/igt@kms_color@deep-color.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_content_protection@atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-4/igt@kms_cursor_legacy@torture-move@pipe-c.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-4/igt@kms_cursor_legacy@torture-move@pipe-c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_draw_crc@draw-method-blt.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@kms_draw_crc@draw-method-blt.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@rgb565-4tiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@kms_pm_rpm@dpms-non-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@kms_pm_rpm@dpms-non-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2870">Intel XE#2870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce/shard-bmg-5/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v1/shard-bmg-7/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce -&gt; xe-pw-142196v1</li>
</ul>
<p>IGT_8138: 8138<br />
  xe-2327-ab26b8eb1a5191f86d7b778e71a15d34fb4737ce: ab26b8eb1a5191f86d7b778e71a15d34fb4737ce<br />
  xe-pw-142196v1: 142196v1</p>

</body>
</html>

--===============8668112130639830427==--
