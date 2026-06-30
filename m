Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211A7C43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 16:01:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66DF10ECC0;
	Tue, 30 Jun 2026 16:01:30 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C79C10ECC0;
 Tue, 30 Jun 2026 16:01:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1217731338496904432=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Some_fixes_for_purged_BOs_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Jun 2026 16:01:29 -0000
Message-ID: <178283528930.133156.12185426678450029078@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260625152054.450125-5-matthew.auld@intel.com>
In-Reply-To: <20260625152054.450125-5-matthew.auld@intel.com>
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

--===============1217731338496904432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Some fixes for purged BOs (rev2)
URL   : https://patchwork.freedesktop.org/series/169208/
State : success

== Summary ==

CI Bug Log - changes from xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e_BAT -> xe-pw-169208v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-wcl-1 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e -> xe-pw-169208v2

  IGT_8988: 8988
  xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e: 949035681a65bc5801212ee164d0ab5ed6ae0d9e
  xe-pw-169208v2: 169208v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169208v2/index.html

--===============1217731338496904432==
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
<tr><td><b>Series:</b></td><td>Some fixes for purged BOs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169208/">https://patchwork.freedesktop.org/series/169208/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169208v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169208v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e_BAT -&gt; xe-pw-169208v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-wcl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e -&gt; xe-pw-169208v2</li>
</ul>
<p>IGT_8988: 8988<br />
  xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e: 949035681a65bc5801212ee164d0ab5ed6ae0d9e<br />
  xe-pw-169208v2: 169208v2</p>

</body>
</html>

--===============1217731338496904432==--
