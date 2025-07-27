Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A49C87FCC
	for <intel-xe@archiver.kernel.org>; Sun, 27 Jul 2025 05:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64E110E3BF;
	Sun, 27 Jul 2025 05:06:52 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9882D10E0E7;
 Sun, 27 Jul 2025 05:06:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3135057306304041330=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Mark_xe_driver_as_BROKEN_un?=
 =?utf-8?q?til_fixed?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simon Richter" <Simon.Richter@hogyros.de>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 27 Jul 2025 05:06:51 -0000
Message-ID: <175359281161.192356.11576375768964617509@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250727042825.8560-1-Simon.Richter@hogyros.de>
In-Reply-To: <20250727042825.8560-1-Simon.Richter@hogyros.de>
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

--===============3135057306304041330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Mark xe driver as BROKEN until fixed
URL   : https://patchwork.freedesktop.org/series/152144/
State : failure

== Summary ==

CI Bug Log - changes from xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04_BAT -> xe-pw-152144v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152144v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152144v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 0)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-152144v1_BAT prevented too many machines from booting.

  Missing    (9): bat-bmg-1 bat-pvc-2 bat-lnl-2 bat-lnl-1 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-vm bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04 -> xe-pw-152144v1

  IGT_8476: 232d4de46aa5ec03aee240657c0b36110f8a6246 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04: 11e629e8c02307977802ba0ea8c60ddb15b17d04
  xe-pw-152144v1: 152144v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152144v1/index.html

--===============3135057306304041330==
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
<tr><td><b>Series:</b></td><td>Mark xe driver as BROKEN until fixed</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152144/">https://patchwork.freedesktop.org/series/152144/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152144v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152144v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04_BAT -&gt; xe-pw-152144v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152144v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-152144v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-152144v1_BAT prevented too many machines from booting.</p>
<p>Missing    (9): bat-bmg-1 bat-pvc-2 bat-lnl-2 bat-lnl-1 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-vm bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04 -&gt; xe-pw-152144v1</li>
</ul>
<p>IGT_8476: 232d4de46aa5ec03aee240657c0b36110f8a6246 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3479-11e629e8c02307977802ba0ea8c60ddb15b17d04: 11e629e8c02307977802ba0ea8c60ddb15b17d04<br />
  xe-pw-152144v1: 152144v1</p>

</body>
</html>

--===============3135057306304041330==--
