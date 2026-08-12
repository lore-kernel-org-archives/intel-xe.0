Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCCCC5CFDB
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 20:34:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68AEB10E24A;
	Wed, 12 Aug 2026 20:34:24 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3C610E24A;
 Wed, 12 Aug 2026 20:34:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1061714407536732997=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Add_structured_SI?=
 =?utf-8?q?GID_error_logging_infrastructure_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Aug 2026 20:34:23 -0000
Message-ID: <178656686396.45177.10796777257616631765@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260812191450.11690-1-michal.wajdeczko@intel.com>
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

--===============1061714407536732997==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add structured SIGID error logging infrastructure (rev4)
URL   : https://patchwork.freedesktop.org/series/171022/
State : failure

== Summary ==

CI Bug Log - changes from xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a_BAT -> xe-pw-171022v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-171022v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-171022v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 11)
------------------------------

  Missing    (2): bat-bmg-2 bat-nvls-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-171022v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@invalid-va:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a/bat-bmg-1/igt@xe_exec_fault_mode@invalid-va.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v4/bat-bmg-1/igt@xe_exec_fault_mode@invalid-va.html
    - bat-lnl-2:          [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a/bat-lnl-2/igt@xe_exec_fault_mode@invalid-va.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v4/bat-lnl-2/igt@xe_exec_fault_mode@invalid-va.html
    - bat-nvls-2:         [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a/bat-nvls-2/igt@xe_exec_fault_mode@invalid-va.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v4/bat-nvls-2/igt@xe_exec_fault_mode@invalid-va.html
    - bat-wcl-1:          [PASS][7] -> [DMESG-WARN][8] +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a/bat-wcl-1/igt@xe_exec_fault_mode@invalid-va.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v4/bat-wcl-1/igt@xe_exec_fault_mode@invalid-va.html
    - bat-ptl-1:          [PASS][9] -> [DMESG-WARN][10] +1 other test dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a/bat-ptl-1/igt@xe_exec_fault_mode@invalid-va.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v4/bat-ptl-1/igt@xe_exec_fault_mode@invalid-va.html
    - bat-lnl-1:          [PASS][11] -> [DMESG-WARN][12] +1 other test dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a/bat-lnl-1/igt@xe_exec_fault_mode@invalid-va.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v4/bat-lnl-1/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_exec_system_allocator@fault:
    - bat-wcl-2:          [PASS][13] -> [DMESG-WARN][14] +1 other test dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a/bat-wcl-2/igt@xe_exec_system_allocator@fault.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v4/bat-wcl-2/igt@xe_exec_system_allocator@fault.html
    - bat-ptl-2:          [PASS][15] -> [DMESG-WARN][16] +1 other test dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a/bat-ptl-2/igt@xe_exec_system_allocator@fault.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v4/bat-ptl-2/igt@xe_exec_system_allocator@fault.html

  


Build changes
-------------

  * Linux: xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a -> xe-pw-171022v4

  IGT_9054: 3d819a8f511b2bcd844647bcf7e433b9407d058e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a: 43db79ba5c8eac68b393cca2faa0b13a6505de1a
  xe-pw-171022v4: 171022v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v4/index.html

--===============1061714407536732997==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add structured SIGID error logging infrastructure (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171022/">https://patchwork.freedesktop.org/series/171022/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a_BAT -&gt; xe-pw-171022v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-171022v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-171022v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 11)</h2>
<p>Missing    (2): bat-bmg-2 bat-nvls-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-171022v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a/bat-bmg-1/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v4/bat-bmg-1/igt@xe_exec_fault_mode@invalid-va.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a/bat-lnl-2/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v4/bat-lnl-2/igt@xe_exec_fault_mode@invalid-va.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a/bat-nvls-2/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v4/bat-nvls-2/igt@xe_exec_fault_mode@invalid-va.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a/bat-wcl-1/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v4/bat-wcl-1/igt@xe_exec_fault_mode@invalid-va.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a/bat-ptl-1/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v4/bat-ptl-1/igt@xe_exec_fault_mode@invalid-va.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a/bat-lnl-1/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v4/bat-lnl-1/igt@xe_exec_fault_mode@invalid-va.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@fault:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a/bat-wcl-2/igt@xe_exec_system_allocator@fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v4/bat-wcl-2/igt@xe_exec_system_allocator@fault.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a/bat-ptl-2/igt@xe_exec_system_allocator@fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v4/bat-ptl-2/igt@xe_exec_system_allocator@fault.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a -&gt; xe-pw-171022v4</li>
</ul>
<p>IGT_9054: 3d819a8f511b2bcd844647bcf7e433b9407d058e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5582-43db79ba5c8eac68b393cca2faa0b13a6505de1a: 43db79ba5c8eac68b393cca2faa0b13a6505de1a<br />
  xe-pw-171022v4: 171022v4</p>

</body>
</html>

--===============1061714407536732997==--
