Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D90C71157
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 16:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BED10E786;
	Tue, 17 Jun 2025 16:34:28 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538B410E771;
 Tue, 17 Jun 2025 16:34:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2720166768234847303=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_mtd=3A_add_driver_for_Intel?=
 =?utf-8?q?_discrete_graphics_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexander Usyskin" <alexander.usyskin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Jun 2025 16:34:27 -0000
Message-ID: <175017806733.88664.3532215579382903337@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250617145159.3803852-1-alexander.usyskin@intel.com>
In-Reply-To: <20250617145159.3803852-1-alexander.usyskin@intel.com>
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

--===============2720166768234847303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: mtd: add driver for Intel discrete graphics (rev7)
URL   : https://patchwork.freedesktop.org/series/147661/
State : success

== Summary ==

CI Bug Log - changes from xe-3262-9b0a5c52b80dc57862c53abad32ddad241243bea_BAT -> xe-pw-147661v7_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3262-9b0a5c52b80dc57862c53abad32ddad241243bea -> xe-pw-147661v7

  IGT_8413: 8413
  xe-3262-9b0a5c52b80dc57862c53abad32ddad241243bea: 9b0a5c52b80dc57862c53abad32ddad241243bea
  xe-pw-147661v7: 147661v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147661v7/index.html

--===============2720166768234847303==
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
<tr><td><b>Series:</b></td><td>mtd: add driver for Intel discrete graphics (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147661/">https://patchwork.freedesktop.org/series/147661/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147661v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147661v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3262-9b0a5c52b80dc57862c53abad32ddad241243bea_BAT -&gt; xe-pw-147661v7_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3262-9b0a5c52b80dc57862c53abad32ddad241243bea -&gt; xe-pw-147661v7</li>
</ul>
<p>IGT_8413: 8413<br />
  xe-3262-9b0a5c52b80dc57862c53abad32ddad241243bea: 9b0a5c52b80dc57862c53abad32ddad241243bea<br />
  xe-pw-147661v7: 147661v7</p>

</body>
</html>

--===============2720166768234847303==--
