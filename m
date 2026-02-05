Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06964EA794D
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 00:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FB210E78A;
	Thu,  5 Feb 2026 00:43:52 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D5010E78A;
 Thu,  5 Feb 2026 00:43:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2070505063528844692=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Add_bounds_check_?=
 =?utf-8?q?on_pat=5Findex_to_prevent_OOB_kernel_read_in_madvise_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Feb 2026 00:43:51 -0000
Message-ID: <177025223137.225549.12653919746980866714@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260203172045.1154546-1-jia.yao@intel.com>
In-Reply-To: <20260203172045.1154546-1-jia.yao@intel.com>
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

--===============2070505063528844692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add bounds check on pat_index to prevent OOB kernel read in madvise (rev4)
URL   : https://patchwork.freedesktop.org/series/161100/
State : success

== Summary ==

CI Bug Log - changes from xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3_BAT -> xe-pw-161100v4_BAT
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

  * Linux: xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3 -> xe-pw-161100v4

  IGT_8737: 8737
  xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3: 55e3e3aeecf80d9fd2536acd8ed785282be5a7b3
  xe-pw-161100v4: 161100v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161100v4/index.html

--===============2070505063528844692==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add bounds check on pat_index to prevent OOB kernel read in madvise (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161100/">https://patchwork.freedesktop.org/series/161100/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161100v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161100v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3_BAT -&gt; xe-pw-161100v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3 -&gt; xe-pw-161100v4</li>
</ul>
<p>IGT_8737: 8737<br />
  xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3: 55e3e3aeecf80d9fd2536acd8ed785282be5a7b3<br />
  xe-pw-161100v4: 161100v4</p>

</body>
</html>

--===============2070505063528844692==--
