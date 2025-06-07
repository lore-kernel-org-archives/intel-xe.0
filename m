Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF87C5B543
	for <intel-xe@archiver.kernel.org>; Sat,  7 Jun 2025 15:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6F910E4E1;
	Sat,  7 Jun 2025 15:25:49 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F1410E4D4;
 Sat,  7 Jun 2025 15:25:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2928609033419222799=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe=3A_Don=27t_use_drm_?=
 =?utf-8?q?exec_locking_in_SVM_pagefaults_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 07 Jun 2025 15:25:48 -0000
Message-ID: <174930994884.57846.6588772153304626955@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603174012.2195759-1-matthew.brost@intel.com>
In-Reply-To: <20250603174012.2195759-1-matthew.brost@intel.com>
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

--===============2928609033419222799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Don't use drm exec locking in SVM pagefaults (rev2)
URL   : https://patchwork.freedesktop.org/series/149789/
State : success

== Summary ==

CI Bug Log - changes from xe-3202-832a676ed68901ea8c404d8602381cd8ca413e88_FULL -> xe-pw-149789v2_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (0 -> 0)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3202-832a676ed68901ea8c404d8602381cd8ca413e88 -> xe-pw-149789v2

  IGT_8397: 181d409e619a5eff49ede13f058343dbe8acb417 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3202-832a676ed68901ea8c404d8602381cd8ca413e88: 832a676ed68901ea8c404d8602381cd8ca413e88
  xe-pw-149789v2: 149789v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149789v2/index.html

--===============2928609033419222799==
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
<tr><td><b>Series:</b></td><td>drm/xe: Don&#x27;t use drm exec locking in SVM pagefaults (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149789/">https://patchwork.freedesktop.org/series/149789/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149789v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149789v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3202-832a676ed68901ea8c404d8602381cd8ca413e88_FULL -&gt; xe-pw-149789v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (0 -&gt; 0)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3202-832a676ed68901ea8c404d8602381cd8ca413e88 -&gt; xe-pw-149789v2</li>
</ul>
<p>IGT_8397: 181d409e619a5eff49ede13f058343dbe8acb417 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3202-832a676ed68901ea8c404d8602381cd8ca413e88: 832a676ed68901ea8c404d8602381cd8ca413e88<br />
  xe-pw-149789v2: 149789v2</p>

</body>
</html>

--===============2928609033419222799==--
