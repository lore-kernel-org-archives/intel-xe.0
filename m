Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A15EC55174
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 02:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E39510E167;
	Thu,  6 Aug 2026 02:07:15 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8510D10E167;
 Thu,  6 Aug 2026 02:07:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5823913378268243966=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIFhlLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJtL3hlOiBGaXggYSBidWcgaW4g?=
 =?utf-8?b?cGNfYWRqdXN0X2ZyZXFfYm91bmRzKCkgKHJldjMp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Aug 2026 02:07:13 -0000
Message-ID: <178598203353.23279.15790031166007388218@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260805234649.2076384-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20260805234649.2076384-1-vinay.belgaumkar@intel.com>
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

--===============5823913378268243966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix a bug in pc_adjust_freq_bounds() (rev3)
URL   : https://patchwork.freedesktop.org/series/171536/
State : success

== Summary ==

CI Bug Log - changes from xe-5549-caffd4cac0c4c2696d90c76d21f81342c288784e_BAT -> xe-pw-171536v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9039 -> IGT_9040
  * Linux: xe-5549-caffd4cac0c4c2696d90c76d21f81342c288784e -> xe-pw-171536v3

  IGT_9039: 9039
  IGT_9040: 9040
  xe-5549-caffd4cac0c4c2696d90c76d21f81342c288784e: caffd4cac0c4c2696d90c76d21f81342c288784e
  xe-pw-171536v3: 171536v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171536v3/index.html

--===============5823913378268243966==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix a bug in pc_adjust_freq_bounds() (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171536/">https://patchwork.freedesktop.org/series/171536/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171536v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171536v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5549-caffd4cac0c4c2696d90c76d21f81342c288784e_BAT -&gt; xe-pw-171536v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9039 -&gt; IGT_9040</li>
<li>Linux: xe-5549-caffd4cac0c4c2696d90c76d21f81342c288784e -&gt; xe-pw-171536v3</li>
</ul>
<p>IGT_9039: 9039<br />
  IGT_9040: 9040<br />
  xe-5549-caffd4cac0c4c2696d90c76d21f81342c288784e: caffd4cac0c4c2696d90c76d21f81342c288784e<br />
  xe-pw-171536v3: 171536v3</p>

</body>
</html>

--===============5823913378268243966==--
