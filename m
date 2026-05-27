Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7F7CD5BD5
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 06:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D0710E07A;
	Wed, 27 May 2026 06:14:49 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A182110E07A;
 Wed, 27 May 2026 06:14:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7800546188531041345=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_get-error-counter_and_c?=
 =?utf-8?q?lear-error-counter_support_for_CRI_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 May 2026 06:14:47 -0000
Message-ID: <177986248765.14031.18095605093015561848@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260527060241.3351323-8-riana.tauro@intel.com>
In-Reply-To: <20260527060241.3351323-8-riana.tauro@intel.com>
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

--===============7800546188531041345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add get-error-counter and clear-error-counter support for CRI (rev6)
URL   : https://patchwork.freedesktop.org/series/164393/
State : success

== Summary ==

CI Bug Log - changes from xe-5134-14d3e29c36bea707856f5c03dbf7b0ef73fdeb85_BAT -> xe-pw-164393v6_BAT
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

  * Linux: xe-5134-14d3e29c36bea707856f5c03dbf7b0ef73fdeb85 -> xe-pw-164393v6

  IGT_8938: b024a3b67372962ff6e643d3998c5cf5acc07081 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5134-14d3e29c36bea707856f5c03dbf7b0ef73fdeb85: 14d3e29c36bea707856f5c03dbf7b0ef73fdeb85
  xe-pw-164393v6: 164393v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v6/index.html

--===============7800546188531041345==
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
<tr><td><b>Series:</b></td><td>Add get-error-counter and clear-error-counter support for CRI (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164393/">https://patchwork.freedesktop.org/series/164393/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164393v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5134-14d3e29c36bea707856f5c03dbf7b0ef73fdeb85_BAT -&gt; xe-pw-164393v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5134-14d3e29c36bea707856f5c03dbf7b0ef73fdeb85 -&gt; xe-pw-164393v6</li>
</ul>
<p>IGT_8938: b024a3b67372962ff6e643d3998c5cf5acc07081 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5134-14d3e29c36bea707856f5c03dbf7b0ef73fdeb85: 14d3e29c36bea707856f5c03dbf7b0ef73fdeb85<br />
  xe-pw-164393v6: 164393v6</p>

</body>
</html>

--===============7800546188531041345==--
