Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B06C48286
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 05:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1131910E406;
	Tue,  6 Feb 2024 05:32:12 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B8010E404;
 Tue,  6 Feb 2024 05:32:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6944112311965209820=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Remove_TEST=5FVM=5FASY?=
 =?utf-8?q?NC=5FOPS=5FERROR?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Feb 2024 05:32:10 -0000
Message-ID: <170719753074.1040578.10772725366655367506@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240206045010.2981051-1-matthew.brost@intel.com>
In-Reply-To: <20240206045010.2981051-1-matthew.brost@intel.com>
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

--===============6944112311965209820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Remove TEST_VM_ASYNC_OPS_ERROR
URL   : https://patchwork.freedesktop.org/series/129562/
State : success

== Summary ==

CI Bug Log - changes from xe-735-21d1e1f2882868cae0ec32774f910d5675afeca2_BAT -> xe-pw-129562v1_BAT
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

  * Linux: xe-735-21d1e1f2882868cae0ec32774f910d5675afeca2 -> xe-pw-129562v1

  IGT_7704: 7704
  xe-735-21d1e1f2882868cae0ec32774f910d5675afeca2: 21d1e1f2882868cae0ec32774f910d5675afeca2
  xe-pw-129562v1: 129562v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129562v1/index.html

--===============6944112311965209820==
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
<tr><td><b>Series:</b></td><td>drm/xe: Remove TEST_VM_ASYNC_OPS_ERROR</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129562/">https://patchwork.freedesktop.org/series/129562/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129562v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129562v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-735-21d1e1f2882868cae0ec32774f910d5675afeca2_BAT -&gt; xe-pw-129562v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-735-21d1e1f2882868cae0ec32774f910d5675afeca2 -&gt; xe-pw-129562v1</li>
</ul>
<p>IGT_7704: 7704<br />
  xe-735-21d1e1f2882868cae0ec32774f910d5675afeca2: 21d1e1f2882868cae0ec32774f910d5675afeca2<br />
  xe-pw-129562v1: 129562v1</p>

</body>
</html>

--===============6944112311965209820==--
