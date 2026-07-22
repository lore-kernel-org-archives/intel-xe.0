Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615ECC44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 21:28:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCA010E4DE;
	Wed, 22 Jul 2026 21:28:12 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6255710E4DE;
 Wed, 22 Jul 2026 21:28:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6012517066188033308=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=3A_Compress_GuC_?=
 =?utf-8?q?log_and_CTB_dump_with_zstd_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jul 2026 21:28:10 -0000
Message-ID: <178475569039.218318.5031334695995562617@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260722180605.2498906-1-zhanjun.dong@intel.com>
In-Reply-To: <20260722180605.2498906-1-zhanjun.dong@intel.com>
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

--===============6012517066188033308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Compress GuC log and CTB dump with zstd (rev2)
URL   : https://patchwork.freedesktop.org/series/170589/
State : success

== Summary ==

CI Bug Log - changes from xe-5462-447a47cf86f97a1f5362d0675d65d129be27b004_BAT -> xe-pw-170589v2_BAT
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

  * Linux: xe-5462-447a47cf86f97a1f5362d0675d65d129be27b004 -> xe-pw-170589v2

  IGT_9020: 9020
  xe-5462-447a47cf86f97a1f5362d0675d65d129be27b004: 447a47cf86f97a1f5362d0675d65d129be27b004
  xe-pw-170589v2: 170589v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v2/index.html

--===============6012517066188033308==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Compress GuC log and CTB dump with zstd (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170589/">https://patchwork.freedesktop.org/series/170589/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5462-447a47cf86f97a1f5362d0675d65d129be27b004_BAT -&gt; xe-pw-170589v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5462-447a47cf86f97a1f5362d0675d65d129be27b004 -&gt; xe-pw-170589v2</li>
</ul>
<p>IGT_9020: 9020<br />
  xe-5462-447a47cf86f97a1f5362d0675d65d129be27b004: 447a47cf86f97a1f5362d0675d65d129be27b004<br />
  xe-pw-170589v2: 170589v2</p>

</body>
</html>

--===============6012517066188033308==--
