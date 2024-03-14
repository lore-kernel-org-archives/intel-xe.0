Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F938C54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 17:31:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81CB10FC3B;
	Thu, 14 Mar 2024 17:31:20 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728BE10FC3C;
 Thu, 14 Mar 2024 17:31:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5592014047746177808=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/guc=3A_Don=27t_support_ol?=
 =?utf-8?q?der_GuC_70=2Ex_releases_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Mar 2024 17:31:19 -0000
Message-ID: <171043747946.753906.8613755683602779455@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240304162616.824884-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240304162616.824884-1-daniele.ceraolospurio@intel.com>
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

--===============5592014047746177808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Don't support older GuC 70.x releases (rev2)
URL   : https://patchwork.freedesktop.org/series/130677/
State : success

== Summary ==

CI Bug Log - changes from xe-941-6ef6a88b113169e4637be283b2514cfed22f8d99_BAT -> xe-pw-130677v2_BAT
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

  * IGT: IGT_7764 -> IGT_7765
  * Linux: xe-941-6ef6a88b113169e4637be283b2514cfed22f8d99 -> xe-pw-130677v2

  IGT_7764: 7764
  IGT_7765: 67615901aedcc79d8d1523c6484c67c11ba0e316 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-941-6ef6a88b113169e4637be283b2514cfed22f8d99: 6ef6a88b113169e4637be283b2514cfed22f8d99
  xe-pw-130677v2: 130677v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130677v2/index.html

--===============5592014047746177808==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Don&#x27;t support older GuC 70.x releases (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130677/">https://patchwork.freedesktop.org/series/130677/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130677v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130677v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-941-6ef6a88b113169e4637be283b2514cfed22f8d99_BAT -&gt; xe-pw-130677v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7764 -&gt; IGT_7765</li>
<li>Linux: xe-941-6ef6a88b113169e4637be283b2514cfed22f8d99 -&gt; xe-pw-130677v2</li>
</ul>
<p>IGT_7764: 7764<br />
  IGT_7765: 67615901aedcc79d8d1523c6484c67c11ba0e316 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-941-6ef6a88b113169e4637be283b2514cfed22f8d99: 6ef6a88b113169e4637be283b2514cfed22f8d99<br />
  xe-pw-130677v2: 130677v2</p>

</body>
</html>

--===============5592014047746177808==--
