Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1E4CA0EDC
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 12:10:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E268C10E870;
	Thu, 14 Aug 2025 12:10:49 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122D410E870;
 Thu, 14 Aug 2025 12:10:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0701832876525450570=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_dma-buf/fence-chain=3A_Spee?=
 =?utf-8?q?d_up_processing_of_rearmed_callbacks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Aug 2025 12:10:49 -0000
Message-ID: <175517344906.236498.16200004423707383132@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250814094824.217142-6-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20250814094824.217142-6-janusz.krzysztofik@linux.intel.com>
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

--===============0701832876525450570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: dma-buf/fence-chain: Speed up processing of rearmed callbacks
URL   : https://patchwork.freedesktop.org/series/152942/
State : failure

== Summary ==

CI Bug Log - changes from xe-3544-bf59df1310c07161fe79bc9dbc9919b674643fef_BAT -> xe-pw-152942v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152942v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152942v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 9)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152942v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@twice-parallel-basic:
    - bat-bmg-2:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3544-bf59df1310c07161fe79bc9dbc9919b674643fef/bat-bmg-2/igt@xe_exec_balancer@twice-parallel-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152942v1/bat-bmg-2/igt@xe_exec_balancer@twice-parallel-basic.html
    - bat-bmg-1:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3544-bf59df1310c07161fe79bc9dbc9919b674643fef/bat-bmg-1/igt@xe_exec_balancer@twice-parallel-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152942v1/bat-bmg-1/igt@xe_exec_balancer@twice-parallel-basic.html
    - bat-dg2-oem2:       [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3544-bf59df1310c07161fe79bc9dbc9919b674643fef/bat-dg2-oem2/igt@xe_exec_balancer@twice-parallel-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152942v1/bat-dg2-oem2/igt@xe_exec_balancer@twice-parallel-basic.html
    - bat-atsm-2:         [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3544-bf59df1310c07161fe79bc9dbc9919b674643fef/bat-atsm-2/igt@xe_exec_balancer@twice-parallel-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152942v1/bat-atsm-2/igt@xe_exec_balancer@twice-parallel-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-152942v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [PASS][9] -> [DMESG-WARN][10] ([Intel XE#4543]) +1 other test dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3544-bf59df1310c07161fe79bc9dbc9919b674643fef/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152942v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * Linux: xe-3544-bf59df1310c07161fe79bc9dbc9919b674643fef -> xe-pw-152942v1

  IGT_8493: 8493
  xe-3544-bf59df1310c07161fe79bc9dbc9919b674643fef: bf59df1310c07161fe79bc9dbc9919b674643fef
  xe-pw-152942v1: 152942v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152942v1/index.html

--===============0701832876525450570==
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
<tr><td><b>Series:</b></td><td>dma-buf/fence-chain: Speed up processing of rearmed callbacks</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152942/">https://patchwork.freedesktop.org/series/152942/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152942v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152942v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3544-bf59df1310c07161fe79bc9dbc9919b674643fef_BAT -&gt; xe-pw-152942v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152942v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-152942v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-152942v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_balancer@twice-parallel-basic:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3544-bf59df1310c07161fe79bc9dbc9919b674643fef/bat-bmg-2/igt@xe_exec_balancer@twice-parallel-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152942v1/bat-bmg-2/igt@xe_exec_balancer@twice-parallel-basic.html">INCOMPLETE</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3544-bf59df1310c07161fe79bc9dbc9919b674643fef/bat-bmg-1/igt@xe_exec_balancer@twice-parallel-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152942v1/bat-bmg-1/igt@xe_exec_balancer@twice-parallel-basic.html">INCOMPLETE</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3544-bf59df1310c07161fe79bc9dbc9919b674643fef/bat-dg2-oem2/igt@xe_exec_balancer@twice-parallel-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152942v1/bat-dg2-oem2/igt@xe_exec_balancer@twice-parallel-basic.html">INCOMPLETE</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3544-bf59df1310c07161fe79bc9dbc9919b674643fef/bat-atsm-2/igt@xe_exec_balancer@twice-parallel-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152942v1/bat-atsm-2/igt@xe_exec_balancer@twice-parallel-basic.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152942v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3544-bf59df1310c07161fe79bc9dbc9919b674643fef/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152942v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3544-bf59df1310c07161fe79bc9dbc9919b674643fef -&gt; xe-pw-152942v1</li>
</ul>
<p>IGT_8493: 8493<br />
  xe-3544-bf59df1310c07161fe79bc9dbc9919b674643fef: bf59df1310c07161fe79bc9dbc9919b674643fef<br />
  xe-pw-152942v1: 152942v1</p>

</body>
</html>

--===============0701832876525450570==--
