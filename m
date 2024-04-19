Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91BCC04FF6
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 10:12:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA8B10F0B6;
	Fri, 19 Apr 2024 10:12:30 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC5F10F124;
 Fri, 19 Apr 2024 10:12:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6862581218768423383=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Support_PCIe_FLR_=28re?=
 =?utf-8?q?v4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aravind Iddamsetty" <aravind.iddamsetty@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Apr 2024 10:12:28 -0000
Message-ID: <171352154844.1519312.106790234527608963@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240419085826.263743-1-aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20240419085826.263743-1-aravind.iddamsetty@linux.intel.com>
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

--===============6862581218768423383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Support PCIe FLR (rev4)
URL   : https://patchwork.freedesktop.org/series/131366/
State : success

== Summary ==

CI Bug Log - changes from xe-1121-1f816172a689b95011a1c1cfe952ac6ec32d3ca3_BAT -> xe-pw-131366v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-pvc-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1121-1f816172a689b95011a1c1cfe952ac6ec32d3ca3 -> xe-pw-131366v4

  IGT_7814: 7814
  xe-1121-1f816172a689b95011a1c1cfe952ac6ec32d3ca3: 1f816172a689b95011a1c1cfe952ac6ec32d3ca3
  xe-pw-131366v4: 131366v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131366v4/index.html

--===============6862581218768423383==
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
<tr><td><b>Series:</b></td><td>drm/xe: Support PCIe FLR (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131366/">https://patchwork.freedesktop.org/series/131366/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131366v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131366v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1121-1f816172a689b95011a1c1cfe952ac6ec32d3ca3_BAT -&gt; xe-pw-131366v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1121-1f816172a689b95011a1c1cfe952ac6ec32d3ca3 -&gt; xe-pw-131366v4</li>
</ul>
<p>IGT_7814: 7814<br />
  xe-1121-1f816172a689b95011a1c1cfe952ac6ec32d3ca3: 1f816172a689b95011a1c1cfe952ac6ec32d3ca3<br />
  xe-pw-131366v4: 131366v4</p>

</body>
</html>

--===============6862581218768423383==--
