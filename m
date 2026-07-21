Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AFCC4452B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 18:43:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4902F10E3BF;
	Tue, 21 Jul 2026 18:43:19 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E15110E3BF;
 Tue, 21 Jul 2026 18:43:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5351583616495835628=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_mm/shmem=3A_add_shmem=5Fbackup=5Ffolio=28=29_helper?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Jul 2026 18:43:18 -0000
Message-ID: <178465939837.212456.7102852164200512155@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260721174723.1039395-1-matthew.brost@intel.com>
In-Reply-To: <20260721174723.1039395-1-matthew.brost@intel.com>
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

--===============5351583616495835628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] mm/shmem: add shmem_backup_folio() helper
URL   : https://patchwork.freedesktop.org/series/170838/
State : success

== Summary ==

CI Bug Log - changes from xe-5449-9c2361b13a219d0c445fb25e28354eca850da3a8_BAT -> xe-pw-170838v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5449-9c2361b13a219d0c445fb25e28354eca850da3a8 -> xe-pw-170838v1

  IGT_9017: 9017
  xe-5449-9c2361b13a219d0c445fb25e28354eca850da3a8: 9c2361b13a219d0c445fb25e28354eca850da3a8
  xe-pw-170838v1: 170838v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170838v1/index.html

--===============5351583616495835628==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] mm/shmem: add shmem_backup_folio() helper</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170838/">https://patchwork.freedesktop.org/series/170838/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170838v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170838v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5449-9c2361b13a219d0c445fb25e28354eca850da3a8_BAT -&gt; xe-pw-170838v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5449-9c2361b13a219d0c445fb25e28354eca850da3a8 -&gt; xe-pw-170838v1</li>
</ul>
<p>IGT_9017: 9017<br />
  xe-5449-9c2361b13a219d0c445fb25e28354eca850da3a8: 9c2361b13a219d0c445fb25e28354eca850da3a8<br />
  xe-pw-170838v1: 170838v1</p>

</body>
</html>

--===============5351583616495835628==--
