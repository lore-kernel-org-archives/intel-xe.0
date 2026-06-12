Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B45CD98CE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 22:20:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1B710E5D4;
	Fri, 12 Jun 2026 22:20:53 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E343B10E5C6;
 Fri, 12 Jun 2026 22:20:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3650007656081626502=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=3A_Suppress_Memo?=
 =?utf-8?q?ry_CAT_error_messages_on_race_condition?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Jun 2026 22:20:52 -0000
Message-ID: <178130285290.75133.4055126574592165578@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260612205317.269228-1-jonathan.cavitt@intel.com>
In-Reply-To: <20260612205317.269228-1-jonathan.cavitt@intel.com>
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

--===============3650007656081626502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Suppress Memory CAT error messages on race condition
URL   : https://patchwork.freedesktop.org/series/168463/
State : success

== Summary ==

CI Bug Log - changes from xe-5249-71bba5fe5cc7c5af204d4f5f472e6d5c1cb73c59_BAT -> xe-pw-168463v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5249-71bba5fe5cc7c5af204d4f5f472e6d5c1cb73c59 -> xe-pw-168463v1

  IGT_8962: 8962
  xe-5249-71bba5fe5cc7c5af204d4f5f472e6d5c1cb73c59: 71bba5fe5cc7c5af204d4f5f472e6d5c1cb73c59
  xe-pw-168463v1: 168463v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168463v1/index.html

--===============3650007656081626502==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Suppress Memory CAT error messages on race condition</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168463/">https://patchwork.freedesktop.org/series/168463/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168463v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168463v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5249-71bba5fe5cc7c5af204d4f5f472e6d5c1cb73c59_BAT -&gt; xe-pw-168463v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5249-71bba5fe5cc7c5af204d4f5f472e6d5c1cb73c59 -&gt; xe-pw-168463v1</li>
</ul>
<p>IGT_8962: 8962<br />
  xe-5249-71bba5fe5cc7c5af204d4f5f472e6d5c1cb73c59: 71bba5fe5cc7c5af204d4f5f472e6d5c1cb73c59<br />
  xe-pw-168463v1: 168463v1</p>

</body>
</html>

--===============3650007656081626502==--
