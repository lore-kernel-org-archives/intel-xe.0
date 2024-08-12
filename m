Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9274DC52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 18:09:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4C010E267;
	Mon, 12 Aug 2024 18:09:32 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABBF10E267;
 Mon, 12 Aug 2024 18:09:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2147989313368313825=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/migrate=3A_Parameterize_c?=
 =?utf-8?q?cs_and_bo_data_clear_in_xe=5Fmigrate=5Fclear=28=29_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Aug 2024 18:09:31 -0000
Message-ID: <172348617111.595846.15590855446850850238@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240809220347.25330-1-nirmoy.das@intel.com>
In-Reply-To: <20240809220347.25330-1-nirmoy.das@intel.com>
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

--===============2147989313368313825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/migrate: Parameterize ccs and bo data clear in xe_migrate_clear() (rev3)
URL   : https://patchwork.freedesktop.org/series/137107/
State : success

== Summary ==

CI Bug Log - changes from xe-1754-0c87d5327ba2a478a47e928687334a97b5d02697_BAT -> xe-pw-137107v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1754-0c87d5327ba2a478a47e928687334a97b5d02697 -> xe-pw-137107v3

  IGT_7966: f16c5f500adc5fa41bd52a3ef2a84165da4fb596 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1754-0c87d5327ba2a478a47e928687334a97b5d02697: 0c87d5327ba2a478a47e928687334a97b5d02697
  xe-pw-137107v3: 137107v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137107v3/index.html

--===============2147989313368313825==
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
<tr><td><b>Series:</b></td><td>drm/xe/migrate: Parameterize ccs and bo data clear in xe_migrate_clear() (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137107/">https://patchwork.freedesktop.org/series/137107/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137107v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137107v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1754-0c87d5327ba2a478a47e928687334a97b5d02697_BAT -&gt; xe-pw-137107v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1754-0c87d5327ba2a478a47e928687334a97b5d02697 -&gt; xe-pw-137107v3</li>
</ul>
<p>IGT_7966: f16c5f500adc5fa41bd52a3ef2a84165da4fb596 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1754-0c87d5327ba2a478a47e928687334a97b5d02697: 0c87d5327ba2a478a47e928687334a97b5d02697<br />
  xe-pw-137107v3: 137107v3</p>

</body>
</html>

--===============2147989313368313825==--
