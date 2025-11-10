Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C12CCF9E3
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 20:55:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BA410E0D1;
	Mon, 10 Nov 2025 20:55:53 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7591D10E0D1;
 Mon, 10 Nov 2025 20:55:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0137192082861550094=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_treewide=3A_Introduce_=25pt?=
 =?utf-8?q?S_for_struct_timespec64_and_convert_users?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Nov 2025 20:55:52 -0000
Message-ID: <176280815247.35461.10185272667290554885@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251110184727.666591-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20251110184727.666591-1-andriy.shevchenko@linux.intel.com>
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

--===============0137192082861550094==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: treewide: Introduce %ptS for struct timespec64 and convert users
URL   : https://patchwork.freedesktop.org/series/157346/
State : success

== Summary ==

CI Bug Log - changes from xe-4083-f2aadc35c771894c27f9b742d2593a2e00bb6ebd_BAT -> xe-pw-157346v1_BAT
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

  * Linux: xe-4083-f2aadc35c771894c27f9b742d2593a2e00bb6ebd -> xe-pw-157346v1

  IGT_8618: 8618
  xe-4083-f2aadc35c771894c27f9b742d2593a2e00bb6ebd: f2aadc35c771894c27f9b742d2593a2e00bb6ebd
  xe-pw-157346v1: 157346v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157346v1/index.html

--===============0137192082861550094==
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
<tr><td><b>Series:</b></td><td>treewide: Introduce %ptS for struct timespec64 and convert users</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157346/">https://patchwork.freedesktop.org/series/157346/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157346v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157346v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4083-f2aadc35c771894c27f9b742d2593a2e00bb6ebd_BAT -&gt; xe-pw-157346v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4083-f2aadc35c771894c27f9b742d2593a2e00bb6ebd -&gt; xe-pw-157346v1</li>
</ul>
<p>IGT_8618: 8618<br />
  xe-4083-f2aadc35c771894c27f9b742d2593a2e00bb6ebd: f2aadc35c771894c27f9b742d2593a2e00bb6ebd<br />
  xe-pw-157346v1: 157346v1</p>

</body>
</html>

--===============0137192082861550094==--
