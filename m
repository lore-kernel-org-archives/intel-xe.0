Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD45C5478C
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 05:22:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B43C10EAF1;
	Fri,  1 Mar 2024 05:22:24 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE2C10EAF1;
 Fri,  1 Mar 2024 05:22:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4167393258595453002=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Fix_ref_counting_leak_?=
 =?utf-8?q?on_page_fault?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 Mar 2024 05:22:22 -0000
Message-ID: <170927054297.434929.13625116065786625110@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240301041036.238471-1-matthew.brost@intel.com>
In-Reply-To: <20240301041036.238471-1-matthew.brost@intel.com>
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

--===============4167393258595453002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix ref counting leak on page fault
URL   : https://patchwork.freedesktop.org/series/130590/
State : success

== Summary ==

CI Bug Log - changes from xe-881-c1763f7b4fa52f922a0b507246013779acc58611_BAT -> xe-pw-130590v1_BAT
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

  * Linux: xe-881-c1763f7b4fa52f922a0b507246013779acc58611 -> xe-pw-130590v1

  IGT_7738: 7738
  xe-881-c1763f7b4fa52f922a0b507246013779acc58611: c1763f7b4fa52f922a0b507246013779acc58611
  xe-pw-130590v1: 130590v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130590v1/index.html

--===============4167393258595453002==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix ref counting leak on page fault</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130590/">https://patchwork.freedesktop.org/series/130590/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130590v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130590v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-881-c1763f7b4fa52f922a0b507246013779acc58611_BAT -&gt; xe-pw-130590v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-881-c1763f7b4fa52f922a0b507246013779acc58611 -&gt; xe-pw-130590v1</li>
</ul>
<p>IGT_7738: 7738<br />
  xe-881-c1763f7b4fa52f922a0b507246013779acc58611: c1763f7b4fa52f922a0b507246013779acc58611<br />
  xe-pw-130590v1: 130590v1</p>

</body>
</html>

--===============4167393258595453002==--
