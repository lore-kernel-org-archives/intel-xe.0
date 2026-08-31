Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6308AC624A4
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 13:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCD010E263;
	Mon, 31 Aug 2026 13:20:53 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BC710E79F;
 Mon, 31 Aug 2026 13:20:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5628811613206336853=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Report_GT_TDR_and?=
 =?utf-8?q?_VM_rebind_faults_using_SIGID_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Yadav, Arvind" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 31 Aug 2026 13:20:52 -0000
Message-ID: <178818245248.101572.9048493304863889019@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260831080507.2364687-1-arvind.yadav@intel.com>
In-Reply-To: <20260831080507.2364687-1-arvind.yadav@intel.com>
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

--===============5628811613206336853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Report GT TDR and VM rebind faults using SIGID (rev5)
URL   : https://patchwork.freedesktop.org/series/171571/
State : success

== Summary ==

CI Bug Log - changes from xe-5661-2ba2b8cd4220574995b91c5fe2dbf61bfaf05a89_BAT -> xe-pw-171571v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 11)
------------------------------

  Missing    (2): bat-wcl-2 bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5661-2ba2b8cd4220574995b91c5fe2dbf61bfaf05a89 -> xe-pw-171571v5

  IGT_9078: 9078
  xe-5661-2ba2b8cd4220574995b91c5fe2dbf61bfaf05a89: 2ba2b8cd4220574995b91c5fe2dbf61bfaf05a89
  xe-pw-171571v5: 171571v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171571v5/index.html

--===============5628811613206336853==
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
<tr><td><b>Series:</b></td><td>drm/xe: Report GT TDR and VM rebind faults using SIGID (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171571/">https://patchwork.freedesktop.org/series/171571/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171571v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171571v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5661-2ba2b8cd4220574995b91c5fe2dbf61bfaf05a89_BAT -&gt; xe-pw-171571v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 11)</h2>
<p>Missing    (2): bat-wcl-2 bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5661-2ba2b8cd4220574995b91c5fe2dbf61bfaf05a89 -&gt; xe-pw-171571v5</li>
</ul>
<p>IGT_9078: 9078<br />
  xe-5661-2ba2b8cd4220574995b91c5fe2dbf61bfaf05a89: 2ba2b8cd4220574995b91c5fe2dbf61bfaf05a89<br />
  xe-pw-171571v5: 171571v5</p>

</body>
</html>

--===============5628811613206336853==--
