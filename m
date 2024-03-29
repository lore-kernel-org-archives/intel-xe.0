Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FB4CD1283
	for <intel-xe@archiver.kernel.org>; Fri, 29 Mar 2024 04:41:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F90310ECA8;
	Fri, 29 Mar 2024 04:41:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D403010EE01;
 Fri, 29 Mar 2024 04:41:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6778121155267119373=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/uapi=3A_Restore_flags_VM?=
 =?utf-8?q?=5FBIND=5FFLAG=5FREADONLY_and_VM=5FBIND=5FFLAG=5FIMMEDIATE?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Mar 2024 04:41:47 -0000
Message-ID: <171168730786.1066178.8200189041091060142@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240328200332.7-1-francois.dugast@intel.com>
In-Reply-To: <20240328200332.7-1-francois.dugast@intel.com>
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

--===============6778121155267119373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uapi: Restore flags VM_BIND_FLAG_READONLY and VM_BIND_FLAG_IMMEDIATE
URL   : https://patchwork.freedesktop.org/series/131790/
State : success

== Summary ==

CI Bug Log - changes from xe-1013-d80d79a49622684f7d0c29e26354fa55c718b48a_BAT -> xe-pw-131790v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-lnl-1 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1013-d80d79a49622684f7d0c29e26354fa55c718b48a -> xe-pw-131790v1

  IGT_7790: 5ec1ff6da3535cf80fd4e1844867d75c481ef86a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1013-d80d79a49622684f7d0c29e26354fa55c718b48a: d80d79a49622684f7d0c29e26354fa55c718b48a
  xe-pw-131790v1: 131790v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131790v1/index.html

--===============6778121155267119373==
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
<tr><td><b>Series:</b></td><td>drm/xe/uapi: Restore flags VM_BIND_FLAG_READONLY and VM_BIND_FLAG_IMMEDIATE</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131790/">https://patchwork.freedesktop.org/series/131790/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131790v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131790v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1013-d80d79a49622684f7d0c29e26354fa55c718b48a_BAT -&gt; xe-pw-131790v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1013-d80d79a49622684f7d0c29e26354fa55c718b48a -&gt; xe-pw-131790v1</li>
</ul>
<p>IGT_7790: 5ec1ff6da3535cf80fd4e1844867d75c481ef86a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1013-d80d79a49622684f7d0c29e26354fa55c718b48a: d80d79a49622684f7d0c29e26354fa55c718b48a<br />
  xe-pw-131790v1: 131790v1</p>

</body>
</html>

--===============6778121155267119373==--
