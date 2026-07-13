Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F83C43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 03:43:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C45D10E53B;
	Mon, 13 Jul 2026 03:43:29 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB9C10E53A;
 Mon, 13 Jul 2026 03:43:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0323477590912757856=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_balance_exec_queu?=
 =?utf-8?q?e_suspend/resume_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Jul 2026 03:43:27 -0000
Message-ID: <178391420776.180334.15212383191101218996@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260713030005.2123322-8-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260713030005.2123322-8-niranjana.vishwanathapura@intel.com>
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

--===============0323477590912757856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: balance exec queue suspend/resume (rev6)
URL   : https://patchwork.freedesktop.org/series/169125/
State : success

== Summary ==

CI Bug Log - changes from xe-5389-67aa8ad5c4c59cd1a7c379ad70feec4c04caebaf_BAT -> xe-pw-169125v6_BAT
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

  * Linux: xe-5389-67aa8ad5c4c59cd1a7c379ad70feec4c04caebaf -> xe-pw-169125v6

  IGT_9002: 9002
  xe-5389-67aa8ad5c4c59cd1a7c379ad70feec4c04caebaf: 67aa8ad5c4c59cd1a7c379ad70feec4c04caebaf
  xe-pw-169125v6: 169125v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v6/index.html

--===============0323477590912757856==
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
<tr><td><b>Series:</b></td><td>drm/xe: balance exec queue suspend/resume (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169125/">https://patchwork.freedesktop.org/series/169125/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5389-67aa8ad5c4c59cd1a7c379ad70feec4c04caebaf_BAT -&gt; xe-pw-169125v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5389-67aa8ad5c4c59cd1a7c379ad70feec4c04caebaf -&gt; xe-pw-169125v6</li>
</ul>
<p>IGT_9002: 9002<br />
  xe-5389-67aa8ad5c4c59cd1a7c379ad70feec4c04caebaf: 67aa8ad5c4c59cd1a7c379ad70feec4c04caebaf<br />
  xe-pw-169125v6: 169125v6</p>

</body>
</html>

--===============0323477590912757856==--
