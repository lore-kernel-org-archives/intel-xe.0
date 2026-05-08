Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E3CCD342F
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 23:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAC410E386;
	Fri,  8 May 2026 23:04:58 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB2C10E36B;
 Fri,  8 May 2026 23:04:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1565337502824127816=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Fix_MCR_inconsistencies_in_?=
 =?utf-8?q?RTP_tables_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 May 2026 23:04:57 -0000
Message-ID: <177828149742.53705.10301513261773644643@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
In-Reply-To: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
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

--===============1565337502824127816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix MCR inconsistencies in RTP tables (rev2)
URL   : https://patchwork.freedesktop.org/series/160223/
State : success

== Summary ==

CI Bug Log - changes from xe-5031-18d2011d95002966c64980ab06f36ee9211d496c_BAT -> xe-pw-160223v2_BAT
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

  * IGT: IGT_8900 -> IGT_8901
  * Linux: xe-5031-18d2011d95002966c64980ab06f36ee9211d496c -> xe-pw-160223v2

  IGT_8900: 529869b7d0fba64ed67819111079ff269bc8159a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8901: 0a391e6b79fd6c6c7a55f75ea4769f31529821c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5031-18d2011d95002966c64980ab06f36ee9211d496c: 18d2011d95002966c64980ab06f36ee9211d496c
  xe-pw-160223v2: 160223v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160223v2/index.html

--===============1565337502824127816==
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
<tr><td><b>Series:</b></td><td>Fix MCR inconsistencies in RTP tables (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160223/">https://patchwork.freedesktop.org/series/160223/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160223v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160223v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5031-18d2011d95002966c64980ab06f36ee9211d496c_BAT -&gt; xe-pw-160223v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8900 -&gt; IGT_8901</li>
<li>Linux: xe-5031-18d2011d95002966c64980ab06f36ee9211d496c -&gt; xe-pw-160223v2</li>
</ul>
<p>IGT_8900: 529869b7d0fba64ed67819111079ff269bc8159a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8901: 0a391e6b79fd6c6c7a55f75ea4769f31529821c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5031-18d2011d95002966c64980ab06f36ee9211d496c: 18d2011d95002966c64980ab06f36ee9211d496c<br />
  xe-pw-160223v2: 160223v2</p>

</body>
</html>

--===============1565337502824127816==--
