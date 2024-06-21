Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4420AC27C4F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jun 2024 20:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB47310E268;
	Fri, 21 Jun 2024 20:46:57 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34EE110E268;
 Fri, 21 Jun 2024 20:46:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6747068483662202171=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Get_XE=5FFORCEWAKE=5FA?=
 =?utf-8?q?LL_to_read_RING=5FTIMESTAMP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Jun 2024 20:46:56 -0000
Message-ID: <171900281620.132081.17711570615816602839@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240621192325.227230-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20240621192325.227230-1-umesh.nerlige.ramappa@intel.com>
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

--===============6747068483662202171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Get XE_FORCEWAKE_ALL to read RING_TIMESTAMP
URL   : https://patchwork.freedesktop.org/series/135196/
State : success

== Summary ==

CI Bug Log - changes from xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a_BAT -> xe-pw-135196v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a -> xe-pw-135196v1

  IGT_7895: 7895
  xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a: 383dc44a79848f13f2430c9ed811b5c9b22b882a
  xe-pw-135196v1: 135196v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/index.html

--===============6747068483662202171==
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
<tr><td><b>Series:</b></td><td>drm/xe: Get XE_FORCEWAKE_ALL to read RING_TIMESTAMP</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135196/">https://patchwork.freedesktop.org/series/135196/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135196v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a_BAT -&gt; xe-pw-135196v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a -&gt; xe-pw-135196v1</li>
</ul>
<p>IGT_7895: 7895<br />
  xe-1514-383dc44a79848f13f2430c9ed811b5c9b22b882a: 383dc44a79848f13f2430c9ed811b5c9b22b882a<br />
  xe-pw-135196v1: 135196v1</p>

</body>
</html>

--===============6747068483662202171==--
