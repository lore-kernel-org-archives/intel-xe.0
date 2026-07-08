Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5551C43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 23:13:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E2710E367;
	Wed,  8 Jul 2026 23:13:00 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936E410E367;
 Wed,  8 Jul 2026 23:12:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3035391785431462663=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIFhlLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJtL3hlOiBVc2UgeGVfdGlsZV9p?=
 =?utf-8?b?bmZvKCkgaW4gYWxsb2NfcHJpbWFyeV9ndCgpIGFuZCBhbGxvY19tZWRpYV9ndCgp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Jul 2026 23:12:58 -0000
Message-ID: <178355237859.167178.8763491651305848186@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260708221233.3251663-1-shuicheng.lin@intel.com>
In-Reply-To: <20260708221233.3251663-1-shuicheng.lin@intel.com>
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

--===============3035391785431462663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use xe_tile_info() in alloc_primary_gt() and alloc_media_gt()
URL   : https://patchwork.freedesktop.org/series/170037/
State : success

== Summary ==

CI Bug Log - changes from xe-5370-ab9c4156ab48d805163a92976fabf872e4ddcd4d_BAT -> xe-pw-170037v1_BAT
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

  * Linux: xe-5370-ab9c4156ab48d805163a92976fabf872e4ddcd4d -> xe-pw-170037v1

  IGT_8994: 59469572ae481848d6bd469242aef7c5333b39ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5370-ab9c4156ab48d805163a92976fabf872e4ddcd4d: ab9c4156ab48d805163a92976fabf872e4ddcd4d
  xe-pw-170037v1: 170037v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170037v1/index.html

--===============3035391785431462663==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use xe_tile_info() in alloc_primary_gt() and alloc_media_gt()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170037/">https://patchwork.freedesktop.org/series/170037/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170037v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170037v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5370-ab9c4156ab48d805163a92976fabf872e4ddcd4d_BAT -&gt; xe-pw-170037v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5370-ab9c4156ab48d805163a92976fabf872e4ddcd4d -&gt; xe-pw-170037v1</li>
</ul>
<p>IGT_8994: 59469572ae481848d6bd469242aef7c5333b39ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5370-ab9c4156ab48d805163a92976fabf872e4ddcd4d: ab9c4156ab48d805163a92976fabf872e4ddcd4d<br />
  xe-pw-170037v1: 170037v1</p>

</body>
</html>

--===============3035391785431462663==--
