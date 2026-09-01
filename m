Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C5FC61DD6
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 07:20:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5083899E9;
	Tue,  1 Sep 2026 07:20:56 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFD010E3A5;
 Tue,  1 Sep 2026 07:20:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4939837761246633080=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Report_GT_TDR_and?=
 =?utf-8?q?_VM_rebind_faults_using_SIGID_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Yadav, Arvind" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Sep 2026 07:20:55 -0000
Message-ID: <178824725505.106089.8565512473321150426@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260901063059.2547247-1-arvind.yadav@intel.com>
In-Reply-To: <20260901063059.2547247-1-arvind.yadav@intel.com>
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

--===============4939837761246633080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Report GT TDR and VM rebind faults using SIGID (rev6)
URL   : https://patchwork.freedesktop.org/series/171571/
State : success

== Summary ==

CI Bug Log - changes from xe-5665-43b9a5e9d30783bb6f4d7dacdd1739184666940f_BAT -> xe-pw-171571v6_BAT
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

  * Linux: xe-5665-43b9a5e9d30783bb6f4d7dacdd1739184666940f -> xe-pw-171571v6

  IGT_9078: 9078
  xe-5665-43b9a5e9d30783bb6f4d7dacdd1739184666940f: 43b9a5e9d30783bb6f4d7dacdd1739184666940f
  xe-pw-171571v6: 171571v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171571v6/index.html

--===============4939837761246633080==
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
<tr><td><b>Series:</b></td><td>drm/xe: Report GT TDR and VM rebind faults using SIGID (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171571/">https://patchwork.freedesktop.org/series/171571/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171571v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171571v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5665-43b9a5e9d30783bb6f4d7dacdd1739184666940f_BAT -&gt; xe-pw-171571v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 11)</h2>
<p>Missing    (2): bat-bmg-2 bat-nvls-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5665-43b9a5e9d30783bb6f4d7dacdd1739184666940f -&gt; xe-pw-171571v6</li>
</ul>
<p>IGT_9078: 9078<br />
  xe-5665-43b9a5e9d30783bb6f4d7dacdd1739184666940f: 43b9a5e9d30783bb6f4d7dacdd1739184666940f<br />
  xe-pw-171571v6: 171571v6</p>

</body>
</html>

--===============4939837761246633080==--
