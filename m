Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14F2C48BF8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 04:25:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7212F10E871;
	Thu, 22 Feb 2024 04:25:16 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED52B10E868;
 Thu, 22 Feb 2024 04:25:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4943500746514599318=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Fix_execlist_mode_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Feb 2024 04:25:14 -0000
Message-ID: <170857591497.197499.9541981122346667925@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240222034725.3835064-1-matthew.brost@intel.com>
In-Reply-To: <20240222034725.3835064-1-matthew.brost@intel.com>
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

--===============4943500746514599318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix execlist mode (rev2)
URL   : https://patchwork.freedesktop.org/series/130165/
State : success

== Summary ==

CI Bug Log - changes from xe-819-06b279b4fb58a00667e47fafed72bba923d032ae_BAT -> xe-pw-130165v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7720 -> IGT_7721
  * Linux: xe-819-06b279b4fb58a00667e47fafed72bba923d032ae -> xe-pw-130165v2

  IGT_7720: 7720
  IGT_7721: 7721
  xe-819-06b279b4fb58a00667e47fafed72bba923d032ae: 06b279b4fb58a00667e47fafed72bba923d032ae
  xe-pw-130165v2: 130165v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130165v2/index.html

--===============4943500746514599318==
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
<tr><td><b>Series:</b></td><td>Fix execlist mode (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130165/">https://patchwork.freedesktop.org/series/130165/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130165v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130165v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-819-06b279b4fb58a00667e47fafed72bba923d032ae_BAT -&gt; xe-pw-130165v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7720 -&gt; IGT_7721</li>
<li>Linux: xe-819-06b279b4fb58a00667e47fafed72bba923d032ae -&gt; xe-pw-130165v2</li>
</ul>
<p>IGT_7720: 7720<br />
  IGT_7721: 7721<br />
  xe-819-06b279b4fb58a00667e47fafed72bba923d032ae: 06b279b4fb58a00667e47fafed72bba923d032ae<br />
  xe-pw-130165v2: 130165v2</p>

</body>
</html>

--===============4943500746514599318==--
