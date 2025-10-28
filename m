Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB636CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 09:12:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710D110E5C1;
	Tue, 28 Oct 2025 09:12:13 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9E110E5C1;
 Tue, 28 Oct 2025 09:12:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6587693899328005291=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_uninitialized?=
 =?utf-8?q?_return_value_from_xe=5Fvalidation=5Fguard=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Oct 2025 09:12:12 -0000
Message-ID: <176164273231.62065.14863011329399701232@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251027131228.12098-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20251027131228.12098-1-thomas.hellstrom@linux.intel.com>
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

--===============6587693899328005291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix uninitialized return value from xe_validation_guard() (rev2)
URL   : https://patchwork.freedesktop.org/series/156581/
State : success

== Summary ==

CI Bug Log - changes from xe-3994-de43fe70c436c359e7478a5532d873f87357cb4e_BAT -> xe-pw-156581v2_BAT
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

  * IGT: IGT_8597 -> IGT_8598
  * Linux: xe-3994-de43fe70c436c359e7478a5532d873f87357cb4e -> xe-pw-156581v2

  IGT_8597: 8597
  IGT_8598: 8598
  xe-3994-de43fe70c436c359e7478a5532d873f87357cb4e: de43fe70c436c359e7478a5532d873f87357cb4e
  xe-pw-156581v2: 156581v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156581v2/index.html

--===============6587693899328005291==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix uninitialized return value from xe_validation_guard() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156581/">https://patchwork.freedesktop.org/series/156581/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156581v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156581v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3994-de43fe70c436c359e7478a5532d873f87357cb4e_BAT -&gt; xe-pw-156581v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8597 -&gt; IGT_8598</li>
<li>Linux: xe-3994-de43fe70c436c359e7478a5532d873f87357cb4e -&gt; xe-pw-156581v2</li>
</ul>
<p>IGT_8597: 8597<br />
  IGT_8598: 8598<br />
  xe-3994-de43fe70c436c359e7478a5532d873f87357cb4e: de43fe70c436c359e7478a5532d873f87357cb4e<br />
  xe-pw-156581v2: 156581v2</p>

</body>
</html>

--===============6587693899328005291==--
