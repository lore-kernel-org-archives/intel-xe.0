Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63670C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 11:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBE910E07E;
	Mon, 12 May 2025 11:23:40 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A04810E07E;
 Mon, 12 May 2025 11:23:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0929042279005781351=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/dmc=3A_PIPEDMC_stu?=
 =?utf-8?q?ff?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 May 2025 11:23:38 -0000
Message-ID: <174704901829.68960.153377606903110984@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512103358.15724-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250512103358.15724-1-ville.syrjala@linux.intel.com>
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

--===============0929042279005781351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dmc: PIPEDMC stuff
URL   : https://patchwork.freedesktop.org/series/148873/
State : failure

== Summary ==

CI Bug Log - changes from xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9_BAT -> xe-pw-148873v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148873v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148873v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148873v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/bat-adlp-7/igt@xe_sriov_flr@flr-vf1-clear.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148873v1/bat-adlp-7/igt@xe_sriov_flr@flr-vf1-clear.html

  
Known issues
------------

  Here are the changes found in xe-pw-148873v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_intel_bb@render@render-linear-256:
    - bat-adlp-vf:        [PASS][3] -> [ABORT][4] ([Intel XE#3970]) +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/bat-adlp-vf/igt@xe_intel_bb@render@render-linear-256.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148873v1/bat-adlp-vf/igt@xe_intel_bb@render@render-linear-256.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8359 -> IGT_8361
  * Linux: xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9 -> xe-pw-148873v1

  IGT_8359: 807f0cbcc771d1d0bb0d27a78231a5f92dc02126 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8361: 8361
  xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9: b0db97d4270c697ade930cfefdb7aaef12cd80c9
  xe-pw-148873v1: 148873v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148873v1/index.html

--===============0929042279005781351==
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
<tr><td><b>Series:</b></td><td>drm/i915/dmc: PIPEDMC stuff</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148873/">https://patchwork.freedesktop.org/series/148873/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148873v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148873v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9_BAT -&gt; xe-pw-148873v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148873v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-148873v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-148873v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_sriov_flr@flr-vf1-clear:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/bat-adlp-7/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148873v1/bat-adlp-7/igt@xe_sriov_flr@flr-vf1-clear.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148873v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_intel_bb@render@render-linear-256:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/bat-adlp-vf/igt@xe_intel_bb@render@render-linear-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148873v1/bat-adlp-vf/igt@xe_intel_bb@render@render-linear-256.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8359 -&gt; IGT_8361</li>
<li>Linux: xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9 -&gt; xe-pw-148873v1</li>
</ul>
<p>IGT_8359: 807f0cbcc771d1d0bb0d27a78231a5f92dc02126 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8361: 8361<br />
  xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9: b0db97d4270c697ade930cfefdb7aaef12cd80c9<br />
  xe-pw-148873v1: 148873v1</p>

</body>
</html>

--===============0929042279005781351==--
