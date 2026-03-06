Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0AFFCB61E
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 16:36:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14F710E0D4;
	Fri,  6 Mar 2026 16:36:06 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289A510E0D4;
 Fri,  6 Mar 2026 16:36:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2157462826916262474=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Page_Reclamation_Fixes_=28r?=
 =?utf-8?q?ev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Nguyen" <brian3.nguyen@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Mar 2026 16:36:04 -0000
Message-ID: <177281496409.326569.12524507755249113262@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260305171546.67691-5-brian3.nguyen@intel.com>
In-Reply-To: <20260305171546.67691-5-brian3.nguyen@intel.com>
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

--===============2157462826916262474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Page Reclamation Fixes (rev4)
URL   : https://patchwork.freedesktop.org/series/162258/
State : failure

== Summary ==

CI Bug Log - changes from xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f_BAT -> xe-pw-162258v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-162258v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-162258v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 4)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-162258v4_BAT prevented too many machines from booting.

  Missing    (11): bat-bmg-1 bat-lnl-2 bat-pvc-2 bat-lnl-1 bat-ptl-vm bat-atsm-2 bat-bmg-3 bat-wcl-1 bat-wcl-2 bat-bmg-2 bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8782 -> IGT_8783
  * Linux: xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f -> xe-pw-162258v4

  IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8783: b5051dc2e867005c758c707312aa9cf9d1dc3291 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f: a48305e6a2e6a1ed90df374101dd29542c105d8f
  xe-pw-162258v4: 162258v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162258v4/index.html

--===============2157462826916262474==
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
<tr><td><b>Series:</b></td><td>Page Reclamation Fixes (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162258/">https://patchwork.freedesktop.org/series/162258/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162258v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162258v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f_BAT -&gt; xe-pw-162258v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-162258v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-162258v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 4)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-162258v4_BAT prevented too many machines from booting.</p>
<p>Missing    (11): bat-bmg-1 bat-lnl-2 bat-pvc-2 bat-lnl-1 bat-ptl-vm bat-atsm-2 bat-bmg-3 bat-wcl-1 bat-wcl-2 bat-bmg-2 bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8782 -&gt; IGT_8783</li>
<li>Linux: xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f -&gt; xe-pw-162258v4</li>
</ul>
<p>IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8783: b5051dc2e867005c758c707312aa9cf9d1dc3291 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f: a48305e6a2e6a1ed90df374101dd29542c105d8f<br />
  xe-pw-162258v4: 162258v4</p>

</body>
</html>

--===============2157462826916262474==--
