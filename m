Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55008C83030
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 09:42:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1045E10E7F7;
	Thu,  3 Jul 2025 09:42:10 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B5C10E1BC;
 Thu,  3 Jul 2025 09:42:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8686861229572720716=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Remove_unused_code_in_devco?=
 =?utf-8?q?redump=5Fsnapshot=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Jul 2025 09:42:08 -0000
Message-ID: <175153572875.131125.9735732807841336967@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250703083202.3462887-4-shuicheng.lin@intel.com>
In-Reply-To: <20250703083202.3462887-4-shuicheng.lin@intel.com>
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

--===============8686861229572720716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove unused code in devcoredump_snapshot()
URL   : https://patchwork.freedesktop.org/series/151111/
State : success

== Summary ==

CI Bug Log - changes from xe-3339-d04a54cd3b99001adbc4cd3305b44f9f3e658407_BAT -> xe-pw-151111v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8434 -> IGT_8436
  * Linux: xe-3339-d04a54cd3b99001adbc4cd3305b44f9f3e658407 -> xe-pw-151111v1

  IGT_8434: 5185b9527673518a418d575c3f58b5554e27f111 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8436: 3b7595f0e7f95de6d79e7ae6bb72e86b0a08a08c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3339-d04a54cd3b99001adbc4cd3305b44f9f3e658407: d04a54cd3b99001adbc4cd3305b44f9f3e658407
  xe-pw-151111v1: 151111v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151111v1/index.html

--===============8686861229572720716==
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
<tr><td><b>Series:</b></td><td>Remove unused code in devcoredump_snapshot()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151111/">https://patchwork.freedesktop.org/series/151111/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151111v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151111v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3339-d04a54cd3b99001adbc4cd3305b44f9f3e658407_BAT -&gt; xe-pw-151111v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8434 -&gt; IGT_8436</li>
<li>Linux: xe-3339-d04a54cd3b99001adbc4cd3305b44f9f3e658407 -&gt; xe-pw-151111v1</li>
</ul>
<p>IGT_8434: 5185b9527673518a418d575c3f58b5554e27f111 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8436: 3b7595f0e7f95de6d79e7ae6bb72e86b0a08a08c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3339-d04a54cd3b99001adbc4cd3305b44f9f3e658407: d04a54cd3b99001adbc4cd3305b44f9f3e658407<br />
  xe-pw-151111v1: 151111v1</p>

</body>
</html>

--===============8686861229572720716==--
