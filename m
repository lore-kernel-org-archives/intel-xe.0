Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73217CD6E60
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 17:21:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1435E10F404;
	Tue,  2 Jun 2026 17:21:18 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1BA10F404;
 Tue,  2 Jun 2026 17:21:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1645776766778008711=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_fix_LR_TLB_invalidation_gap?=
 =?utf-8?q?s_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 02 Jun 2026 17:21:17 -0000
Message-ID: <178042087724.36705.4183541284154686020@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260602163535.3124689-1-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20260602163535.3124689-1-tilak.tirumalesh.tangudu@intel.com>
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

--===============1645776766778008711==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: fix LR TLB invalidation gaps (rev4)
URL   : https://patchwork.freedesktop.org/series/167262/
State : success

== Summary ==

CI Bug Log - changes from xe-5179-5ffc4d14699b2de05ebbaa8d838f83dcf5da2b6a_BAT -> xe-pw-167262v4_BAT
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

  * Linux: xe-5179-5ffc4d14699b2de05ebbaa8d838f83dcf5da2b6a -> xe-pw-167262v4

  IGT_8946: 8946
  xe-5179-5ffc4d14699b2de05ebbaa8d838f83dcf5da2b6a: 5ffc4d14699b2de05ebbaa8d838f83dcf5da2b6a
  xe-pw-167262v4: 167262v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167262v4/index.html

--===============1645776766778008711==
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
<tr><td><b>Series:</b></td><td>fix LR TLB invalidation gaps (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167262/">https://patchwork.freedesktop.org/series/167262/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167262v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167262v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5179-5ffc4d14699b2de05ebbaa8d838f83dcf5da2b6a_BAT -&gt; xe-pw-167262v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5179-5ffc4d14699b2de05ebbaa8d838f83dcf5da2b6a -&gt; xe-pw-167262v4</li>
</ul>
<p>IGT_8946: 8946<br />
  xe-5179-5ffc4d14699b2de05ebbaa8d838f83dcf5da2b6a: 5ffc4d14699b2de05ebbaa8d838f83dcf5da2b6a<br />
  xe-pw-167262v4: 167262v4</p>

</body>
</html>

--===============1645776766778008711==--
