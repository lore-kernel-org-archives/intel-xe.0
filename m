Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0375DC4450A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 11:48:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B9510F2C0;
	Thu, 16 Jul 2026 11:48:41 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1AA10F2BE;
 Thu, 16 Jul 2026 11:48:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3479627729332883732=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_memory_page_offlining_s?=
 =?utf-8?q?upport_=28rev15=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Jul 2026 11:48:41 -0000
Message-ID: <178420252112.195794.16523831774262976503@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260716103949.1554216-13-tejas.upadhyay@intel.com>
In-Reply-To: <20260716103949.1554216-13-tejas.upadhyay@intel.com>
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

--===============3479627729332883732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add memory page offlining support (rev15)
URL   : https://patchwork.freedesktop.org/series/161473/
State : success

== Summary ==

CI Bug Log - changes from xe-5417-fcaba3bc017906059b910ece3f83185e93010581_BAT -> xe-pw-161473v15_BAT
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

  * IGT: IGT_9007 -> IGT_9008
  * Linux: xe-5417-fcaba3bc017906059b910ece3f83185e93010581 -> xe-pw-161473v15

  IGT_9007: 9007
  IGT_9008: 9008
  xe-5417-fcaba3bc017906059b910ece3f83185e93010581: fcaba3bc017906059b910ece3f83185e93010581
  xe-pw-161473v15: 161473v15

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v15/index.html

--===============3479627729332883732==
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
<tr><td><b>Series:</b></td><td>Add memory page offlining support (rev15)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161473/">https://patchwork.freedesktop.org/series/161473/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v15/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v15/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5417-fcaba3bc017906059b910ece3f83185e93010581_BAT -&gt; xe-pw-161473v15_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9007 -&gt; IGT_9008</li>
<li>Linux: xe-5417-fcaba3bc017906059b910ece3f83185e93010581 -&gt; xe-pw-161473v15</li>
</ul>
<p>IGT_9007: 9007<br />
  IGT_9008: 9008<br />
  xe-5417-fcaba3bc017906059b910ece3f83185e93010581: fcaba3bc017906059b910ece3f83185e93010581<br />
  xe-pw-161473v15: 161473v15</p>

</body>
</html>

--===============3479627729332883732==--
