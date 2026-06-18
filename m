Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A47DCD98F2
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 11:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3560510F2A9;
	Thu, 18 Jun 2026 11:58:51 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264CD10F292;
 Thu, 18 Jun 2026 11:58:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1325054364288411811=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dsi=3A_fix_i2c_ada?=
 =?utf-8?q?pter_reference_leak_in_i2c=5Fadapter=5Flookup=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ma Ke" <make_ruc2021@163.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Jun 2026 11:58:50 -0000
Message-ID: <178178393014.93099.6111257298450118500@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260614142250.2001136-1-make_ruc2021@163.com>
In-Reply-To: <20260614142250.2001136-1-make_ruc2021@163.com>
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

--===============1325054364288411811==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dsi: fix i2c adapter reference leak in i2c_adapter_lookup() (rev2)
URL   : https://patchwork.freedesktop.org/series/168521/
State : success

== Summary ==

CI Bug Log - changes from xe-5278-0e9939890b0f7e54f1d69774cb4e6fd9d66cb29e_BAT -> xe-pw-168521v2_BAT
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

  * Linux: xe-5278-0e9939890b0f7e54f1d69774cb4e6fd9d66cb29e -> xe-pw-168521v2

  IGT_8973: 8973
  xe-5278-0e9939890b0f7e54f1d69774cb4e6fd9d66cb29e: 0e9939890b0f7e54f1d69774cb4e6fd9d66cb29e
  xe-pw-168521v2: 168521v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168521v2/index.html

--===============1325054364288411811==
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
<tr><td><b>Series:</b></td><td>drm/i915/dsi: fix i2c adapter reference leak in i2c_adapter_lookup() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168521/">https://patchwork.freedesktop.org/series/168521/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168521v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168521v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5278-0e9939890b0f7e54f1d69774cb4e6fd9d66cb29e_BAT -&gt; xe-pw-168521v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5278-0e9939890b0f7e54f1d69774cb4e6fd9d66cb29e -&gt; xe-pw-168521v2</li>
</ul>
<p>IGT_8973: 8973<br />
  xe-5278-0e9939890b0f7e54f1d69774cb4e6fd9d66cb29e: 0e9939890b0f7e54f1d69774cb4e6fd9d66cb29e<br />
  xe-pw-168521v2: 168521v2</p>

</body>
</html>

--===============1325054364288411811==--
