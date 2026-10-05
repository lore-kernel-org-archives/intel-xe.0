Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B437CA5FCE
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 09:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E3510E91E;
	Mon,  5 Oct 2026 09:23:05 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFF310E91E;
 Mon,  5 Oct 2026 09:23:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8498003159495474487=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/uc=3A_Add_missing_Hu?=
 =?utf-8?q?C_firmware_entry_for_Alderlake-N?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kumar, Sachin" <sachin.kumar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Oct 2026 09:23:04 -0000
Message-ID: <179119218431.239432.15076788745723395668@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261005081549.1594153-1-sachin.kumar@intel.com>
In-Reply-To: <20261005081549.1594153-1-sachin.kumar@intel.com>
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

--===============8498003159495474487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uc: Add missing HuC firmware entry for Alderlake-N
URL   : https://patchwork.freedesktop.org/series/175546/
State : success

== Summary ==

CI Bug Log - changes from xe-5887-b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0_BAT -> xe-pw-175546v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9126 -> IGT_9127
  * Linux: xe-5887-b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0 -> xe-pw-175546v1

  IGT_9126: 4b27241425f55826ff2df54686e8e709f5baf9dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9127: 9127
  xe-5887-b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0: b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0
  xe-pw-175546v1: 175546v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175546v1/index.html

--===============8498003159495474487==
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
<tr><td><b>Series:</b></td><td>drm/xe/uc: Add missing HuC firmware entry for Alderlake-N</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175546/">https://patchwork.freedesktop.org/series/175546/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175546v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175546v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5887-b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0_BAT -&gt; xe-pw-175546v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9126 -&gt; IGT_9127</li>
<li>Linux: xe-5887-b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0 -&gt; xe-pw-175546v1</li>
</ul>
<p>IGT_9126: 4b27241425f55826ff2df54686e8e709f5baf9dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9127: 9127<br />
  xe-5887-b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0: b0bd9fb9e92aae2a653efa1d0407daa2aabe99d0<br />
  xe-pw-175546v1: 175546v1</p>

</body>
</html>

--===============8498003159495474487==--
