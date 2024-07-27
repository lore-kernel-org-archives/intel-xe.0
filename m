Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E888FC3DA49
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jul 2024 02:04:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39ED10E082;
	Sat, 27 Jul 2024 02:04:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3467B10E082;
 Sat, 27 Jul 2024 02:04:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0057330708478774949=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Use_dma=5Ffence=5Fchai?=
 =?utf-8?q?n=5Ffree_in_chain_fence_unused_as_a_sync?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 27 Jul 2024 02:04:04 -0000
Message-ID: <172204584420.387534.3304091430779446612@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240727012216.2118276-1-matthew.brost@intel.com>
In-Reply-To: <20240727012216.2118276-1-matthew.brost@intel.com>
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

--===============0057330708478774949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use dma_fence_chain_free in chain fence unused as a sync
URL   : https://patchwork.freedesktop.org/series/136580/
State : success

== Summary ==

CI Bug Log - changes from xe-1676-356b4633c4fe39643d913d5dfb3c464c1f354ebd_BAT -> xe-pw-136580v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1676-356b4633c4fe39643d913d5dfb3c464c1f354ebd -> xe-pw-136580v1

  IGT_7940: 2a73158fa69a2b8e20d5a0bdf773ee194bfe13c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1676-356b4633c4fe39643d913d5dfb3c464c1f354ebd: 356b4633c4fe39643d913d5dfb3c464c1f354ebd
  xe-pw-136580v1: 136580v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136580v1/index.html

--===============0057330708478774949==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use dma_fence_chain_free in chain fence unused as a sync</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136580/">https://patchwork.freedesktop.org/series/136580/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136580v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136580v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1676-356b4633c4fe39643d913d5dfb3c464c1f354ebd_BAT -&gt; xe-pw-136580v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1676-356b4633c4fe39643d913d5dfb3c464c1f354ebd -&gt; xe-pw-136580v1</li>
</ul>
<p>IGT_7940: 2a73158fa69a2b8e20d5a0bdf773ee194bfe13c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1676-356b4633c4fe39643d913d5dfb3c464c1f354ebd: 356b4633c4fe39643d913d5dfb3c464c1f354ebd<br />
  xe-pw-136580v1: 136580v1</p>

</body>
</html>

--===============0057330708478774949==--
