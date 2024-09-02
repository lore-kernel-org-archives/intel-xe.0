Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16ADDCA0ED3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 17:54:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B749E10E392;
	Mon,  2 Sep 2024 17:54:32 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB1B10E392;
 Mon,  2 Sep 2024 17:54:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7538999164055680171=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/bmg=3A_improve_cache_flus?=
 =?utf-8?q?hing_behaviour?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Sep 2024 17:54:30 -0000
Message-ID: <172529967089.907974.11877788354255620259@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240902153744.63456-2-matthew.auld@intel.com>
In-Reply-To: <20240902153744.63456-2-matthew.auld@intel.com>
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

--===============7538999164055680171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/bmg: improve cache flushing behaviour
URL   : https://patchwork.freedesktop.org/series/138102/
State : success

== Summary ==

CI Bug Log - changes from xe-1878-f68a30b6b56c006ab1d6bca3b4ccf7aed1b2743e_BAT -> xe-pw-138102v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-dg2-oem2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1878-f68a30b6b56c006ab1d6bca3b4ccf7aed1b2743e -> xe-pw-138102v1

  IGT_8001: d3a77fc98e89cc94b03be2b0903d44f83480b8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1878-f68a30b6b56c006ab1d6bca3b4ccf7aed1b2743e: f68a30b6b56c006ab1d6bca3b4ccf7aed1b2743e
  xe-pw-138102v1: 138102v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138102v1/index.html

--===============7538999164055680171==
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
<tr><td><b>Series:</b></td><td>drm/xe/bmg: improve cache flushing behaviour</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138102/">https://patchwork.freedesktop.org/series/138102/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138102v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138102v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1878-f68a30b6b56c006ab1d6bca3b4ccf7aed1b2743e_BAT -&gt; xe-pw-138102v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1878-f68a30b6b56c006ab1d6bca3b4ccf7aed1b2743e -&gt; xe-pw-138102v1</li>
</ul>
<p>IGT_8001: d3a77fc98e89cc94b03be2b0903d44f83480b8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1878-f68a30b6b56c006ab1d6bca3b4ccf7aed1b2743e: f68a30b6b56c006ab1d6bca3b4ccf7aed1b2743e<br />
  xe-pw-138102v1: 138102v1</p>

</body>
</html>

--===============7538999164055680171==--
