Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0E6D0D7BB
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 15:30:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D7410EB17;
	Fri, 11 Oct 2024 15:30:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3313610EB17;
 Fri, 11 Oct 2024 15:30:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8987642135375488346=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/xe=5Fsync=3A_initialise_u?=
 =?utf-8?q?fence=2Esignalled?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Oct 2024 15:30:56 -0000
Message-ID: <172866065620.1241138.4311083407338832722@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241011133633.388008-2-matthew.auld@intel.com>
In-Reply-To: <20241011133633.388008-2-matthew.auld@intel.com>
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

--===============8987642135375488346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_sync: initialise ufence.signalled
URL   : https://patchwork.freedesktop.org/series/139888/
State : success

== Summary ==

CI Bug Log - changes from xe-2049-20c57deec46e59d392ec6d4a23257f4bb5673982_BAT -> xe-pw-139888v1_BAT
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

  * Linux: xe-2049-20c57deec46e59d392ec6d4a23257f4bb5673982 -> xe-pw-139888v1

  IGT_8065: c727cc3fad56f16f1a9f35023ae5dd7111976fa3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2049-20c57deec46e59d392ec6d4a23257f4bb5673982: 20c57deec46e59d392ec6d4a23257f4bb5673982
  xe-pw-139888v1: 139888v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139888v1/index.html

--===============8987642135375488346==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_sync: initialise ufence.signalled</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139888/">https://patchwork.freedesktop.org/series/139888/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139888v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139888v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2049-20c57deec46e59d392ec6d4a23257f4bb5673982_BAT -&gt; xe-pw-139888v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2049-20c57deec46e59d392ec6d4a23257f4bb5673982 -&gt; xe-pw-139888v1</li>
</ul>
<p>IGT_8065: c727cc3fad56f16f1a9f35023ae5dd7111976fa3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2049-20c57deec46e59d392ec6d4a23257f4bb5673982: 20c57deec46e59d392ec6d4a23257f4bb5673982<br />
  xe-pw-139888v1: 139888v1</p>

</body>
</html>

--===============8987642135375488346==--
