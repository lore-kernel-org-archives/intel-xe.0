Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25079CCD1BF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 16:40:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D480110EB11;
	Fri, 24 Oct 2025 16:40:46 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B917010EB11;
 Fri, 24 Oct 2025 16:40:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5732889943036762056=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Fix_serialization_on_burst_?=
 =?utf-8?q?of_unbinds_-_v2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Oct 2025 16:40:45 -0000
Message-ID: <176132404573.53484.7645501927743451514@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251024152323.1281242-1-matthew.brost@intel.com>
In-Reply-To: <20251024152323.1281242-1-matthew.brost@intel.com>
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

--===============5732889943036762056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix serialization on burst of unbinds - v2
URL   : https://patchwork.freedesktop.org/series/156486/
State : failure

== Summary ==

CI Bug Log - changes from xe-3982-60a51825a1d699df170dfa797b099112e3a02de4_BAT -> xe-pw-156486v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-156486v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-156486v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-156486v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-ptl-vm:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/bat-ptl-vm/igt@xe_exec_fault_mode@twice-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/bat-ptl-vm/igt@xe_exec_fault_mode@twice-basic.html
    - bat-lnl-1:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/bat-lnl-1/igt@xe_exec_fault_mode@twice-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/bat-lnl-1/igt@xe_exec_fault_mode@twice-basic.html
    - bat-pvc-2:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html
    - bat-bmg-2:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/bat-bmg-2/igt@xe_exec_fault_mode@twice-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/bat-bmg-2/igt@xe_exec_fault_mode@twice-basic.html
    - bat-bmg-1:          [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic.html
    - bat-lnl-2:          [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/bat-lnl-2/igt@xe_exec_fault_mode@twice-basic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/bat-lnl-2/igt@xe_exec_fault_mode@twice-basic.html
    - bat-ptl-2:          [PASS][13] -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/bat-ptl-2/igt@xe_exec_fault_mode@twice-basic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/bat-ptl-2/igt@xe_exec_fault_mode@twice-basic.html
    - bat-ptl-1:          [PASS][15] -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/bat-ptl-1/igt@xe_exec_fault_mode@twice-basic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/bat-ptl-1/igt@xe_exec_fault_mode@twice-basic.html

  * igt@xe_waitfence@reltime:
    - bat-bmg-1:          [PASS][17] -> [FAIL][18] +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/bat-bmg-1/igt@xe_waitfence@reltime.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/bat-bmg-1/igt@xe_waitfence@reltime.html
    - bat-atsm-2:         [PASS][19] -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/bat-atsm-2/igt@xe_waitfence@reltime.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/bat-atsm-2/igt@xe_waitfence@reltime.html

  
Known issues
------------

  Here are the changes found in xe-pw-156486v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - bat-adlp-7:         [PASS][21] -> [DMESG-WARN][22] ([Intel XE#4543]) +1 other test dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-3982-60a51825a1d699df170dfa797b099112e3a02de4 -> xe-pw-156486v1

  IGT_8596: 8596
  xe-3982-60a51825a1d699df170dfa797b099112e3a02de4: 60a51825a1d699df170dfa797b099112e3a02de4
  xe-pw-156486v1: 156486v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/index.html

--===============5732889943036762056==
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
<tr><td><b>Series:</b></td><td>Fix serialization on burst of unbinds - v2</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156486/">https://patchwork.freedesktop.org/series/156486/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3982-60a51825a1d699df170dfa797b099112e3a02de4_BAT -&gt; xe-pw-156486v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-156486v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-156486v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-156486v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-basic:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/bat-ptl-vm/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/bat-ptl-vm/igt@xe_exec_fault_mode@twice-basic.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/bat-lnl-1/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/bat-lnl-1/igt@xe_exec_fault_mode@twice-basic.html">ABORT</a></li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">ABORT</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/bat-bmg-2/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/bat-bmg-2/igt@xe_exec_fault_mode@twice-basic.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/bat-lnl-2/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/bat-lnl-2/igt@xe_exec_fault_mode@twice-basic.html">ABORT</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/bat-ptl-2/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/bat-ptl-2/igt@xe_exec_fault_mode@twice-basic.html">ABORT</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/bat-ptl-1/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/bat-ptl-1/igt@xe_exec_fault_mode@twice-basic.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/bat-bmg-1/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/bat-bmg-1/igt@xe_waitfence@reltime.html">FAIL</a> +1 other test fail</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/bat-atsm-2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/bat-atsm-2/igt@xe_waitfence@reltime.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156486v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3982-60a51825a1d699df170dfa797b099112e3a02de4/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156486v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3982-60a51825a1d699df170dfa797b099112e3a02de4 -&gt; xe-pw-156486v1</li>
</ul>
<p>IGT_8596: 8596<br />
  xe-3982-60a51825a1d699df170dfa797b099112e3a02de4: 60a51825a1d699df170dfa797b099112e3a02de4<br />
  xe-pw-156486v1: 156486v1</p>

</body>
</html>

--===============5732889943036762056==--
