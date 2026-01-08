Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FB1D14891
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 02:33:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003FB10E666;
	Thu,  8 Jan 2026 02:33:26 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174C410E666;
 Thu,  8 Jan 2026 02:33:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6004274140271544919=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Allow_compressibl?=
 =?utf-8?q?e_surfaces_to_be_1-way_coherent_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Jan 2026 02:33:26 -0000
Message-ID: <176783960608.134482.813549131397054243@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260108014257.398697-1-x.wang@intel.com>
In-Reply-To: <20260108014257.398697-1-x.wang@intel.com>
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

--===============6004274140271544919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Allow compressible surfaces to be 1-way coherent (rev5)
URL   : https://patchwork.freedesktop.org/series/157036/
State : success

== Summary ==

CI Bug Log - changes from xe-4343-25815d6185d3efe226238025baddf01299c4b070_BAT -> xe-pw-157036v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4343-25815d6185d3efe226238025baddf01299c4b070 -> xe-pw-157036v5

  IGT_8692: 8692
  xe-4343-25815d6185d3efe226238025baddf01299c4b070: 25815d6185d3efe226238025baddf01299c4b070
  xe-pw-157036v5: 157036v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v5/index.html

--===============6004274140271544919==
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
<tr><td><b>Series:</b></td><td>drm/xe: Allow compressible surfaces to be 1-way coherent (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157036/">https://patchwork.freedesktop.org/series/157036/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4343-25815d6185d3efe226238025baddf01299c4b070_BAT -&gt; xe-pw-157036v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4343-25815d6185d3efe226238025baddf01299c4b070 -&gt; xe-pw-157036v5</li>
</ul>
<p>IGT_8692: 8692<br />
  xe-4343-25815d6185d3efe226238025baddf01299c4b070: 25815d6185d3efe226238025baddf01299c4b070<br />
  xe-pw-157036v5: 157036v5</p>

</body>
</html>

--===============6004274140271544919==--
