Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B883CCA1012
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 09:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1948825B;
	Thu,  4 Sep 2025 09:44:24 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB2B10E9CF;
 Thu,  4 Sep 2025 09:44:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2709100946286611069=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/guc=3A_Add_SLPC_pow?=
 =?utf-8?q?er_profile_interface_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Sep 2025 09:44:22 -0000
Message-ID: <175697906250.302421.9442781977850856609@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250903232120.390190-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250903232120.390190-1-vinay.belgaumkar@intel.com>
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

--===============2709100946286611069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Add SLPC power profile interface (rev2)
URL   : https://patchwork.freedesktop.org/series/153723/
State : failure

== Summary ==

CI Bug Log - changes from xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7_FULL -> xe-pw-153723v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-153723v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-153723v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-153723v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_dc@dc9-dpms:
    - shard-lnl:          [PASS][1] -> [ABORT][2] +23 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-4/igt@kms_pm_dc@dc9-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-2/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-bmg:          [PASS][3] -> [ABORT][4] +15 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-5/igt@kms_pm_rpm@basic-rte.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-2/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-adlp:         [PASS][5] -> [ABORT][6] +16 other tests abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-dg2-set2:     [PASS][7] -> [ABORT][8] +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-464/igt@kms_pm_rpm@universal-planes.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-432/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [ABORT][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-1/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-2.html

  * igt@runner@aborted:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24], [FAIL][25], [FAIL][26], [FAIL][27], [FAIL][28], [FAIL][29], [FAIL][30])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-436/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-434/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-436/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-433/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-466/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-466/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-436/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-434/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-464/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-463/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-464/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-434/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-464/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-435/igt@runner@aborted.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-433/igt@runner@aborted.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-436/igt@runner@aborted.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-435/igt@runner@aborted.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-463/igt@runner@aborted.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-435/igt@runner@aborted.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-433/igt@runner@aborted.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-464/igt@runner@aborted.html

  
