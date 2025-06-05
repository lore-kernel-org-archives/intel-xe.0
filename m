Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D71C5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 20:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39F910E31B;
	Thu,  5 Jun 2025 20:46:40 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5364910E31B;
 Thu,  5 Jun 2025 20:46:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8215006585992026794=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Enable_ATS_if_ena?=
 =?utf-8?q?bled_on_the_PCI_side?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Hellstrom" <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Jun 2025 20:46:39 -0000
Message-ID: <174915639933.53652.17541521310497040543@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605145838.31942-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250605145838.31942-1-thomas.hellstrom@linux.intel.com>
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

--===============8215006585992026794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Enable ATS if enabled on the PCI side
URL   : https://patchwork.freedesktop.org/series/149886/
State : failure

== Summary ==

CI Bug Log - changes from xe-3200-d5a5fd842902e24da80b61d64ce337ecee6b0c41_BAT -> xe-pw-149886v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149886v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149886v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 6)
------------------------------

  Missing    (2): bat-lnl-2 bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149886v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] +30 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3200-d5a5fd842902e24da80b61d64ce337ecee6b0c41/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149886v1/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html

  


Build changes
-------------

  * IGT: IGT_8396 -> IGT_8397
  * Linux: xe-3200-d5a5fd842902e24da80b61d64ce337ecee6b0c41 -> xe-pw-149886v1

  IGT_8396: 8396
  IGT_8397: 181d409e619a5eff49ede13f058343dbe8acb417 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3200-d5a5fd842902e24da80b61d64ce337ecee6b0c41: d5a5fd842902e24da80b61d64ce337ecee6b0c41
  xe-pw-149886v1: 149886v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149886v1/index.html

--===============8215006585992026794==
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
<tr><td><b>Series:</b></td><td>drm/xe: Enable ATS if enabled on the PCI side</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149886/">https://patchwork.freedesktop.org/series/149886/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149886v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149886v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3200-d5a5fd842902e24da80b61d64ce337ecee6b0c41_BAT -&gt; xe-pw-149886v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149886v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-149886v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 6)</h2>
<p>Missing    (2): bat-lnl-2 bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-149886v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3200-d5a5fd842902e24da80b61d64ce337ecee6b0c41/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149886v1/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">FAIL</a> +30 other tests fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8396 -&gt; IGT_8397</li>
<li>Linux: xe-3200-d5a5fd842902e24da80b61d64ce337ecee6b0c41 -&gt; xe-pw-149886v1</li>
</ul>
<p>IGT_8396: 8396<br />
  IGT_8397: 181d409e619a5eff49ede13f058343dbe8acb417 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3200-d5a5fd842902e24da80b61d64ce337ecee6b0c41: d5a5fd842902e24da80b61d64ce337ecee6b0c41<br />
  xe-pw-149886v1: 149886v1</p>

</body>
</html>

--===============8215006585992026794==--
