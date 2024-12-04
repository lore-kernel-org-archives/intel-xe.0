Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E73DE7716E
	for <intel-xe@archiver.kernel.org>; Wed,  4 Dec 2024 12:34:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A68E10E4B1;
	Wed,  4 Dec 2024 12:34:18 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FDE10E4B1;
 Wed,  4 Dec 2024 12:34:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6918436177767419397=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Use_managed_BO_in?=
 =?utf-8?q?_memirq?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ilia Levi" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Dec 2024 12:34:17 -0000
Message-ID: <173331565733.2470496.2166121614360969619@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241204111655.1293-1-ilia.levi@intel.com>
In-Reply-To: <20241204111655.1293-1-ilia.levi@intel.com>
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

--===============6918436177767419397==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use managed BO in memirq
URL   : https://patchwork.freedesktop.org/series/142108/
State : success

== Summary ==

CI Bug Log - changes from xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8_BAT -> xe-pw-142108v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 6)
------------------------------

  Missing    (2): bat-bmg-1 bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8 -> xe-pw-142108v1

  IGT_8137: 8137
  xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8: 01f05d37bed61bd0dddb698bfb2b1fe1e973eec8
  xe-pw-142108v1: 142108v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/index.html

--===============6918436177767419397==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use managed BO in memirq</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142108/">https://patchwork.freedesktop.org/series/142108/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142108v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8_BAT -&gt; xe-pw-142108v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 6)</h2>
<p>Missing    (2): bat-bmg-1 bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8 -&gt; xe-pw-142108v1</li>
</ul>
<p>IGT_8137: 8137<br />
  xe-2316-01f05d37bed61bd0dddb698bfb2b1fe1e973eec8: 01f05d37bed61bd0dddb698bfb2b1fe1e973eec8<br />
  xe-pw-142108v1: 142108v1</p>

</body>
</html>

--===============6918436177767419397==--
