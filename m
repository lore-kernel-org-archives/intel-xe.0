Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2C2C677C4
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 23:11:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938A010E162;
	Tue, 10 Jun 2025 23:11:54 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CB210E162;
 Tue, 10 Jun 2025 23:11:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8547366814617713027=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_fixup!_drm/xe/ptl=3A_Add_Gu?=
 =?utf-8?q?C_firmware_definition?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Jun 2025 23:11:53 -0000
Message-ID: <174959711322.65592.11036203332626353159@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250610215523.645368-1-julia.filipchuk@intel.com>
In-Reply-To: <20250610215523.645368-1-julia.filipchuk@intel.com>
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

--===============8547366814617713027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: fixup! drm/xe/ptl: Add GuC firmware definition
URL   : https://patchwork.freedesktop.org/series/150068/
State : success

== Summary ==

CI Bug Log - changes from xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60_BAT -> xe-pw-150068v1_BAT
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

  * IGT: IGT_8403 -> IGT_8404
  * Linux: xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60 -> xe-pw-150068v1

  IGT_8403: f2e82612b44bf8c30bfd0c523b69e424dc5f8d7a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8404: dad4b2bb9e5a2c87ae0275efbf9f0df00a67ef46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60: 7bc153635620254b73cfe8714ce42768b2bf6d60
  xe-pw-150068v1: 150068v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150068v1/index.html

--===============8547366814617713027==
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
<tr><td><b>Series:</b></td><td>fixup! drm/xe/ptl: Add GuC firmware definition</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150068/">https://patchwork.freedesktop.org/series/150068/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150068v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150068v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60_BAT -&gt; xe-pw-150068v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8403 -&gt; IGT_8404</li>
<li>Linux: xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60 -&gt; xe-pw-150068v1</li>
</ul>
<p>IGT_8403: f2e82612b44bf8c30bfd0c523b69e424dc5f8d7a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8404: dad4b2bb9e5a2c87ae0275efbf9f0df00a67ef46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3226-7bc153635620254b73cfe8714ce42768b2bf6d60: 7bc153635620254b73cfe8714ce42768b2bf6d60<br />
  xe-pw-150068v1: 150068v1</p>

</body>
</html>

--===============8547366814617713027==--
