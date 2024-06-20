Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35861C27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 18:02:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB59A10E179;
	Thu, 20 Jun 2024 18:02:48 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D34410E161;
 Thu, 20 Jun 2024 18:02:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0780740041967948648=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/ttm/pool=3A_Revert_to_clear-?=
 =?utf-8?q?on-alloc_to_honor_TTM=5FTT=5FFLAG=5FZERO=5FALLOC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Jun 2024 18:02:48 -0000
Message-ID: <171890656850.127624.16747802369510594727@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240620160147.29819-1-nirmoy.das@intel.com>
In-Reply-To: <20240620160147.29819-1-nirmoy.das@intel.com>
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

--===============0780740041967948648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/ttm/pool: Revert to clear-on-alloc to honor TTM_TT_FLAG_ZERO_ALLOC
URL   : https://patchwork.freedesktop.org/series/135129/
State : success

== Summary ==

CI Bug Log - changes from xe-1506-29f1cbee5f8da5427bb17ce634426571def7d128_BAT -> xe-pw-135129v1_BAT
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

  * Linux: xe-1506-29f1cbee5f8da5427bb17ce634426571def7d128 -> xe-pw-135129v1

  IGT_7894: 7894
  xe-1506-29f1cbee5f8da5427bb17ce634426571def7d128: 29f1cbee5f8da5427bb17ce634426571def7d128
  xe-pw-135129v1: 135129v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135129v1/index.html

--===============0780740041967948648==
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
<tr><td><b>Series:</b></td><td>drm/ttm/pool: Revert to clear-on-alloc to honor TTM_TT_FLAG_ZERO_ALLOC</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135129/">https://patchwork.freedesktop.org/series/135129/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135129v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135129v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1506-29f1cbee5f8da5427bb17ce634426571def7d128_BAT -&gt; xe-pw-135129v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1506-29f1cbee5f8da5427bb17ce634426571def7d128 -&gt; xe-pw-135129v1</li>
</ul>
<p>IGT_7894: 7894<br />
  xe-1506-29f1cbee5f8da5427bb17ce634426571def7d128: 29f1cbee5f8da5427bb17ce634426571def7d128<br />
  xe-pw-135129v1: 135129v1</p>

</body>
</html>

--===============0780740041967948648==--
