Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EEFC61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 19:25:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B0B10E16F;
	Tue, 25 Aug 2026 19:25:20 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B00E10E16F;
 Tue, 25 Aug 2026 19:25:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5795948158287891790=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_CPER_logging_support_fo?=
 =?utf-8?q?r_CRI_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Aug 2026 19:25:19 -0000
Message-ID: <178768591910.84238.928714068718555760@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
In-Reply-To: <20260825175916.1103841-13-badal.nilawar@intel.com>
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

--===============5795948158287891790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add CPER logging support for CRI (rev2)
URL   : https://patchwork.freedesktop.org/series/169692/
State : success

== Summary ==

CI Bug Log - changes from xe-5642-15e2ba2fb6d25c03d89519aec46f8d5be3e118ad_BAT -> xe-pw-169692v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 11)
------------------------------

  Missing    (2): bat-bmg-2 bat-nvls-1 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9071 -> IGT_9074
  * Linux: xe-5642-15e2ba2fb6d25c03d89519aec46f8d5be3e118ad -> xe-pw-169692v2

  IGT_9071: 9071
  IGT_9074: 9074
  xe-5642-15e2ba2fb6d25c03d89519aec46f8d5be3e118ad: 15e2ba2fb6d25c03d89519aec46f8d5be3e118ad
  xe-pw-169692v2: 169692v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v2/index.html

--===============5795948158287891790==
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
<tr><td><b>Series:</b></td><td>Add CPER logging support for CRI (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169692/">https://patchwork.freedesktop.org/series/169692/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5642-15e2ba2fb6d25c03d89519aec46f8d5be3e118ad_BAT -&gt; xe-pw-169692v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 11)</h2>
<p>Missing    (2): bat-bmg-2 bat-nvls-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9071 -&gt; IGT_9074</li>
<li>Linux: xe-5642-15e2ba2fb6d25c03d89519aec46f8d5be3e118ad -&gt; xe-pw-169692v2</li>
</ul>
<p>IGT_9071: 9071<br />
  IGT_9074: 9074<br />
  xe-5642-15e2ba2fb6d25c03d89519aec46f8d5be3e118ad: 15e2ba2fb6d25c03d89519aec46f8d5be3e118ad<br />
  xe-pw-169692v2: 169692v2</p>

</body>
</html>

--===============5795948158287891790==--
