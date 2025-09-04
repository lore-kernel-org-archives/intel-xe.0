Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A03CA1002
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 14:02:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C56410EA4B;
	Thu,  4 Sep 2025 14:02:43 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CD310EA4B;
 Thu,  4 Sep 2025 14:02:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5064947454666120181=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fixes_around_evic?=
 =?utf-8?q?tion_and_suspend_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Sep 2025 14:02:41 -0000
Message-ID: <175699456198.303731.5416421990681416109@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250904130614.3212-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250904130614.3212-1-thomas.hellstrom@linux.intel.com>
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

--===============5064947454666120181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fixes around eviction and suspend (rev3)
URL   : https://patchwork.freedesktop.org/series/153712/
State : success

== Summary ==

CI Bug Log - changes from xe-3677-3345c879b0492f1283042ae6bdecb0e65ec4ff97_BAT -> xe-pw-153712v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): bat-ptl-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8522 -> IGT_8524
  * Linux: xe-3677-3345c879b0492f1283042ae6bdecb0e65ec4ff97 -> xe-pw-153712v3

  IGT_8522: 8522
  IGT_8524: 8524
  xe-3677-3345c879b0492f1283042ae6bdecb0e65ec4ff97: 3345c879b0492f1283042ae6bdecb0e65ec4ff97
  xe-pw-153712v3: 153712v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153712v3/index.html

--===============5064947454666120181==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fixes around eviction and suspend (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153712/">https://patchwork.freedesktop.org/series/153712/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153712v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153712v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3677-3345c879b0492f1283042ae6bdecb0e65ec4ff97_BAT -&gt; xe-pw-153712v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 10)</h2>
<p>Missing    (1): bat-ptl-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8522 -&gt; IGT_8524</li>
<li>Linux: xe-3677-3345c879b0492f1283042ae6bdecb0e65ec4ff97 -&gt; xe-pw-153712v3</li>
</ul>
<p>IGT_8522: 8522<br />
  IGT_8524: 8524<br />
  xe-3677-3345c879b0492f1283042ae6bdecb0e65ec4ff97: 3345c879b0492f1283042ae6bdecb0e65ec4ff97<br />
  xe-pw-153712v3: 153712v3</p>

</body>
</html>

--===============5064947454666120181==--
