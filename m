Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B0CCCFA18
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 01:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A427610E679;
	Wed, 12 Nov 2025 01:25:40 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AB910E677;
 Wed, 12 Nov 2025 01:25:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2913889975937843151=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Prevent_BIT=28=29?=
 =?utf-8?q?_overflow_when_handling_invalid_prefetch_region?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Nov 2025 01:25:40 -0000
Message-ID: <176291074006.42606.1411520909558445104@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251112002331.1897395-2-shuicheng.lin@intel.com>
In-Reply-To: <20251112002331.1897395-2-shuicheng.lin@intel.com>
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

--===============2913889975937843151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Prevent BIT() overflow when handling invalid prefetch region
URL   : https://patchwork.freedesktop.org/series/157406/
State : success

== Summary ==

CI Bug Log - changes from xe-4089-f2a06cc6e63a449c2074f95c7a61b18f6326769c_BAT -> xe-pw-157406v1_BAT
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

  * Linux: xe-4089-f2a06cc6e63a449c2074f95c7a61b18f6326769c -> xe-pw-157406v1

  IGT_8620: 8620
  xe-4089-f2a06cc6e63a449c2074f95c7a61b18f6326769c: f2a06cc6e63a449c2074f95c7a61b18f6326769c
  xe-pw-157406v1: 157406v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157406v1/index.html

--===============2913889975937843151==
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
<tr><td><b>Series:</b></td><td>drm/xe: Prevent BIT() overflow when handling invalid prefetch region</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157406/">https://patchwork.freedesktop.org/series/157406/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157406v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157406v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4089-f2a06cc6e63a449c2074f95c7a61b18f6326769c_BAT -&gt; xe-pw-157406v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4089-f2a06cc6e63a449c2074f95c7a61b18f6326769c -&gt; xe-pw-157406v1</li>
</ul>
<p>IGT_8620: 8620<br />
  xe-4089-f2a06cc6e63a449c2074f95c7a61b18f6326769c: f2a06cc6e63a449c2074f95c7a61b18f6326769c<br />
  xe-pw-157406v1: 157406v1</p>

</body>
</html>

--===============2913889975937843151==--
