Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF39C43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 14:11:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B27510F5E6;
	Thu,  9 Jul 2026 14:11:30 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6D810E050;
 Thu,  9 Jul 2026 14:11:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7485403575160825485=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_gpu/buddy=3A_bail_out_of_tr?=
 =?utf-8?q?y=5Fharder_when_alignment_cannot_be_honoured_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Jul 2026 14:11:29 -0000
Message-ID: <178360628917.171270.15532109684493019079@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260709131050.1022759-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20260709131050.1022759-1-Arunpravin.PaneerSelvam@amd.com>
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

--===============7485403575160825485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gpu/buddy: bail out of try_harder when alignment cannot be honoured (rev4)
URL   : https://patchwork.freedesktop.org/series/168789/
State : success

== Summary ==

CI Bug Log - changes from xe-5374-b07a6abb8591e7c1b9ddaaf36cf3b130408dcaaa_BAT -> xe-pw-168789v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5374-b07a6abb8591e7c1b9ddaaf36cf3b130408dcaaa -> xe-pw-168789v4

  IGT_8995: 8995
  xe-5374-b07a6abb8591e7c1b9ddaaf36cf3b130408dcaaa: b07a6abb8591e7c1b9ddaaf36cf3b130408dcaaa
  xe-pw-168789v4: 168789v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168789v4/index.html

--===============7485403575160825485==
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
<tr><td><b>Series:</b></td><td>gpu/buddy: bail out of try_harder when alignment cannot be honoured (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168789/">https://patchwork.freedesktop.org/series/168789/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168789v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168789v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5374-b07a6abb8591e7c1b9ddaaf36cf3b130408dcaaa_BAT -&gt; xe-pw-168789v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5374-b07a6abb8591e7c1b9ddaaf36cf3b130408dcaaa -&gt; xe-pw-168789v4</li>
</ul>
<p>IGT_8995: 8995<br />
  xe-5374-b07a6abb8591e7c1b9ddaaf36cf3b130408dcaaa: b07a6abb8591e7c1b9ddaaf36cf3b130408dcaaa<br />
  xe-pw-168789v4: 168789v4</p>

</body>
</html>

--===============7485403575160825485==--
