Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EDBCF6491
	for <intel-xe@archiver.kernel.org>; Sat, 28 Sep 2024 15:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838C010E17D;
	Sat, 28 Sep 2024 15:17:32 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3990910E08E;
 Sat, 28 Sep 2024 15:17:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0566105691126345470=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915/backlight=3A_Remove_a_u?=
 =?utf-8?q?seless_kstrdup=5Fconst=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 28 Sep 2024 15:17:31 -0000
Message-ID: <172753665122.1131441.14260681274413525710@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <3b3d3af8739e3016f3f80df0aa85b3c06230a385.1727533674.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <3b3d3af8739e3016f3f80df0aa85b3c06230a385.1727533674.git.christophe.jaillet@wanadoo.fr>
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

--===============0566105691126345470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/backlight: Remove a useless kstrdup_const()
URL   : https://patchwork.freedesktop.org/series/139245/
State : success

== Summary ==

CI Bug Log - changes from xe-1986-26055f21c653a310af74417fe81466cb3ede668c_BAT -> xe-pw-139245v1_BAT
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

  * Linux: xe-1986-26055f21c653a310af74417fe81466cb3ede668c -> xe-pw-139245v1

  IGT_8036: 5aa244179b574e949a07ab1c7494033081735718 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1986-26055f21c653a310af74417fe81466cb3ede668c: 26055f21c653a310af74417fe81466cb3ede668c
  xe-pw-139245v1: 139245v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139245v1/index.html

--===============0566105691126345470==
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
<tr><td><b>Series:</b></td><td>drm/i915/backlight: Remove a useless kstrdup_const()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139245/">https://patchwork.freedesktop.org/series/139245/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139245v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139245v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1986-26055f21c653a310af74417fe81466cb3ede668c_BAT -&gt; xe-pw-139245v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1986-26055f21c653a310af74417fe81466cb3ede668c -&gt; xe-pw-139245v1</li>
</ul>
<p>IGT_8036: 5aa244179b574e949a07ab1c7494033081735718 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1986-26055f21c653a310af74417fe81466cb3ede668c: 26055f21c653a310af74417fe81466cb3ede668c<br />
  xe-pw-139245v1: 139245v1</p>

</body>
</html>

--===============0566105691126345470==--
