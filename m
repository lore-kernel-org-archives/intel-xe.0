Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0200ACD6E5D
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 19:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FAC10F50E;
	Tue,  2 Jun 2026 19:22:17 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA32410F44D;
 Tue,  2 Jun 2026 19:22:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2268241094761422147=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Allow_pushing_mor?=
 =?utf-8?q?e_jobs_into_LRC=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 02 Jun 2026 19:22:16 -0000
Message-ID: <178042813669.36705.13894084200133730643@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260602181447.131216-1-dev@lankhorst.se>
In-Reply-To: <20260602181447.131216-1-dev@lankhorst.se>
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

--===============2268241094761422147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Allow pushing more jobs into LRC.
URL   : https://patchwork.freedesktop.org/series/167764/
State : failure

== Summary ==

CI Bug Log - changes from xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19_BAT -> xe-pw-167764v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-167764v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-167764v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-167764v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - bat-ptl-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-ptl-2/igt@kms_addfb_basic@addfb25-4-tiled.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-ptl-2/igt@kms_addfb_basic@addfb25-4-tiled.html
    - bat-ptl-1:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-ptl-1/igt@kms_addfb_basic@addfb25-4-tiled.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-ptl-1/igt@kms_addfb_basic@addfb25-4-tiled.html
    - bat-wcl-2:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-wcl-2/igt@kms_addfb_basic@addfb25-4-tiled.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-wcl-2/igt@kms_addfb_basic@addfb25-4-tiled.html
    - bat-lnl-2:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - bat-lnl-1:          [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-lnl-1/igt@kms_addfb_basic@addfb25-bad-modifier.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-lnl-1/igt@kms_addfb_basic@addfb25-bad-modifier.html

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - bat-wcl-1:          [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-wcl-1/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-wcl-1/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [PASS][13] -> [ABORT][14] +1 other test abort
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-dpms@d-edp1:
    - bat-adlp-7:         [PASS][15] -> [DMESG-WARN][16] +2 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html

  * igt@kms_force_connector_basic@force-edid:
    - bat-bmg-2:          [PASS][17] -> [DMESG-WARN][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-bmg-2/igt@kms_force_connector_basic@force-edid.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-bmg-2/igt@kms_force_connector_basic@force-edid.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:
    - bat-atsm-2:         [PASS][19] -> [ABORT][20] +1 other test abort
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html

  * igt@xe_compute@compute-square:
    - bat-ptl-vm:         [PASS][21] -> [TIMEOUT][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-ptl-vm/igt@xe_compute@compute-square.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-ptl-vm/igt@xe_compute@compute-square.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - bat-bmg-3:          [PASS][23] -> [ABORT][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-bmg-3/igt@xe_exec_basic@multigpu-once-basic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-bmg-3/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_basic@twice-basic:
    - bat-ptl-vm:         [PASS][25] -> [ABORT][26] +1 other test abort
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-ptl-vm/igt@xe_exec_basic@twice-basic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-ptl-vm/igt@xe_exec_basic@twice-basic.html

  * igt@xe_exec_basic@twice-basic@vecs0:
    - bat-ptl-vm:         [PASS][27] -> [DMESG-WARN][28] +3 other tests dmesg-warn
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-ptl-vm/igt@xe_exec_basic@twice-basic@vecs0.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-ptl-vm/igt@xe_exec_basic@twice-basic@vecs0.html

  * igt@xe_module_load@load:
    - bat-ptl-2:          [PASS][29] -> [DMESG-WARN][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-ptl-2/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-ptl-2/igt@xe_module_load@load.html
    - bat-wcl-1:          [PASS][31] -> [DMESG-WARN][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-wcl-1/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-wcl-1/igt@xe_module_load@load.html
    - bat-wcl-2:          [PASS][33] -> [DMESG-WARN][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-wcl-2/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-wcl-2/igt@xe_module_load@load.html
    - bat-lnl-1:          [PASS][35] -> [DMESG-WARN][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-lnl-1/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-lnl-1/igt@xe_module_load@load.html
    - bat-bmg-vm:         [PASS][37] -> [ABORT][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-bmg-vm/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-bmg-vm/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-167764v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-bmg-1:          [PASS][39] -> [ABORT][40] ([Intel XE#7814])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-bmg-2:          [PASS][41] -> [ABORT][42] ([Intel XE#7814])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-bmg-2/igt@kms_hdmi_inject@inject-audio.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-bmg-2/igt@kms_hdmi_inject@inject-audio.html

  
  [Intel XE#7814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814


Build changes
-------------

  * Linux: xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19 -> xe-pw-167764v1

  IGT_8946: 8946
  xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19: 28a2d825f9082837f5be51953d96b12b39aaaf19
  xe-pw-167764v1: 167764v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/index.html

--===============2268241094761422147==
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
<tr><td><b>Series:</b></td><td>drm/xe: Allow pushing more jobs into LRC.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167764/">https://patchwork.freedesktop.org/series/167764/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19_BAT -&gt; xe-pw-167764v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-167764v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-167764v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-167764v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-ptl-2/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-ptl-2/igt@kms_addfb_basic@addfb25-4-tiled.html">ABORT</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-ptl-1/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-ptl-1/igt@kms_addfb_basic@addfb25-4-tiled.html">ABORT</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-wcl-2/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-wcl-2/igt@kms_addfb_basic@addfb25-4-tiled.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-lnl-2/igt@kms_addfb_basic@addfb25-4-tiled.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-bad-modifier:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-lnl-1/igt@kms_addfb_basic@addfb25-bad-modifier.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-lnl-1/igt@kms_addfb_basic@addfb25-bad-modifier.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-wcl-1/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-wcl-1/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-bmg-2/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-bmg-2/igt@kms_force_connector_basic@force-edid.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-ptl-vm/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-ptl-vm/igt@xe_compute@compute-square.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-bmg-3/igt@xe_exec_basic@multigpu-once-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-bmg-3/igt@xe_exec_basic@multigpu-once-basic.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-ptl-vm/igt@xe_exec_basic@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-ptl-vm/igt@xe_exec_basic@twice-basic.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic@vecs0:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-ptl-vm/igt@xe_exec_basic@twice-basic@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-ptl-vm/igt@xe_exec_basic@twice-basic@vecs0.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-ptl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-ptl-2/igt@xe_module_load@load.html">DMESG-WARN</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-wcl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-wcl-1/igt@xe_module_load@load.html">DMESG-WARN</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-wcl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-wcl-2/igt@xe_module_load@load.html">DMESG-WARN</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-lnl-1/igt@xe_module_load@load.html">DMESG-WARN</a></li>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-bmg-vm/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-bmg-vm/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-167764v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814">Intel XE#7814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19/bat-bmg-2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167764v1/bat-bmg-2/igt@kms_hdmi_inject@inject-audio.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814">Intel XE#7814</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19 -&gt; xe-pw-167764v1</li>
</ul>
<p>IGT_8946: 8946<br />
  xe-5180-28a2d825f9082837f5be51953d96b12b39aaaf19: 28a2d825f9082837f5be51953d96b12b39aaaf19<br />
  xe-pw-167764v1: 167764v1</p>

</body>
</html>

--===============2268241094761422147==--
