Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3C7C54E58
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 01:42:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C096410E277;
	Tue, 19 Mar 2024 01:42:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA6710E277;
 Tue, 19 Mar 2024 01:42:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5106794230135239397=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/3=5D_d?=
 =?utf-8?q?rm/xe/queue=3A_fix_engine=5Fclass_bounds_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Mar 2024 01:42:53 -0000
Message-ID: <171081257325.900422.10655080888214659813@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240318180532.57522-4-matthew.auld@intel.com>
In-Reply-To: <20240318180532.57522-4-matthew.auld@intel.com>
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

--===============5106794230135239397==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] drm/xe/queue: fix engine_class bounds check
URL   : https://patchwork.freedesktop.org/series/131280/
State : success

== Summary ==

CI Bug Log - changes from xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6_BAT -> xe-pw-131280v1_BAT
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

  * Linux: xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6 -> xe-pw-131280v1

  IGT_7769: 7769
  xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6: ce8cc731d53f9197a853b0d00386d7835f2b80e6
  xe-pw-131280v1: 131280v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131280v1/index.html

--===============5106794230135239397==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] drm/xe/queue: fix engine_class bounds check</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131280/">https://patchwork.freedesktop.org/series/131280/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131280v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131280v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6_BAT -&gt; xe-pw-131280v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6 -&gt; xe-pw-131280v1</li>
</ul>
<p>IGT_7769: 7769<br />
  xe-952-ce8cc731d53f9197a853b0d00386d7835f2b80e6: ce8cc731d53f9197a853b0d00386d7835f2b80e6<br />
  xe-pw-131280v1: 131280v1</p>

</body>
</html>

--===============5106794230135239397==--
