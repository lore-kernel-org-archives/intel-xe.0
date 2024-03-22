Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958E6C54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 09:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456F410EF03;
	Fri, 22 Mar 2024 09:10:24 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418EF10EF03;
 Fri, 22 Mar 2024 09:10:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2079638415096496819=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/_xe=5Fsync=3A_Check_NULL_?=
 =?utf-8?q?before_dereferencing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 22 Mar 2024 09:10:23 -0000
Message-ID: <171109862326.959897.9582559154513961429@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20231206223027.46588-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20231206223027.46588-1-krishnaiah.bommu@intel.com>
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

--===============2079638415096496819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/ xe_sync: Check NULL before dereferencing
URL   : https://patchwork.freedesktop.org/series/131471/
State : success

== Summary ==

CI Bug Log - changes from xe-975-236ae2b6b695ecedc3cf4453a1679d53b2e06f32_BAT -> xe-pw-131471v1_BAT
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

  * IGT: IGT_7776 -> IGT_7777
  * Linux: xe-975-236ae2b6b695ecedc3cf4453a1679d53b2e06f32 -> xe-pw-131471v1

  IGT_7776: 7776
  IGT_7777: 7777
  xe-975-236ae2b6b695ecedc3cf4453a1679d53b2e06f32: 236ae2b6b695ecedc3cf4453a1679d53b2e06f32
  xe-pw-131471v1: 131471v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131471v1/index.html

--===============2079638415096496819==
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
<tr><td><b>Series:</b></td><td>drm/xe/ xe_sync: Check NULL before dereferencing</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131471/">https://patchwork.freedesktop.org/series/131471/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131471v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131471v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-975-236ae2b6b695ecedc3cf4453a1679d53b2e06f32_BAT -&gt; xe-pw-131471v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7776 -&gt; IGT_7777</li>
<li>Linux: xe-975-236ae2b6b695ecedc3cf4453a1679d53b2e06f32 -&gt; xe-pw-131471v1</li>
</ul>
<p>IGT_7776: 7776<br />
  IGT_7777: 7777<br />
  xe-975-236ae2b6b695ecedc3cf4453a1679d53b2e06f32: 236ae2b6b695ecedc3cf4453a1679d53b2e06f32<br />
  xe-pw-131471v1: 131471v1</p>

</body>
</html>

--===============2079638415096496819==--
