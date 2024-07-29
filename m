Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2ABC3DA61
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 17:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F5710E436;
	Mon, 29 Jul 2024 17:03:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9422410E42E;
 Mon, 29 Jul 2024 17:03:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1552874706957478014=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Update_page_fault_queue_size_cal?=
 =?utf-8?q?culation_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Jul 2024 17:03:03 -0000
Message-ID: <172227258360.425558.7165050569498645216@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1722269793.git.stuart.summers@intel.com>
In-Reply-To: <cover.1722269793.git.stuart.summers@intel.com>
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

--===============1552874706957478014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Update page fault queue size calculation (rev5)
URL   : https://patchwork.freedesktop.org/series/135915/
State : success

== Summary ==

CI Bug Log - changes from xe-1683-4b0d29cef51dec47a5892317ae3c6ff9a8ab8d17_BAT -> xe-pw-135915v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1683-4b0d29cef51dec47a5892317ae3c6ff9a8ab8d17 -> xe-pw-135915v5

  IGT_7941: 3acf6637792bab9a748de63330ef81f5e22eb174 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1683-4b0d29cef51dec47a5892317ae3c6ff9a8ab8d17: 4b0d29cef51dec47a5892317ae3c6ff9a8ab8d17
  xe-pw-135915v5: 135915v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v5/index.html

--===============1552874706957478014==
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
<tr><td><b>Series:</b></td><td>Update page fault queue size calculation (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135915/">https://patchwork.freedesktop.org/series/135915/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135915v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1683-4b0d29cef51dec47a5892317ae3c6ff9a8ab8d17_BAT -&gt; xe-pw-135915v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1683-4b0d29cef51dec47a5892317ae3c6ff9a8ab8d17 -&gt; xe-pw-135915v5</li>
</ul>
<p>IGT_7941: 3acf6637792bab9a748de63330ef81f5e22eb174 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1683-4b0d29cef51dec47a5892317ae3c6ff9a8ab8d17: 4b0d29cef51dec47a5892317ae3c6ff9a8ab8d17<br />
  xe-pw-135915v5: 135915v5</p>

</body>
</html>

--===============1552874706957478014==--
