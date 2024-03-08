Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B3BC54E4A
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 08:09:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6604510F408;
	Fri,  8 Mar 2024 08:09:58 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555D910EF50;
 Fri,  8 Mar 2024 08:09:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7570182651028000466=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/gt=3A_Remove_redundant_nu?=
 =?utf-8?q?m=5Fengine_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Mar 2024 08:09:57 -0000
Message-ID: <170988539735.611679.10491208547859997954@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240308070308.2651954-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240308070308.2651954-1-tejas.upadhyay@intel.com>
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

--===============7570182651028000466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/gt: Remove redundant num_engine check
URL   : https://patchwork.freedesktop.org/series/130898/
State : success

== Summary ==

CI Bug Log - changes from xe-919-ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b_BAT -> xe-pw-130898v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-919-ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b -> xe-pw-130898v1

  IGT_7749: 2fd91b8c3cf9aa2b0bb78537a6b5e2bc3de50e0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-919-ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b: ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b
  xe-pw-130898v1: 130898v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130898v1/index.html

--===============7570182651028000466==
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
<tr><td><b>Series:</b></td><td>drm/xe/gt: Remove redundant num_engine check</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130898/">https://patchwork.freedesktop.org/series/130898/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130898v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130898v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-919-ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b_BAT -&gt; xe-pw-130898v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-919-ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b -&gt; xe-pw-130898v1</li>
</ul>
<p>IGT_7749: 2fd91b8c3cf9aa2b0bb78537a6b5e2bc3de50e0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-919-ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b: ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b<br />
  xe-pw-130898v1: 130898v1</p>

</body>
</html>

--===============7570182651028000466==--
