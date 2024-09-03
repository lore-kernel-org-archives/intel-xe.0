Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697F9CD13CF
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 10:37:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CB110E35D;
	Tue,  3 Sep 2024 10:37:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA6710E35D;
 Tue,  3 Sep 2024 10:37:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0896753297055124901=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Use_xe=5Fpm=5Fruntime?=
 =?utf-8?q?=5Fget_in_xe=5Fbo=5Fmove=28=29_if_reclaim-safe=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Sep 2024 10:37:57 -0000
Message-ID: <172535987716.910855.10590554308345203562@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240903094232.166342-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240903094232.166342-1-thomas.hellstrom@linux.intel.com>
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

--===============0896753297055124901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use xe_pm_runtime_get in xe_bo_move() if reclaim-safe.
URL   : https://patchwork.freedesktop.org/series/138131/
State : success

== Summary ==

CI Bug Log - changes from xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0_BAT -> xe-pw-138131v1_BAT
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

  * Linux: xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0 -> xe-pw-138131v1

  IGT_8001: d3a77fc98e89cc94b03be2b0903d44f83480b8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0: dd987a9431a336ddbfc6bfe9720f4783a6bc94b0
  xe-pw-138131v1: 138131v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/index.html

--===============0896753297055124901==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use xe_pm_runtime_get in xe_bo_move() if reclaim-safe.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138131/">https://patchwork.freedesktop.org/series/138131/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138131v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0_BAT -&gt; xe-pw-138131v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0 -&gt; xe-pw-138131v1</li>
</ul>
<p>IGT_8001: d3a77fc98e89cc94b03be2b0903d44f83480b8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1884-dd987a9431a336ddbfc6bfe9720f4783a6bc94b0: dd987a9431a336ddbfc6bfe9720f4783a6bc94b0<br />
  xe-pw-138131v1: 138131v1</p>

</body>
</html>

--===============0896753297055124901==--
