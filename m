Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAA9CCFA00
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 15:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E40110E2E5;
	Fri, 31 Oct 2025 15:47:50 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C2310E2E5;
 Fri, 31 Oct 2025 15:47:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4224309619299618982=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/uapi=3A_Implement_DR?=
 =?utf-8?q?M=5FXE=5FGEM=5FCREATE=5FFLAG=5FNO=5FCOMPRESSION_flag_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Oct 2025 15:47:49 -0000
Message-ID: <176192566919.5608.3694338907448570897@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251031125224.2479520-2-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20251031125224.2479520-2-sanjay.kumar.yadav@intel.com>
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

--===============4224309619299618982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uapi: Implement DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION flag (rev2)
URL   : https://patchwork.freedesktop.org/series/156658/
State : success

== Summary ==

CI Bug Log - changes from xe-4021-e2df6bac5c3868532a64c869ff7546587aa3dbad_BAT -> xe-pw-156658v2_BAT
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

  * Linux: xe-4021-e2df6bac5c3868532a64c869ff7546587aa3dbad -> xe-pw-156658v2

  IGT_8604: 8604
  xe-4021-e2df6bac5c3868532a64c869ff7546587aa3dbad: e2df6bac5c3868532a64c869ff7546587aa3dbad
  xe-pw-156658v2: 156658v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156658v2/index.html

--===============4224309619299618982==
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
<tr><td><b>Series:</b></td><td>drm/xe/uapi: Implement DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION flag (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156658/">https://patchwork.freedesktop.org/series/156658/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156658v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156658v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4021-e2df6bac5c3868532a64c869ff7546587aa3dbad_BAT -&gt; xe-pw-156658v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4021-e2df6bac5c3868532a64c869ff7546587aa3dbad -&gt; xe-pw-156658v2</li>
</ul>
<p>IGT_8604: 8604<br />
  xe-4021-e2df6bac5c3868532a64c869ff7546587aa3dbad: e2df6bac5c3868532a64c869ff7546587aa3dbad<br />
  xe-pw-156658v2: 156658v2</p>

</body>
</html>

--===============4224309619299618982==--
