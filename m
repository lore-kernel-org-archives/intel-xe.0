Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C18CD98E2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 11:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6BA10EFAF;
	Wed, 17 Jun 2026 11:06:29 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CCE10E9B7;
 Wed, 17 Jun 2026 11:06:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1403505594281476441=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Create_imported_s?=
 =?utf-8?q?g_BO_only_after_dma-buf_attach?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Jun 2026 11:06:28 -0000
Message-ID: <178169438828.89426.619580204133323925@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260617101654.1989199-2-nitin.r.gote@intel.com>
In-Reply-To: <20260617101654.1989199-2-nitin.r.gote@intel.com>
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

--===============1403505594281476441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Create imported sg BO only after dma-buf attach
URL   : https://patchwork.freedesktop.org/series/168681/
State : success

== Summary ==

CI Bug Log - changes from xe-5270-b8888840869c4fbcc9372b758f3400ecbf38b0ce_BAT -> xe-pw-168681v1_BAT
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

  * Linux: xe-5270-b8888840869c4fbcc9372b758f3400ecbf38b0ce -> xe-pw-168681v1

  IGT_8968: 6f40795505dc42c273334e9581c15e6025d8ed57 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5270-b8888840869c4fbcc9372b758f3400ecbf38b0ce: b8888840869c4fbcc9372b758f3400ecbf38b0ce
  xe-pw-168681v1: 168681v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168681v1/index.html

--===============1403505594281476441==
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
<tr><td><b>Series:</b></td><td>drm/xe: Create imported sg BO only after dma-buf attach</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168681/">https://patchwork.freedesktop.org/series/168681/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168681v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168681v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5270-b8888840869c4fbcc9372b758f3400ecbf38b0ce_BAT -&gt; xe-pw-168681v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5270-b8888840869c4fbcc9372b758f3400ecbf38b0ce -&gt; xe-pw-168681v1</li>
</ul>
<p>IGT_8968: 6f40795505dc42c273334e9581c15e6025d8ed57 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5270-b8888840869c4fbcc9372b758f3400ecbf38b0ce: b8888840869c4fbcc9372b758f3400ecbf38b0ce<br />
  xe-pw-168681v1: 168681v1</p>

</body>
</html>

--===============1403505594281476441==--
