Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F01D2B925
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 13:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626DE10E2D8;
	Tue,  5 Nov 2024 13:32:32 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83AAD10E2D8;
 Tue,  5 Nov 2024 13:32:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8663013971526561472=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Expose_modifiers/formats_support?=
 =?utf-8?q?ed_by_async_flips?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Nov 2024 13:32:30 -0000
Message-ID: <173081355053.1412239.1437691794514649833@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241105102608.3912133-1-arun.r.murthy@intel.com>
In-Reply-To: <20241105102608.3912133-1-arun.r.murthy@intel.com>
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

--===============8663013971526561472==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Expose modifiers/formats supported by async flips
URL   : https://patchwork.freedesktop.org/series/140934/
State : failure

== Summary ==

CI Bug Log - changes from xe-2166-913062707a924df0837c0d9eb9745ba52fd92958_BAT -> xe-pw-140934v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140934v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140934v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140934v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-bmg-1:          [PASS][3] -> [FAIL][4] +92 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-bmg-1/igt@kms_addfb_basic@bad-pitch-0.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-bmg-1/igt@kms_addfb_basic@bad-pitch-0.html
    - bat-lnl-2:          [PASS][5] -> [FAIL][6] +29 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - bat-dg2-oem2:       [PASS][7] -> [FAIL][8] +92 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_addfb_basic@bad-pitch-63:
    - bat-lnl-1:          [PASS][9] -> [FAIL][10] +86 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-lnl-1/igt@kms_addfb_basic@bad-pitch-63.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-lnl-1/igt@kms_addfb_basic@bad-pitch-63.html

  * igt@kms_addfb_basic@bo-too-small:
    - bat-bmg-2:          [PASS][11] -> [FAIL][12] +29 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-bmg-2/igt@kms_addfb_basic@bo-too-small.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-bmg-2/igt@kms_addfb_basic@bo-too-small.html

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - bat-adlp-7:         [PASS][13] -> [FAIL][14] +60 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-bmg-2:          [PASS][15] -> [DMESG-WARN][16] +2 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-bmg-2:          [PASS][17] -> [DMESG-FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-bmg-2/igt@kms_hdmi_inject@inject-audio.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-bmg-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][19] -> [DMESG-WARN][20] +1 other test dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-dg2-oem2/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-dg2-oem2/igt@xe_module_load@load.html
    - bat-lnl-1:          [PASS][21] -> [DMESG-WARN][22] +1 other test dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-lnl-1/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-lnl-1/igt@xe_module_load@load.html
    - bat-adlp-7:         [PASS][23] -> [DMESG-WARN][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-adlp-7/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-adlp-7/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [DMESG-WARN][25] ([Intel XE#2871]) -> [DMESG-WARN][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-lnl-1:          [SKIP][27] ([Intel XE#1466]) -> [FAIL][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-bmg-2:          [SKIP][29] ([Intel XE#2233]) -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-bmg-1:          [SKIP][31] ([Intel XE#2233]) -> [FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-lnl-2:          [SKIP][33] ([Intel XE#1466] / [Intel XE#2235]) -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-oem2:       [SKIP][35] ([Intel XE#623]) -> [FAIL][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-adlp-7:         [DMESG-WARN][37] ([Intel XE#2496]) -> [FAIL][38] +31 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][39] ([Intel XE#1861]) -> [FAIL][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [SKIP][41] ([Intel XE#455]) -> [FAIL][42] +3 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - bat-adlp-7:         [DMESG-WARN][43] ([Intel XE#2871]) -> [FAIL][44] +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html

  
Known issues
------------

  Here are the changes found in xe-pw-140934v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - bat-lnl-1:          [PASS][45] -> [SKIP][46] ([Intel XE#2134]) +4 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-lnl-1/igt@fbdev@eof.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-lnl-1/igt@fbdev@eof.html

  * igt@fbdev@nullptr:
    - bat-dg2-oem2:       [PASS][47] -> [SKIP][48] ([Intel XE#2134]) +4 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-dg2-oem2/igt@fbdev@nullptr.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-dg2-oem2/igt@fbdev@nullptr.html

  * igt@fbdev@write:
    - bat-bmg-1:          [PASS][49] -> [SKIP][50] ([Intel XE#2134]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-bmg-1/igt@fbdev@write.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-bmg-1/igt@fbdev@write.html
    - bat-adlp-7:         [PASS][51] -> [SKIP][52] ([Intel XE#2134]) +4 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-adlp-7/igt@fbdev@write.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-adlp-7/igt@fbdev@write.html

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-1:          [PASS][53] -> [SKIP][54] ([Intel XE#1192]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [PASS][55] -> [SKIP][56] ([Intel XE#1192]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-1:          [PASS][57] -> [SKIP][58] ([Intel XE#1192]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
    - bat-adlp-7:         [PASS][59] -> [SKIP][60] ([Intel XE#1192]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
    - bat-dg2-oem2:       [PASS][61] -> [SKIP][62] ([Intel XE#1192]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235
  [Intel XE#2496]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2496
  [Intel XE#2871]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623


Build changes
-------------

  * Linux: xe-2166-913062707a924df0837c0d9eb9745ba52fd92958 -> xe-pw-140934v1

  IGT_8097: 2e7c8e4b88a50e33e10d6c13286818aa833bef9b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2166-913062707a924df0837c0d9eb9745ba52fd92958: 913062707a924df0837c0d9eb9745ba52fd92958
  xe-pw-140934v1: 140934v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/index.html

--===============8663013971526561472==
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
<tr><td><b>Series:</b></td><td>Expose modifiers/formats supported by async flips</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140934/">https://patchwork.freedesktop.org/series/140934/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2166-913062707a924df0837c0d9eb9745ba52fd92958_BAT -&gt; xe-pw-140934v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140934v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140934v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140934v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-bmg-1/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-bmg-1/igt@kms_addfb_basic@bad-pitch-0.html">FAIL</a> +92 other tests fail</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html">FAIL</a> +29 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">FAIL</a> +92 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-63:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-lnl-1/igt@kms_addfb_basic@bad-pitch-63.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-lnl-1/igt@kms_addfb_basic@bad-pitch-63.html">FAIL</a> +86 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-bmg-2/igt@kms_addfb_basic@bo-too-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-bmg-2/igt@kms_addfb_basic@bo-too-small.html">FAIL</a> +29 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">FAIL</a> +60 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-bmg-2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-bmg-2/igt@kms_hdmi_inject@inject-audio.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-dg2-oem2/igt@xe_module_load@load.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-lnl-1/igt@xe_module_load@load.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-adlp-7/igt@xe_module_load@load.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871">Intel XE#2871</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2496">Intel XE#2496</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">FAIL</a> +31 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip@edp-1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871">Intel XE#2871</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140934v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-lnl-1/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-lnl-1/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-dg2-oem2/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-dg2-oem2/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-bmg-1/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-bmg-1/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-adlp-7/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-adlp-7/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2166-913062707a924df0837c0d9eb9745ba52fd92958/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140934v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2166-913062707a924df0837c0d9eb9745ba52fd92958 -&gt; xe-pw-140934v1</li>
</ul>
<p>IGT_8097: 2e7c8e4b88a50e33e10d6c13286818aa833bef9b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2166-913062707a924df0837c0d9eb9745ba52fd92958: 913062707a924df0837c0d9eb9745ba52fd92958<br />
  xe-pw-140934v1: 140934v1</p>

</body>
</html>

--===============8663013971526561472==--
