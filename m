Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EC5C43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 03:03:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D541D10E157;
	Tue, 30 Jun 2026 03:03:08 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8122610E150;
 Tue, 30 Jun 2026 03:03:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6629543812713911674=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Fix_array-index-out-of-boun?=
 =?utf-8?q?ds_in_intel=5Fcmtg=5Fdisable=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Jun 2026 03:03:08 -0000
Message-ID: <178278858852.131163.1595978798404372224@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260629180236.1353704-1-animesh.manna@intel.com>
In-Reply-To: <20260629180236.1353704-1-animesh.manna@intel.com>
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

--===============6629543812713911674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix array-index-out-of-bounds in intel_cmtg_disable()
URL   : https://patchwork.freedesktop.org/series/169447/
State : success

== Summary ==

CI Bug Log - changes from xe-5306-03288b34f48c3fe60055353c30da4aacab572cdc_BAT -> xe-pw-169447v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5306-03288b34f48c3fe60055353c30da4aacab572cdc -> xe-pw-169447v1

  IGT_8988: 8988
  xe-5306-03288b34f48c3fe60055353c30da4aacab572cdc: 03288b34f48c3fe60055353c30da4aacab572cdc
  xe-pw-169447v1: 169447v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169447v1/index.html

--===============6629543812713911674==
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
<tr><td><b>Series:</b></td><td>Fix array-index-out-of-bounds in intel_cmtg_disable()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169447/">https://patchwork.freedesktop.org/series/169447/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169447v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169447v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5306-03288b34f48c3fe60055353c30da4aacab572cdc_BAT -&gt; xe-pw-169447v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5306-03288b34f48c3fe60055353c30da4aacab572cdc -&gt; xe-pw-169447v1</li>
</ul>
<p>IGT_8988: 8988<br />
  xe-5306-03288b34f48c3fe60055353c30da4aacab572cdc: 03288b34f48c3fe60055353c30da4aacab572cdc<br />
  xe-pw-169447v1: 169447v1</p>

</body>
</html>

--===============6629543812713911674==--
