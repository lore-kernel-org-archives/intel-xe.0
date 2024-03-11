Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79B4C5475B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 16:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D36D10EE32;
	Mon, 11 Mar 2024 16:33:07 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB9010EE32;
 Mon, 11 Mar 2024 16:33:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1612904915889194607=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Remove_unused_xe=5Fbo-?=
 =?utf-8?q?=3Eprops_struct?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 Mar 2024 16:33:06 -0000
Message-ID: <171017478671.680151.8332689058340864875@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240311151159.10036-1-nirmoy.das@intel.com>
In-Reply-To: <20240311151159.10036-1-nirmoy.das@intel.com>
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

--===============1612904915889194607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Remove unused xe_bo->props struct
URL   : https://patchwork.freedesktop.org/series/130989/
State : success

== Summary ==

CI Bug Log - changes from xe-928-2c2957bb1a0058ea85ca21d62762aa54e28aff54_BAT -> xe-pw-130989v1_BAT
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

  * IGT: IGT_7751 -> IGT_7752
  * Linux: xe-928-2c2957bb1a0058ea85ca21d62762aa54e28aff54 -> xe-pw-130989v1

  IGT_7751: 86173d01d4d3644237f781dc5f9890bd26c988de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7752: 7752
  xe-928-2c2957bb1a0058ea85ca21d62762aa54e28aff54: 2c2957bb1a0058ea85ca21d62762aa54e28aff54
  xe-pw-130989v1: 130989v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130989v1/index.html

--===============1612904915889194607==
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
<tr><td><b>Series:</b></td><td>drm/xe: Remove unused xe_bo-&gt;props struct</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130989/">https://patchwork.freedesktop.org/series/130989/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130989v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130989v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-928-2c2957bb1a0058ea85ca21d62762aa54e28aff54_BAT -&gt; xe-pw-130989v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7751 -&gt; IGT_7752</li>
<li>Linux: xe-928-2c2957bb1a0058ea85ca21d62762aa54e28aff54 -&gt; xe-pw-130989v1</li>
</ul>
<p>IGT_7751: 86173d01d4d3644237f781dc5f9890bd26c988de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7752: 7752<br />
  xe-928-2c2957bb1a0058ea85ca21d62762aa54e28aff54: 2c2957bb1a0058ea85ca21d62762aa54e28aff54<br />
  xe-pw-130989v1: 130989v1</p>

</body>
</html>

--===============1612904915889194607==--
