Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB077C5B552
	for <intel-xe@archiver.kernel.org>; Sun,  8 Jun 2025 18:46:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDD510E3CD;
	Sun,  8 Jun 2025 18:46:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4C010E38C;
 Sun,  8 Jun 2025 18:46:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7954692061916755180=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Enable_ATS_if_ena?=
 =?utf-8?q?bled_on_the_PCI_side_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 08 Jun 2025 18:46:40 -0000
Message-ID: <174940840089.58330.18185915440714753533@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250608173619.200247-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250608173619.200247-1-thomas.hellstrom@linux.intel.com>
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

--===============7954692061916755180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Enable ATS if enabled on the PCI side (rev2)
URL   : https://patchwork.freedesktop.org/series/149886/
State : failure

== Summary ==

CI Bug Log - changes from xe-3214-b8f759deb9abbafcb01468baecf33aee93ace35f_BAT -> xe-pw-149886v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149886v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149886v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149886v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] +30 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3214-b8f759deb9abbafcb01468baecf33aee93ace35f/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149886v2/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-lnl-2:          [PASS][3] -> [FAIL][4] +30 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3214-b8f759deb9abbafcb01468baecf33aee93ace35f/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149886v2/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  


Build changes
-------------

  * Linux: xe-3214-b8f759deb9abbafcb01468baecf33aee93ace35f -> xe-pw-149886v2

  IGT_8401: 8401
  xe-3214-b8f759deb9abbafcb01468baecf33aee93ace35f: b8f759deb9abbafcb01468baecf33aee93ace35f
  xe-pw-149886v2: 149886v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149886v2/index.html

--===============7954692061916755180==
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
<tr><td><b>Series:</b></td><td>drm/xe: Enable ATS if enabled on the PCI side (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149886/">https://patchwork.freedesktop.org/series/149886/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149886v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149886v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3214-b8f759deb9abbafcb01468baecf33aee93ace35f_BAT -&gt; xe-pw-149886v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149886v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-149886v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-149886v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3214-b8f759deb9abbafcb01468baecf33aee93ace35f/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149886v2/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">FAIL</a> +30 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3214-b8f759deb9abbafcb01468baecf33aee93ace35f/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149886v2/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">FAIL</a> +30 other tests fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3214-b8f759deb9abbafcb01468baecf33aee93ace35f -&gt; xe-pw-149886v2</li>
</ul>
<p>IGT_8401: 8401<br />
  xe-3214-b8f759deb9abbafcb01468baecf33aee93ace35f: b8f759deb9abbafcb01468baecf33aee93ace35f<br />
  xe-pw-149886v2: 149886v2</p>

</body>
</html>

--===============7954692061916755180==--
