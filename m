Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C6FC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 23:59:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C362310E030;
	Mon, 15 Apr 2024 23:59:09 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CC210E030;
 Mon, 15 Apr 2024 23:59:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1297669505356871806=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5Bv5=2C1/4?=
 =?utf-8?q?=5D_drm/xe/lrc=3A_Add_xe_lrc_ring_tail_function_definitions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 23:59:08 -0000
Message-ID: <171322554885.1424597.3320384740822262898@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240415184608.2918959-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240415184608.2918959-1-jonathan.cavitt@intel.com>
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

--===============1297669505356871806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v5,1/4] drm/xe/lrc: Add xe lrc ring tail function definitions
URL   : https://patchwork.freedesktop.org/series/132464/
State : success

== Summary ==

CI Bug Log - changes from xe-1094-7bc330055f5c2924b42e389887691fea3f401a45_BAT -> xe-pw-132464v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1094-7bc330055f5c2924b42e389887691fea3f401a45 -> xe-pw-132464v1

  IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1094-7bc330055f5c2924b42e389887691fea3f401a45: 7bc330055f5c2924b42e389887691fea3f401a45
  xe-pw-132464v1: 132464v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132464v1/index.html

--===============1297669505356871806==
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
<tr><td><b>Series:</b></td><td>series starting with [v5,1/4] drm/xe/lrc: Add xe lrc ring tail function definitions</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132464/">https://patchwork.freedesktop.org/series/132464/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132464v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132464v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1094-7bc330055f5c2924b42e389887691fea3f401a45_BAT -&gt; xe-pw-132464v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1094-7bc330055f5c2924b42e389887691fea3f401a45 -&gt; xe-pw-132464v1</li>
</ul>
<p>IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1094-7bc330055f5c2924b42e389887691fea3f401a45: 7bc330055f5c2924b42e389887691fea3f401a45<br />
  xe-pw-132464v1: 132464v1</p>

</body>
</html>

--===============1297669505356871806==--