#### Warnings ####

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][31] ([Intel XE#1439] / [Intel XE#836]) -> [ABORT][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         [SKIP][33] ([Intel XE#836]) -> [ABORT][34] +1 other test abort
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-1/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][35] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [ABORT][36] +2 other tests abort
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          [SKIP][37] ([Intel XE#1439] / [Intel XE#3141]) -> [ABORT][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-lnl:          [SKIP][39] ([Intel XE#2284] / [Intel XE#366]) -> [ABORT][40] +1 other test abort
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-2/igt@xe_pm@d3cold-basic-exec.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-1/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mocs:
    - shard-adlp:         [SKIP][41] ([Intel XE#2284]) -> [ABORT][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-8/igt@xe_pm@d3cold-mocs.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-8/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         [SKIP][43] ([Intel XE#1948]) -> [ABORT][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-3/igt@xe_pm@d3hot-mmap-vram.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-9/igt@xe_pm@d3hot-mmap-vram.html
    - shard-lnl:          [SKIP][45] ([Intel XE#1948]) -> [ABORT][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-1/igt@xe_pm@d3hot-mmap-vram.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-2/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][47] ([Intel XE#2284]) -> [ABORT][48] +2 other tests abort
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-3/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html
    - shard-adlp:         [SKIP][49] ([Intel XE#2284] / [Intel XE#366]) -> [ABORT][50] +2 other tests abort
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-1/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-6/igt@xe_pm@s2idle-d3cold-basic-exec.html
    - shard-dg2-set2:     [SKIP][51] ([Intel XE#2284] / [Intel XE#366]) -> [ABORT][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-433/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-adlp:         [DMESG-WARN][53] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504]) -> [ABORT][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-3/igt@xe_pm@s2idle-d3hot-basic-exec.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_async_flips@async-flip-dpms@pipe-a-hdmi-a-1}:
    - shard-adlp:         [DMESG-WARN][55] ([Intel XE#2953] / [Intel XE#4173]) -> [ABORT][56] +1 other test abort
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-3/igt@kms_async_flips@async-flip-dpms@pipe-a-hdmi-a-1.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-3/igt@kms_async_flips@async-flip-dpms@pipe-a-hdmi-a-1.html

  * {igt@kms_async_flips@async-flip-dpms@pipe-a-hdmi-a-3}:
    - shard-bmg:          [PASS][57] -> [ABORT][58] +1 other test abort
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-4/igt@kms_async_flips@async-flip-dpms@pipe-a-hdmi-a-3.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@kms_async_flips@async-flip-dpms@pipe-a-hdmi-a-3.html

  
Known issues
------------

  Here are the changes found in xe-pw-153723v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][59] -> [SKIP][60] ([Intel XE#2314] / [Intel XE#2894])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#787]) +6 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#455] / [Intel XE#787])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][63] -> [INCOMPLETE][64] ([Intel XE#3862])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][65] ([Intel XE#3862])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [PASS][66] -> [SKIP][67] ([Intel XE#2291])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][68] -> [SKIP][69] ([Intel XE#1340])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-bmg:          [PASS][70] -> [SKIP][71] ([Intel XE#2316])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [PASS][72] -> [DMESG-WARN][73] ([Intel XE#4543] / [Intel XE#5208])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:
    - shard-adlp:         [PASS][74] -> [DMESG-WARN][75] ([Intel XE#4543]) +1 other test dmesg-warn
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [PASS][76] -> [SKIP][77] ([Intel XE#1503])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][78] -> [SKIP][79] ([Intel XE#2571])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-adlp:         [PASS][80] -> [ABORT][81] ([Intel XE#2953]) +1 other test abort
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-9/igt@kms_pm_rpm@legacy-planes-dpms.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-8/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-73:
    - shard-adlp:         [PASS][82] -> [DMESG-WARN][83] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-9/igt@kms_pm_rpm@legacy-planes-dpms@plane-73.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-8/igt@kms_pm_rpm@legacy-planes-dpms@plane-73.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-dg2-set2:     [PASS][84] -> [SKIP][85] ([Intel XE#1392]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-adlp:         [PASS][86] -> [DMESG-WARN][87] ([Intel XE#3868])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-2/igt@xe_exec_reset@cm-close-fd.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][88] ([Intel XE#2291]) -> [PASS][89] +2 other tests pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [SKIP][90] ([Intel XE#2316]) -> [PASS][91] +1 other test pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
    - shard-adlp:         [DMESG-WARN][92] ([Intel XE#4543]) -> [PASS][93] +2 other tests pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-2/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-3/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - shard-adlp:         [DMESG-WARN][94] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][95] +1 other test pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-9/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][96], [PASS][97], [SKIP][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121]) ([Intel XE#378]) -> ([PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-1/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-1/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-2/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-7/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-7/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-4/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-5/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-5/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-3/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-2/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-3/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-1/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-1/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-8/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-8/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-5/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-8/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-7/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-4/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-4/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-3/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-4/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-2/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-2/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-3/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-7/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-8/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-4/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-7/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-7/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-2/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-5/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-3/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-5/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-5/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-1/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-8/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-8/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-2/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-7/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-7/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-2/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-4/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-1/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-1/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-1/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-5/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-3/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-3/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-4/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-4/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [SKIP][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172]) ([Intel XE#2457]) -> ([PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-7/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-2/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-2/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-2/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-1/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-7/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-2/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-4/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-4/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-7/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-4/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-3/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-3/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-3/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-5/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-8/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-8/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-8/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-6/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-6/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-6/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-6/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-5/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-5/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-1/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-4/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-3/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-1/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-7/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-3/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-7/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-7/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-4/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-4/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-7/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-2/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-1/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-1/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-8/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-2/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-8/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-2/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-4/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-4/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-5/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-5/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-1/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@xe_module_load@load.html
    - shard-adlp:         ([PASS][198], [SKIP][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223]) ([Intel XE#378] / [Intel XE#5612]) -> ([PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-6/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-6/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-1/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-1/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-1/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-2/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-2/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-2/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-8/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-2/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-8/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-4/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-9/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-4/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-8/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-6/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-9/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-4/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-8/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-9/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-3/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-3/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-3/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-4/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-3/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-6/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-4/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-8/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-2/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-8/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-9/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-8/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-4/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-4/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-9/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-9/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-1/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-4/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-1/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-2/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-2/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-3/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-3/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-6/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-6/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-1/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-9/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-1/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-6/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-3/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-3/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [SKIP][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274]) ([Intel XE#378]) -> ([PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-432/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-434/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-434/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-432/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-432/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-433/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-432/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-436/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-464/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-466/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-466/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-433/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-435/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-436/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-435/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-464/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-464/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-466/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-463/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-463/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-466/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-463/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-463/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-436/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-434/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-434/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-464/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-466/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-432/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-432/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-464/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-464/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-435/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-435/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-433/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-433/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-464/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-434/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-434/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-434/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-436/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-466/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-463/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-463/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-436/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-435/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-436/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-436/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-433/igt@xe_module_load@load.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [DMESG-WARN][298] -> [PASS][299]
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-4/igt@xe_pm@s4-exec-after.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-4/igt@xe_pm@s4-exec-after.html

  
#### Warnings ####

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][300] ([Intel XE#1178]) -> [SKIP][301] ([Intel XE#2341])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-4/igt@kms_content_protection@srm.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@kms_content_protection@srm.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][302] ([Intel XE#2311]) -> [SKIP][303] ([Intel XE#2312]) +7 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][304] ([Intel XE#5390]) -> [SKIP][305] ([Intel XE#2312]) +2 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][306] ([Intel XE#2312]) -> [SKIP][307] ([Intel XE#5390]) +2 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][308] ([Intel XE#2312]) -> [SKIP][309] ([Intel XE#2311]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][310] ([Intel XE#2313]) -> [SKIP][311] ([Intel XE#2312]) +6 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][312] ([Intel XE#2312]) -> [SKIP][313] ([Intel XE#2313]) +3 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][314] ([Intel XE#1729]) -> [SKIP][315] ([Intel XE#2426])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          [DMESG-WARN][316] ([Intel XE#3876]) -> [ABORT][317] ([Intel XE#3970])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-4/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-4/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836


Build changes
-------------

  * Linux: xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7 -> xe-pw-153723v2

  IGT_8521: 8521
  xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7: 2b95afd5f659a01a6fc8195358e62077846b97e7
  xe-pw-153723v2: 153723v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/index.html

--===============2709100946286611069==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Add SLPC power profile interface=
 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/153723/">https://patchwork.freedesktop.org/series/153723/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-153723v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153723v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3673-2b95afd5f659a01a6fc8195358e620778=
46b97e7_FULL -&gt; xe-pw-153723v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-153723v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-153723v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1537=
23v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-4/igt@kms_pm_d=
c@dc9-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-153723v2/shard-lnl-2/igt@kms_pm_dc@dc9-dpms.html">ABORT</a>=
 +23 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-5/igt@kms_pm_r=
pm@basic-rte.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-153723v2/shard-bmg-2/igt@kms_pm_rpm@basic-rte.html">ABORT=
</a> +15 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-3/igt@kms_pm_=
rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-3/igt@kms_pm_rpm@dpms-mod=
e-unset-lpsp.html">ABORT</a> +16 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-464/igt@kms_pm=
_rpm@universal-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-432/igt@kms_pm_rpm@universal-=
planes.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153723v2/shard-bmg-1/igt@kms_vblank@ts-continuation-mo=
deset-rpm@pipe-a-dp-2.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-153723v2/shard-dg2-436/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/sh=
ard-dg2-434/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-436/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
3723v2/shard-dg2-433/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-466/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-153723v2/shard-dg2-466/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-436/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-153723v2/shard-dg2-434/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg=
2-464/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-463/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2=
/shard-dg2-464/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-434/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-153723v2/shard-dg2-464/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-435/igt@runne=
r@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-153723v2/shard-dg2-433/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-436/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-153723v2/shard-dg2-435/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard=
-dg2-463/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-435/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15372=
3v2/shard-dg2-433/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-464/igt@runner@abor=
ted.html">FAIL</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-3/igt@kms_pm_r=
pm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6=
/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-8/igt@kms_pm_=
rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-1/igt@kms_pm_rpm@dpm=
s-non-lpsp.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-6/igt@kms_pm_r=
pm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard=
-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-2/igt@kms_pm_r=
pm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v=
2/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">ABORT</a=
></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-2/igt@xe_pm@d3=
cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-1/igt@xe_=
pm@d3cold-basic-exec.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-8/igt@xe_pm@d=
3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-8/igt@xe_pm@d3cold-mocs.h=
tml">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-3/igt@xe_pm@d=
3hot-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1948">Intel XE#1948</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-9/igt@xe_pm@d3hot-mma=
p-vram.html">ABORT</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-1/igt@xe_pm@d3=
hot-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1948">Intel XE#1948</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-2/igt@xe_pm@d3hot-mmap-=
vram.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-3/igt@xe_pm@s2=
idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-1/igt@xe_pm@s2=
idle-d3cold-basic-exec.html">ABORT</a> +2 other tests abort</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-1/igt@xe_pm@s=
2idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-=
6/igt@xe_pm@s2idle-d3cold-basic-exec.html">ABORT</a> +2 other tests abort</=
li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-433/igt@xe_pm@=
s2idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-=
432/igt@xe_pm@s2idle-d3cold-basic-exec.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-2/igt@xe_pm@s=
2idle-d3hot-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE=
#4504</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-153723v2/shard-adlp-3/igt@xe_pm@s2idle-d3hot-basic-exec.html">ABORT</a></l=
i>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_async_flips@async-flip-dpms@pipe-a-hdmi-a-1}:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-3/igt@kms_asy=
nc_flips@async-flip-dpms@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Inte=
l XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-153723v2/shard-adlp-3/igt@kms_async_flips@async-flip-dpms@pipe-a-hdmi-=
a-1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-dpms@pipe-a-hdmi-a-3}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-4/igt@kms_asyn=
c_flips@async-flip-dpms@pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@kms_a=
sync_flips@async-flip-dpms@pipe-a-hdmi-a-3.html">ABORT</a> +1 other test ab=
ort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153723v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-2/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153723v2/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-=
tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153723v2/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-=
tiled-gen12-mc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-6/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-5/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153723v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4=
-tiled-bmg-ccs@pipe-d-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-2/igt@kms_curs=
or_legacy@cursora-vs-flipb-varying-size.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@kms_c=
ursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-4/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@kms_dither@fb-8bpc-v=
s-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-rmfb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-1/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-9/igt@kms_flip@flip-v=
s-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-1/igt@kms_fli=
p@flip-vs-rmfb-interruptible@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-9/igt@kms_f=
lip@flip-vs-rmfb-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)=
 +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-4/igt@kms_hdr@=
static-toggle-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@kms_hdr@static-toggle-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-8/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@kms_plane_scal=
ing@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-9/igt@kms_pm_=
rpm@legacy-planes-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-8/igt@kms_pm_rpm@legacy-pla=
nes-dpms.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2953">Intel XE#2953</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-73:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-9/igt@kms_pm_=
rpm@legacy-planes-dpms@plane-73.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-8/igt@kms_pm_rpm@l=
egacy-planes-dpms@plane-73.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)=
 +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-no-exec-null-rebind.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-rebind.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-2/igt@xe_exec=
_reset@cm-close-fd.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-153723v2/shard-adlp-3/igt@xe_exec_reset@cm-close-fd=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-153723v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-trans=
itions-varying-size.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-5/ig=
t@kms_flip@2x-flip-vs-blocking-wf-vblank.html">PASS</a> +1 other test pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-2/igt@kms_fli=
p@flip-vs-dpms-on-nop-interruptible.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard=
-adlp-3/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">PASS</a> +2 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-9/igt@kms_pla=
ne_scaling@plane-upscale-20x20-with-rotation.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173"=
>Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-153723v2/shard-adlp-2/igt@kms_plane_scaling@plane-upscale-20x20-w=
ith-rotation.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-2/igt=
@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-l=
nl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/sha=
rd-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7=
/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b=
97e7/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077=
846b97e7/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e6=
2077846b97e7/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc81953=
58e62077846b97e7/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8=
195358e62077846b97e7/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a=
6fc8195358e62077846b97e7/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659=
a01a6fc8195358e62077846b97e7/shard-lnl-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5=
f659a01a6fc8195358e62077846b97e7/shard-lnl-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95=
afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-=
2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-7/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-=
lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/sh=
ard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e=
7/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153=
723v2/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-153723v2/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153=
723v2/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-153723v2/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153=
723v2/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-153723v2/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl=
-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153=
723v2/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-153723v2/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153=
723v2/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-153723v2/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>)</l=
i>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7=
/shard-bmg-2/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b=
97e7/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077=
846b97e7/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e6=
2077846b97e7/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc81953=
58e62077846b97e7/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8=
195358e62077846b97e7/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a=
6fc8195358e62077846b97e7/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659=
a01a6fc8195358e62077846b97e7/shard-bmg-3/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5=
f659a01a6fc8195358e62077846b97e7/shard-bmg-5/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95=
afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-=
2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-6/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-6/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-=
bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/sh=
ard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e=
7/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53723v2/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153723v2/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-7/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53723v2/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153723v2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53723v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153723v2/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53723v2/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153723v2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53723v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153723v2/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>)<=
/li>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-6/igt@x=
e_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-1/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-ad=
lp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/sha=
rd-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e=
7/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e6207784=
6b97e7/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62=
077846b97e7/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc81953=
58e62077846b97e7/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc=
8195358e62077846b97e7/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a0=
1a6fc8195358e62077846b97e7/shard-adlp-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f=
659a01a6fc8195358e62077846b97e7/shard-adlp-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95=
afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-9/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673=
-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-8/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-9/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-adlp-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-ad=
lp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/sha=
rd-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e=
7/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e6207784=
6b97e7/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62=
077846b97e7/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc81953=
58e62077846b97e7/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc=
8195358e62077846b97e7/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a0=
1a6fc8195358e62077846b97e7/shard-adlp-6/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5612">Intel XE#5612</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-153723v2/shard-adlp-4/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v=
2/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-153723v2/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp=
-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
3723v2/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-4/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-153723v2/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard=
-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-1/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-153723v2/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-1/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-153723v2/shard-adlp-2/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/=
shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-3/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-153723v2/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-6/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1537=
23v2/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-9/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-153723v2/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-a=
dlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-adlp-3/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-153723v2/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-432/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-434/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-4=
34/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard=
-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7=
/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e6207784=
6b97e7/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e6=
2077846b97e7/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc81=
95358e62077846b97e7/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01=
a6fc8195358e62077846b97e7/shard-dg2-464/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f=
659a01a6fc8195358e62077846b97e7/shard-dg2-466/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b9=
5afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-466/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-36=
73-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-433/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-435/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-436/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-435=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-d=
g2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b=
97e7/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc8195358e620=
77846b97e7/shard-dg2-463/igt@xe_module_load@load.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6fc81953=
58e62077846b97e7/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659a01a6f=
c8195358e62077846b97e7/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95afd5f659=
a01a6fc8195358e62077846b97e7/shard-dg2-463/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-2b95af=
d5f659a01a6fc8195358e62077846b97e7/shard-dg2-463/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3673-=
2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-436/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-434/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-dg2-434/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-464/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-153723v2/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-43=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-432/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
3723v2/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-464/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-153723v2/shard-dg2-435/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/sh=
ard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-433/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-153723v2/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-4=
64/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-434/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53723v2/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-434/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-153723v2/shard-dg2-436/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/s=
hard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-463/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-153723v2/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-=
436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-435/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
153723v2/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-dg2-436/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-153723v2/shard-dg2-433/igt@xe_module_load@load.html">PAS=
S</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-lnl-4/igt@xe_pm@s4=
-exec-after.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-153723v2/shard-lnl-4/igt@xe_pm@s4-exec-after.html">P=
ASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-4/igt@kms_cont=
ent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-6/igt@kms_content_=
protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
153723v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1537=
23v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1537=
23v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5390">Intel XE#5390</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
3723v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
3723v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1537=
23v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-8/igt@km=
s_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7/shard-bmg-4/igt@xe_pmu@f=
n-engine-activity-sched-if-idle.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg=
-4/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>=
)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7 -&gt; xe-pw-153=
723v2</li>
</ul>
<p>IGT_8521: 8521<br />
  xe-3673-2b95afd5f659a01a6fc8195358e62077846b97e7: 2b95afd5f659a01a6fc8195=
358e62077846b97e7<br />
  xe-pw-153723v2: 153723v2</p>

</body>
</html>

--===============2709100946286611069==--
