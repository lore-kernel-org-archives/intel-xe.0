Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712AEC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 23:44:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2251610EA37;
	Mon, 25 Mar 2024 23:44:08 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F70710E7B8;
 Mon, 25 Mar 2024 23:44:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2450676949171952653=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/guc=3A_Remove_explicit_sh?=
 =?utf-8?q?utdown_of_SLPC_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Mar 2024 23:44:07 -0000
Message-ID: <171141024713.1038645.8522915778947403980@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321184924.234579-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20240321184924.234579-1-vinay.belgaumkar@intel.com>
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

--===============2450676949171952653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Remove explicit shutdown of SLPC (rev2)
URL   : https://patchwork.freedesktop.org/series/131449/
State : failure

== Summary ==

CI Bug Log - changes from xe-990-3dc2116dbf63f02771f241fdabee8a3e3ff9e8a8_BAT -> xe-pw-131449v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-131449v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-131449v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 0)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-131449v2_BAT prevented too many machines from booting.

  Missing    (3): bat-pvc-2 bat-adlp-7 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-990-3dc2116dbf63f02771f241fdabee8a3e3ff9e8a8 -> xe-pw-131449v2

  IGT_7782: a404f73182948e843640d00cc279883391cf6ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-990-3dc2116dbf63f02771f241fdabee8a3e3ff9e8a8: 3dc2116dbf63f02771f241fdabee8a3e3ff9e8a8
  xe-pw-131449v2: 131449v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131449v2/index.html

--===============2450676949171952653==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Remove explicit shutdown of SLPC (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131449/">https://patchwork.freedesktop.org/series/131449/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131449v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131449v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-990-3dc2116dbf63f02771f241fdabee8a3e3ff9e8a8_BAT -&gt; xe-pw-131449v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-131449v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-131449v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-131449v2_BAT prevented too many machines from booting.</p>
<p>Missing    (3): bat-pvc-2 bat-adlp-7 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-990-3dc2116dbf63f02771f241fdabee8a3e3ff9e8a8 -&gt; xe-pw-131449v2</li>
</ul>
<p>IGT_7782: a404f73182948e843640d00cc279883391cf6ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-990-3dc2116dbf63f02771f241fdabee8a3e3ff9e8a8: 3dc2116dbf63f02771f241fdabee8a3e3ff9e8a8<br />
  xe-pw-131449v2: 131449v2</p>

</body>
</html>

--===============2450676949171952653==--
