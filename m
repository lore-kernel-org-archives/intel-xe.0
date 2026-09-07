Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64A4C79FA1
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 16:45:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5398610E2FF;
	Mon,  7 Sep 2026 16:45:47 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3E910E04E;
 Mon,  7 Sep 2026 16:45:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7634398229248178153=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Skip_clearing_pur?=
 =?utf-8?q?ged_page-table_BOs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Sep 2026 16:45:46 -0000
Message-ID: <178879954663.130175.1962209331094882866@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260907153706.888679-2-tejas.upadhyay@intel.com>
In-Reply-To: <20260907153706.888679-2-tejas.upadhyay@intel.com>
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

--===============7634398229248178153==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Skip clearing purged page-table BOs (rev2)
URL   : https://patchwork.freedesktop.org/series/173375/
State : success

== Summary ==

CI Bug Log - changes from xe-5698-547f981c369d4b8adf60c5d282b37854f11dab17_BAT -> xe-pw-173375v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-nvls-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9084 -> IGT_9085
  * Linux: xe-5698-547f981c369d4b8adf60c5d282b37854f11dab17 -> xe-pw-173375v2

  IGT_9084: 9084
  IGT_9085: 9085
  xe-5698-547f981c369d4b8adf60c5d282b37854f11dab17: 547f981c369d4b8adf60c5d282b37854f11dab17
  xe-pw-173375v2: 173375v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v2/index.html

--===============7634398229248178153==
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
<tr><td><b>Series:</b></td><td>drm/xe: Skip clearing purged page-table BOs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173375/">https://patchwork.freedesktop.org/series/173375/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5698-547f981c369d4b8adf60c5d282b37854f11dab17_BAT -&gt; xe-pw-173375v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-nvls-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9084 -&gt; IGT_9085</li>
<li>Linux: xe-5698-547f981c369d4b8adf60c5d282b37854f11dab17 -&gt; xe-pw-173375v2</li>
</ul>
<p>IGT_9084: 9084<br />
  IGT_9085: 9085<br />
  xe-5698-547f981c369d4b8adf60c5d282b37854f11dab17: 547f981c369d4b8adf60c5d282b37854f11dab17<br />
  xe-pw-173375v2: 173375v2</p>

</body>
</html>

--===============7634398229248178153==--
