Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1504ACD98CC
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 12:31:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C132810EED3;
	Thu, 11 Jun 2026 12:31:05 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05A410E769;
 Thu, 11 Jun 2026 12:31:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4317685560867502105=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Allow_pushing_mor?=
 =?utf-8?q?e_jobs_into_LRC=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jun 2026 12:31:04 -0000
Message-ID: <178118106465.68362.9733791585635301065@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260611103613.191719-1-dev@lankhorst.se>
In-Reply-To: <20260611103613.191719-1-dev@lankhorst.se>
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

--===============4317685560867502105==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Allow pushing more jobs into LRC.
URL   : https://patchwork.freedesktop.org/series/168339/
State : failure

== Summary ==

CI Bug Log - changes from xe-5239-4fdfaadba04dc0f2f2490dbc91922caa290463a5_BAT -> xe-pw-168339v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-168339v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-168339v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-168339v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@many-basic:
    - bat-bmg-vm:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5239-4fdfaadba04dc0f2f2490dbc91922caa290463a5/bat-bmg-vm/igt@xe_exec_fault_mode@many-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168339v1/bat-bmg-vm/igt@xe_exec_fault_mode@many-basic.html

  


Build changes
-------------

  * Linux: xe-5239-4fdfaadba04dc0f2f2490dbc91922caa290463a5 -> xe-pw-168339v1

  IGT_8958: 8958
  xe-5239-4fdfaadba04dc0f2f2490dbc91922caa290463a5: 4fdfaadba04dc0f2f2490dbc91922caa290463a5
  xe-pw-168339v1: 168339v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168339v1/index.html

--===============4317685560867502105==
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
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168339/">https://patchwork.freedesktop.org/series/168339/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168339v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168339v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5239-4fdfaadba04dc0f2f2490dbc91922caa290463a5_BAT -&gt; xe-pw-168339v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-168339v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-168339v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-168339v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_fault_mode@many-basic:<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5239-4fdfaadba04dc0f2f2490dbc91922caa290463a5/bat-bmg-vm/igt@xe_exec_fault_mode@many-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168339v1/bat-bmg-vm/igt@xe_exec_fault_mode@many-basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5239-4fdfaadba04dc0f2f2490dbc91922caa290463a5 -&gt; xe-pw-168339v1</li>
</ul>
<p>IGT_8958: 8958<br />
  xe-5239-4fdfaadba04dc0f2f2490dbc91922caa290463a5: 4fdfaadba04dc0f2f2490dbc91922caa290463a5<br />
  xe-pw-168339v1: 168339v1</p>

</body>
</html>

--===============4317685560867502105==--
