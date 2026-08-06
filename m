Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592BAC561E6
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 08:55:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F113710E2CD;
	Thu,  6 Aug 2026 08:55:51 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C969110E2D0;
 Thu,  6 Aug 2026 08:55:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0871270296082680926=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dp=5Fmst=3A_Remove?=
 =?utf-8?q?_duplicate_intel=5Fpfit=5Fcompute=5Fconfig=28=29_call?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Aug 2026 08:55:50 -0000
Message-ID: <178600655081.24443.2590226673575210996@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260806074819.2631970-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260806074819.2631970-1-chaitanya.kumar.borah@intel.com>
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

--===============0871270296082680926==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp_mst: Remove duplicate intel_pfit_compute_config() call
URL   : https://patchwork.freedesktop.org/series/171711/
State : success

== Summary ==

CI Bug Log - changes from xe-5551-fd6f7b61eb97eb4a8183dd44039743df8ed5f654_BAT -> xe-pw-171711v1_BAT
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

  * Linux: xe-5551-fd6f7b61eb97eb4a8183dd44039743df8ed5f654 -> xe-pw-171711v1

  IGT_9041: 9041
  xe-5551-fd6f7b61eb97eb4a8183dd44039743df8ed5f654: fd6f7b61eb97eb4a8183dd44039743df8ed5f654
  xe-pw-171711v1: 171711v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171711v1/index.html

--===============0871270296082680926==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp_mst: Remove duplicate intel_pfit_compute_config() call</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171711/">https://patchwork.freedesktop.org/series/171711/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171711v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171711v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5551-fd6f7b61eb97eb4a8183dd44039743df8ed5f654_BAT -&gt; xe-pw-171711v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5551-fd6f7b61eb97eb4a8183dd44039743df8ed5f654 -&gt; xe-pw-171711v1</li>
</ul>
<p>IGT_9041: 9041<br />
  xe-5551-fd6f7b61eb97eb4a8183dd44039743df8ed5f654: fd6f7b61eb97eb4a8183dd44039743df8ed5f654<br />
  xe-pw-171711v1: 171711v1</p>

</body>
</html>

--===============0871270296082680926==--
