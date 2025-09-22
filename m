Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DBBCAC5A7
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 12:49:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F0510E1B8;
	Mon, 22 Sep 2025 12:49:24 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B0110E1B8;
 Mon, 22 Sep 2025 12:49:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5567294158038977622=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe/tests=3A_Fix_build_?=
 =?utf-8?q?break_on_clang_16=2E0=2E6?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Sep 2025 12:49:23 -0000
Message-ID: <175854536338.353633.13425238247599942147@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250922101207.192028-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250922101207.192028-1-michal.wajdeczko@intel.com>
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

--===============5567294158038977622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/tests: Fix build break on clang 16.0.6
URL   : https://patchwork.freedesktop.org/series/154831/
State : success

== Summary ==

CI Bug Log - changes from xe-3809-c62946715831ca05ed8a916327e9480158c54566_FULL -> xe-pw-154831v1_FULL
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

  * Linux: xe-3809-c62946715831ca05ed8a916327e9480158c54566 -> xe-pw-154831v1

  IGT_8546: 8546
  xe-3809-c62946715831ca05ed8a916327e9480158c54566: c62946715831ca05ed8a916327e9480158c54566
  xe-pw-154831v1: 154831v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154831v1/index.html

--===============5567294158038977622==
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
<tr><td><b>Series:</b></td><td>drm/xe/tests: Fix build break on clang 16.0.6</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154831/">https://patchwork.freedesktop.org/series/154831/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154831v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154831v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3809-c62946715831ca05ed8a916327e9480158c54566_FULL -&gt; xe-pw-154831v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3809-c62946715831ca05ed8a916327e9480158c54566 -&gt; xe-pw-154831v1</li>
</ul>
<p>IGT_8546: 8546<br />
  xe-3809-c62946715831ca05ed8a916327e9480158c54566: c62946715831ca05ed8a916327e9480158c54566<br />
  xe-pw-154831v1: 154831v1</p>

</body>
</html>

--===============5567294158038977622==--
