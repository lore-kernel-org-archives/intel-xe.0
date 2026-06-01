Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4E9CD5BD1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 09:25:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C4B11306F;
	Mon,  1 Jun 2026 09:25:10 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8E211306D;
 Mon,  1 Jun 2026 09:25:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0033342044566638683=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/display=3A_harden_?=
 =?utf-8?q?some_bit-shifting_operations_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Jun 2026 09:25:08 -0000
Message-ID: <178030590883.29600.11238048718831309105@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260601081730.3146922-1-luciano.coelho@intel.com>
In-Reply-To: <20260601081730.3146922-1-luciano.coelho@intel.com>
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

--===============0033342044566638683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: harden some bit-shifting operations (rev4)
URL   : https://patchwork.freedesktop.org/series/166864/
State : failure

== Summary ==

CI Bug Log - changes from xe-5169-a73d1b6d969e07cf602558fe5b13cca7f9238f32_BAT -> xe-pw-166864v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-166864v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-166864v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (10 -> 13)
------------------------------

  Additional (3): bat-lnl-1 bat-ptl-1 bat-adlp-7 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-166864v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-wcl-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5169-a73d1b6d969e07cf602558fe5b13cca7f9238f32/bat-wcl-2/igt@kms_force_connector_basic@force-connector-state.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-wcl-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-wcl-1:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5169-a73d1b6d969e07cf602558fe5b13cca7f9238f32/bat-wcl-1/igt@kms_hdmi_inject@inject-audio.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-wcl-1/igt@kms_hdmi_inject@inject-audio.html

  
Known issues
------------

  Here are the changes found in xe-pw-166864v4_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - bat-ptl-1:          NOTRUN -> [SKIP][5] ([Intel XE#5773]) +4 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@fbdev@eof.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-ptl-1:          NOTRUN -> [SKIP][6] ([Intel XE#5765])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-lnl-1:          NOTRUN -> [SKIP][7] ([Intel XE#1466])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-ptl-1:          NOTRUN -> [SKIP][8] ([Intel XE#5766]) +13 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - bat-lnl-1:          NOTRUN -> [SKIP][9] ([Intel XE#2244])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-plain-flip:
    - bat-ptl-1:          NOTRUN -> [SKIP][10] ([Intel XE#5769]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@kms_flip@basic-plain-flip.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-lnl-1:          NOTRUN -> [SKIP][11] ([Intel XE#352]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-ptl-1:          NOTRUN -> [SKIP][12] ([Intel XE#5781])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-lnl-1:          NOTRUN -> [SKIP][13] ([Intel XE#1470] / [Intel XE#2853])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-ptl-1:          NOTRUN -> [SKIP][14] ([Intel XE#1406] / [Intel XE#5778]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-lnl-1:          NOTRUN -> [SKIP][15] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-ptl-1:          NOTRUN -> [SKIP][16] ([Intel XE#5764]) +11 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html
    - bat-lnl-1:          NOTRUN -> [SKIP][17] ([Intel XE#6540] / [Intel XE#688]) +11 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_exec_balancer@no-exec-parallel-basic:
    - bat-lnl-1:          NOTRUN -> [SKIP][18] ([Intel XE#7482]) +17 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@xe_exec_balancer@no-exec-parallel-basic.html

  * igt@xe_exec_balancer@twice-cm-virtual-rebind:
    - bat-ptl-1:          NOTRUN -> [SKIP][19] ([Intel XE#7482]) +17 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@xe_exec_balancer@twice-cm-virtual-rebind.html

  * igt@xe_live_ktest@xe_bo:
    - bat-ptl-1:          NOTRUN -> [SKIP][20] ([Intel XE#5775]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@xe_live_ktest@xe_bo.html
    - bat-lnl-1:          NOTRUN -> [SKIP][21] ([Intel XE#2229]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_mmap@vram:
    - bat-ptl-1:          NOTRUN -> [SKIP][22] ([Intel XE#5776])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@xe_mmap@vram.html
    - bat-lnl-1:          NOTRUN -> [SKIP][23] ([Intel XE#1416])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@xe_mmap@vram.html

  * igt@xe_module_load@load:
    - bat-adlp-7:         NOTRUN -> [ABORT][24] ([Intel XE#1727])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-adlp-7/igt@xe_module_load@load.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-lnl-1:          NOTRUN -> [SKIP][25] ([Intel XE#1420] / [Intel XE#2838] / [Intel XE#7590])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
    - bat-ptl-1:          NOTRUN -> [SKIP][26] ([Intel XE#5777] / [Intel XE#7590])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-lnl-1:          NOTRUN -> [SKIP][27] ([Intel XE#7590] / [Intel XE#977])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-1:          NOTRUN -> [SKIP][28] ([Intel XE#5771] / [Intel XE#7590])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-ptl-1:          NOTRUN -> [SKIP][29] ([Intel XE#5780] / [Intel XE#7590])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-lnl-1:          NOTRUN -> [SKIP][30] ([Intel XE#7590] / [Intel XE#979])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-lnl-1:          NOTRUN -> [SKIP][31] ([Intel XE#3342])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5765]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765
  [Intel XE#5766]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5766
  [Intel XE#5769]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5769
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5773]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5773
  [Intel XE#5775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775
  [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5778]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5778
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#5781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5781
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-5169-a73d1b6d969e07cf602558fe5b13cca7f9238f32 -> xe-pw-166864v4

  IGT_8943: 8943
  xe-5169-a73d1b6d969e07cf602558fe5b13cca7f9238f32: a73d1b6d969e07cf602558fe5b13cca7f9238f32
  xe-pw-166864v4: 166864v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/index.html

--===============0033342044566638683==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: harden some bit-shifting operations (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166864/">https://patchwork.freedesktop.org/series/166864/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5169-a73d1b6d969e07cf602558fe5b13cca7f9238f32_BAT -&gt; xe-pw-166864v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-166864v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-166864v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (10 -&gt; 13)</h2>
<p>Additional (3): bat-lnl-1 bat-ptl-1 bat-adlp-7 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-166864v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5169-a73d1b6d969e07cf602558fe5b13cca7f9238f32/bat-wcl-2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-wcl-2/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5169-a73d1b6d969e07cf602558fe5b13cca7f9238f32/bat-wcl-1/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-wcl-1/igt@kms_hdmi_inject@inject-audio.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166864v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5773">Intel XE#5773</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765">Intel XE#5765</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5766">Intel XE#5766</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5769">Intel XE#5769</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5781">Intel XE#5781</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5778">Intel XE#5778</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +11 other tests skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-basic:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@xe_exec_balancer@no-exec-parallel-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-rebind:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@xe_exec_balancer@twice-cm-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>) +2 other tests skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-adlp-7/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v4/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5169-a73d1b6d969e07cf602558fe5b13cca7f9238f32 -&gt; xe-pw-166864v4</li>
</ul>
<p>IGT_8943: 8943<br />
  xe-5169-a73d1b6d969e07cf602558fe5b13cca7f9238f32: a73d1b6d969e07cf602558fe5b13cca7f9238f32<br />
  xe-pw-166864v4: 166864v4</p>

</body>
</html>

--===============0033342044566638683==--
