Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83340C6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 18:48:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0A510E002;
	Thu, 21 Mar 2024 18:48:12 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D653110E0D4;
 Thu, 21 Mar 2024 18:48:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1376735398081672781=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Use_FIELD=5FPREP_for_l?=
 =?utf-8?q?rc_descriptor_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Mar 2024 18:48:10 -0000
Message-ID: <171104689087.941104.10476366313068464079@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321063453.13306-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20240321063453.13306-1-niranjana.vishwanathapura@intel.com>
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

--===============1376735398081672781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use FIELD_PREP for lrc descriptor (rev3)
URL   : https://patchwork.freedesktop.org/series/131404/
State : success

== Summary ==

CI Bug Log - changes from xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31_BAT -> xe-pw-131404v3_BAT
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

  * IGT: IGT_7774 -> IGT_7775
  * Linux: xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31 -> xe-pw-131404v3

  IGT_7774: 7774
  IGT_7775: 0ee4074685c1e184f2d3612ea6eb4d126f9a2e23 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31: 0cd99ca612f004f19c35f4966a584f0a729bbc31
  xe-pw-131404v3: 131404v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131404v3/index.html

--===============1376735398081672781==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use FIELD_PREP for lrc descriptor (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131404/">https://patchwork.freedesktop.org/series/131404/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131404v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131404v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31_BAT -&gt; xe-pw-131404v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7774 -&gt; IGT_7775</li>
<li>Linux: xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31 -&gt; xe-pw-131404v3</li>
</ul>
<p>IGT_7774: 7774<br />
  IGT_7775: 0ee4074685c1e184f2d3612ea6eb4d126f9a2e23 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-972-0cd99ca612f004f19c35f4966a584f0a729bbc31: 0cd99ca612f004f19c35f4966a584f0a729bbc31<br />
  xe-pw-131404v3: 131404v3</p>

</body>
</html>

--===============1376735398081672781==--
