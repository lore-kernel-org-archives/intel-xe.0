Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B22AD1D494
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 21:17:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8D110E7CD;
	Thu,  8 Jan 2026 21:17:14 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E39B10E7CB;
 Thu,  8 Jan 2026 21:17:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6438511829717409999=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Testing_entire_GGTT_privati?=
 =?utf-8?q?zation_preparation_series=2E_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Jan 2026 21:17:12 -0000
Message-ID: <176790703264.138403.9866354463236300397@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260108202531.671690-1-dev@lankhorst.se>
In-Reply-To: <20260108202531.671690-1-dev@lankhorst.se>
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

--===============6438511829717409999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Testing entire GGTT privatization preparation series. (rev3)
URL   : https://patchwork.freedesktop.org/series/159797/
State : failure

== Summary ==

CI Bug Log - changes from xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e_BAT -> xe-pw-159797v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159797v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159797v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159797v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-ptl-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html
    - bat-adlp-vm:        [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-adlp-vm/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-adlp-vm/igt@core_hotunplug@unbind-rebind.html
    - bat-ptl-1:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-ptl-1:          [PASS][7] -> [DMESG-WARN][8] +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - bat-ptl-2:          [PASS][9] -> [DMESG-WARN][10] +1 other test dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@xe_intel_bb@reset-bb:
    - bat-ptl-vm:         [PASS][11] -> [FAIL][12] +172 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-vm/igt@xe_intel_bb@reset-bb.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-vm/igt@xe_intel_bb@reset-bb.html

  * igt@xe_module_load@load:
    - bat-ptl-vm:         [PASS][13] -> [DMESG-FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-vm/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-vm/igt@xe_module_load@load.html

  * igt@xe_pat@prime-external-import-coh:
    - bat-ptl-2:          [PASS][15] -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-2/igt@xe_pat@prime-external-import-coh.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-2/igt@xe_pat@prime-external-import-coh.html
    - bat-ptl-1:          [PASS][17] -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-1/igt@xe_pat@prime-external-import-coh.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-1/igt@xe_pat@prime-external-import-coh.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-adlp-7:         [PASS][19] -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-adlp-7/igt@xe_sriov_flr@flr-vf1-clear.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-adlp-7/igt@xe_sriov_flr@flr-vf1-clear.html
    - bat-ptl-2:          [PASS][21] -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-2/igt@xe_sriov_flr@flr-vf1-clear.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-2/igt@xe_sriov_flr@flr-vf1-clear.html
    - bat-ptl-1:          [PASS][23] -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-1/igt@xe_sriov_flr@flr-vf1-clear.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-1/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-small-cm:
    - bat-ptl-vm:         [SKIP][25] ([Intel XE#5764]) -> [FAIL][26] +10 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_mmap@vram:
    - bat-ptl-vm:         [SKIP][27] ([Intel XE#5776]) -> [FAIL][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-vm/igt@xe_mmap@vram.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-vm/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-ptl-vm:         [SKIP][29] ([Intel XE#5777]) -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-ptl-vm:         [SKIP][31] ([Intel XE#5771]) -> [FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-ptl-vm:         [SKIP][33] ([Intel XE#5780]) -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html

  
Known issues
------------

  Here are the changes found in xe-pw-159797v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-ptl-vm:         [PASS][35] -> [FAIL][36] ([Intel XE#6710]) +3 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-vm/igt@xe_live_ktest@xe_dma_buf.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-vm/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-bmg-1:          [PASS][37] -> [FAIL][38] ([Intel XE#6569])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html
    - bat-bmg-2:          [PASS][39] -> [FAIL][40] ([Intel XE#6569])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-ptl-vm:         [SKIP][41] ([Intel XE#5775]) -> [FAIL][42] ([Intel XE#6710])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775
  [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6710]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6710


Build changes
-------------

  * Linux: xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e -> xe-pw-159797v3

  IGT_8692: 8692
  xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e: 2d6681bba1ed498dfb7483daa904f3b968d83d2e
  xe-pw-159797v3: 159797v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/index.html

--===============6438511829717409999==
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
<tr><td><b>Series:</b></td><td>Testing entire GGTT privatization preparation series. (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159797/">https://patchwork.freedesktop.org/series/159797/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e_BAT -&gt; xe-pw-159797v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159797v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-159797v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-159797v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-adlp-vm/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-adlp-vm/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@reset-bb:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-vm/igt@xe_intel_bb@reset-bb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-vm/igt@xe_intel_bb@reset-bb.html">FAIL</a> +172 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-vm/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-vm/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@prime-external-import-coh:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-2/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-2/igt@xe_pat@prime-external-import-coh.html">SKIP</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-1/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-1/igt@xe_pat@prime-external-import-coh.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-adlp-7/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-adlp-7/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-2/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-2/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-1/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-1/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-vm/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-vm/igt@xe_mmap@vram.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159797v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-vm/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-vm/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6710">Intel XE#6710</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159797v3/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6710">Intel XE#6710</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e -&gt; xe-pw-159797v3</li>
</ul>
<p>IGT_8692: 8692<br />
  xe-4348-2d6681bba1ed498dfb7483daa904f3b968d83d2e: 2d6681bba1ed498dfb7483daa904f3b968d83d2e<br />
  xe-pw-159797v3: 159797v3</p>

</body>
</html>

--===============6438511829717409999==--
