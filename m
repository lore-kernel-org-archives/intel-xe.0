Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9048FC5475B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 07:54:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B37C10EBBF;
	Wed,  6 Mar 2024 07:54:05 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B9B10EBBF;
 Wed,  6 Mar 2024 07:54:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8430074765229969409=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_TTM_unlockable_restartable_LRU_l?=
 =?utf-8?q?ist_iteration_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Mar 2024 07:54:03 -0000
Message-ID: <170971164388.524258.2559879201084283545@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240306070125.27071-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240306070125.27071-1-thomas.hellstrom@linux.intel.com>
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

--===============8430074765229969409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: TTM unlockable restartable LRU list iteration (rev4)
URL   : https://patchwork.freedesktop.org/series/130000/
State : success

== Summary ==

CI Bug Log - changes from xe-905-dd08fd912fdc1b72984a39852fdbee49b97b8ce4_BAT -> xe-pw-130000v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-dg2-oem2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7746 -> IGT_7747
  * Linux: xe-905-dd08fd912fdc1b72984a39852fdbee49b97b8ce4 -> xe-pw-130000v4

  IGT_7746: 7746
  IGT_7747: 7747
  xe-905-dd08fd912fdc1b72984a39852fdbee49b97b8ce4: dd08fd912fdc1b72984a39852fdbee49b97b8ce4
  xe-pw-130000v4: 130000v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130000v4/index.html

--===============8430074765229969409==
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
<tr><td><b>Series:</b></td><td>TTM unlockable restartable LRU list iteration (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130000/">https://patchwork.freedesktop.org/series/130000/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130000v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130000v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-905-dd08fd912fdc1b72984a39852fdbee49b97b8ce4_BAT -&gt; xe-pw-130000v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7746 -&gt; IGT_7747</li>
<li>Linux: xe-905-dd08fd912fdc1b72984a39852fdbee49b97b8ce4 -&gt; xe-pw-130000v4</li>
</ul>
<p>IGT_7746: 7746<br />
  IGT_7747: 7747<br />
  xe-905-dd08fd912fdc1b72984a39852fdbee49b97b8ce4: dd08fd912fdc1b72984a39852fdbee49b97b8ce4<br />
  xe-pw-130000v4: 130000v4</p>

</body>
</html>

--===============8430074765229969409==--
