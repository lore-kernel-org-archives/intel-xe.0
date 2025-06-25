Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569ABC7EE31
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 16:56:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193C810E7A2;
	Wed, 25 Jun 2025 16:56:50 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0412410E7A0;
 Wed, 25 Jun 2025 16:56:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2215441573591099138=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Drop_bo-=3Esize_?=
 =?utf-8?q?=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Jun 2025 16:56:47 -0000
Message-ID: <175087060700.109144.8899891543158950475@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250625144128.2827577-1-matthew.brost@intel.com>
In-Reply-To: <20250625144128.2827577-1-matthew.brost@intel.com>
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

--===============2215441573591099138==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Drop bo->size (rev4)
URL   : https://patchwork.freedesktop.org/series/150710/
State : success

== Summary ==

CI Bug Log - changes from xe-3304-85e4f71197f8499fc46f846adec70e63b13745a1_BAT -> xe-pw-150710v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3304-85e4f71197f8499fc46f846adec70e63b13745a1 -> xe-pw-150710v4

  IGT_8425: 8425
  xe-3304-85e4f71197f8499fc46f846adec70e63b13745a1: 85e4f71197f8499fc46f846adec70e63b13745a1
  xe-pw-150710v4: 150710v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150710v4/index.html

--===============2215441573591099138==
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
<tr><td><b>Series:</b></td><td>drm/xe: Drop bo-&gt;size (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150710/">https://patchwork.freedesktop.org/series/150710/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150710v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150710v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3304-85e4f71197f8499fc46f846adec70e63b13745a1_BAT -&gt; xe-pw-150710v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3304-85e4f71197f8499fc46f846adec70e63b13745a1 -&gt; xe-pw-150710v4</li>
</ul>
<p>IGT_8425: 8425<br />
  xe-3304-85e4f71197f8499fc46f846adec70e63b13745a1: 85e4f71197f8499fc46f846adec70e63b13745a1<br />
  xe-pw-150710v4: 150710v4</p>

</body>
</html>

--===============2215441573591099138==--
