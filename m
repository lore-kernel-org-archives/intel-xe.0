Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33182C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 18:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC78C10EB90;
	Tue, 16 Apr 2024 18:44:23 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9EF10EB90;
 Tue, 16 Apr 2024 18:44:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5447806969031478587=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_starting_with_=5B1/2=5D_d?=
 =?utf-8?q?rm/xe/display=3A_Unify_DPT_mapping?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Apr 2024 18:44:22 -0000
Message-ID: <171329306275.1445384.5962746296787741038@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240416181406.124125-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240416181406.124125-1-juhapekka.heikkila@gmail.com>
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

--===============5447806969031478587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe/display: Unify DPT mapping
URL   : https://patchwork.freedesktop.org/series/132510/
State : failure

== Summary ==

CI Bug Log - changes from xe-1100-ac65548d74fa1cb3aa3418285c255c028ff44334_BAT -> xe-pw-132510v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-132510v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-132510v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 0)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-132510v1_BAT prevented too many machines from booting.

  Missing    (4): bat-pvc-2 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1100-ac65548d74fa1cb3aa3418285c255c028ff44334 -> xe-pw-132510v1

  IGT_7809: 3a71f659700859cab49b8e05a198ba18a5cbd24a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1100-ac65548d74fa1cb3aa3418285c255c028ff44334: ac65548d74fa1cb3aa3418285c255c028ff44334
  xe-pw-132510v1: 132510v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132510v1/index.html

--===============5447806969031478587==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe/display: Unify DPT mapping</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132510/">https://patchwork.freedesktop.org/series/132510/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132510v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132510v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1100-ac65548d74fa1cb3aa3418285c255c028ff44334_BAT -&gt; xe-pw-132510v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-132510v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-132510v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-132510v1_BAT prevented too many machines from booting.</p>
<p>Missing    (4): bat-pvc-2 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1100-ac65548d74fa1cb3aa3418285c255c028ff44334 -&gt; xe-pw-132510v1</li>
</ul>
<p>IGT_7809: 3a71f659700859cab49b8e05a198ba18a5cbd24a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1100-ac65548d74fa1cb3aa3418285c255c028ff44334: ac65548d74fa1cb3aa3418285c255c028ff44334<br />
  xe-pw-132510v1: 132510v1</p>

</body>
</html>

--===============5447806969031478587==--
