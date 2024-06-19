Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD175C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 18:07:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3401810E18C;
	Wed, 19 Jun 2024 18:07:03 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B773010E025;
 Wed, 19 Jun 2024 18:07:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7417296343699958873=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Use_write-back_caching?=
 =?utf-8?q?_mode_for_system_memory_on_DGFX?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Jun 2024 18:07:02 -0000
Message-ID: <171882042274.124989.8754805956359680820@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240619163904.2935-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240619163904.2935-1-thomas.hellstrom@linux.intel.com>
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

--===============7417296343699958873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use write-back caching mode for system memory on DGFX
URL   : https://patchwork.freedesktop.org/series/135071/
State : failure

== Summary ==

CI Bug Log - changes from xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986_BAT -> xe-pw-135071v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-135071v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-135071v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 2)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-135071v1_BAT prevented too many machines from booting.

  Missing    (3): bat-dg2-oem2 bat-lnl-1 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986 -> xe-pw-135071v1

  IGT_7892: 7892
  xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986: 5a9469e2b0a01256827b5ace72bae9c525005986
  xe-pw-135071v1: 135071v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v1/index.html

--===============7417296343699958873==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use write-back caching mode for system memory on DGFX</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135071/">https://patchwork.freedesktop.org/series/135071/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135071v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986_BAT -&gt; xe-pw-135071v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-135071v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-135071v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 2)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-135071v1_BAT prevented too many machines from booting.</p>
<p>Missing    (3): bat-dg2-oem2 bat-lnl-1 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986 -&gt; xe-pw-135071v1</li>
</ul>
<p>IGT_7892: 7892<br />
  xe-1499-5a9469e2b0a01256827b5ace72bae9c525005986: 5a9469e2b0a01256827b5ace72bae9c525005986<br />
  xe-pw-135071v1: 135071v1</p>

</body>
</html>

--===============7417296343699958873==--
