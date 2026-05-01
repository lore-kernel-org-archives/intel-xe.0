Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F328DCCFA13
	for <intel-xe@archiver.kernel.org>; Fri,  1 May 2026 23:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF04410E571;
	Fri,  1 May 2026 23:28:03 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB9610E571;
 Fri,  1 May 2026 23:28:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8521177551464743957=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/ttm=3A_Fix_GPU_MM_stats?=
 =?utf-8?q?_during_pool_shrinking?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 May 2026 23:28:02 -0000
Message-ID: <177767808229.31645.15983938128589325931@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260501223003.2648450-1-matthew.brost@intel.com>
In-Reply-To: <20260501223003.2648450-1-matthew.brost@intel.com>
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

--===============8521177551464743957==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/ttm: Fix GPU MM stats during pool shrinking
URL   : https://patchwork.freedesktop.org/series/165861/
State : success

== Summary ==

CI Bug Log - changes from xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad_BAT -> xe-pw-165861v1_BAT
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

  * Linux: xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad -> xe-pw-165861v1

  IGT_8881: aa5853ef5b379b1e4558218c21ef4caeae112184 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad: 03712864f7a8ffcdd43fe3adc4cfe687f77e93ad
  xe-pw-165861v1: 165861v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165861v1/index.html

--===============8521177551464743957==
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
<tr><td><b>Series:</b></td><td>drm/ttm: Fix GPU MM stats during pool shrinking</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165861/">https://patchwork.freedesktop.org/series/165861/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165861v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165861v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad_BAT -&gt; xe-pw-165861v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad -&gt; xe-pw-165861v1</li>
</ul>
<p>IGT_8881: aa5853ef5b379b1e4558218c21ef4caeae112184 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad: 03712864f7a8ffcdd43fe3adc4cfe687f77e93ad<br />
  xe-pw-165861v1: 165861v1</p>

</body>
</html>

--===============8521177551464743957==--
