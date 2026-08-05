Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC36C55184
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 00:17:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904A610EC03;
	Wed,  5 Aug 2026 00:17:09 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895A610E0FE;
 Wed,  5 Aug 2026 00:17:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7082842513316518031=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIFhlLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJtL3hlOiBGaXggYSBidWcgaW4g?=
 =?utf-8?b?cGNfYWRqdXN0X2ZyZXFfYm91bmRzKCkgKHJldjIp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Aug 2026 00:17:08 -0000
Message-ID: <178588902855.19127.1905507386419865601@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260804232218.1736159-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20260804232218.1736159-1-vinay.belgaumkar@intel.com>
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

--===============7082842513316518031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix a bug in pc_adjust_freq_bounds() (rev2)
URL   : https://patchwork.freedesktop.org/series/171536/
State : success

== Summary ==

CI Bug Log - changes from xe-5542-814bd7de7f09446c4b9401eecb8b30c3285af78b_BAT -> xe-pw-171536v2_BAT
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

  * IGT: IGT_9037 -> IGT_9038
  * Linux: xe-5542-814bd7de7f09446c4b9401eecb8b30c3285af78b -> xe-pw-171536v2

  IGT_9037: 9037
  IGT_9038: 9038
  xe-5542-814bd7de7f09446c4b9401eecb8b30c3285af78b: 814bd7de7f09446c4b9401eecb8b30c3285af78b
  xe-pw-171536v2: 171536v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171536v2/index.html

--===============7082842513316518031==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix a bug in pc_adjust_freq_bounds() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171536/">https://patchwork.freedesktop.org/series/171536/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171536v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171536v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5542-814bd7de7f09446c4b9401eecb8b30c3285af78b_BAT -&gt; xe-pw-171536v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9037 -&gt; IGT_9038</li>
<li>Linux: xe-5542-814bd7de7f09446c4b9401eecb8b30c3285af78b -&gt; xe-pw-171536v2</li>
</ul>
<p>IGT_9037: 9037<br />
  IGT_9038: 9038<br />
  xe-5542-814bd7de7f09446c4b9401eecb8b30c3285af78b: 814bd7de7f09446c4b9401eecb8b30c3285af78b<br />
  xe-pw-171536v2: 171536v2</p>

</body>
</html>

--===============7082842513316518031==--
