Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18D9C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 08:57:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95E510E115;
	Tue,  3 Jun 2025 08:57:51 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5964910E115;
 Tue,  3 Jun 2025 08:57:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8802135705024640805=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Handle_Firmware_reported_Ha?=
 =?utf-8?q?rdware_Errors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Jun 2025 08:57:50 -0000
Message-ID: <174894107035.42647.13676245338037368070@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603081409.1509709-1-riana.tauro@intel.com>
In-Reply-To: <20250603081409.1509709-1-riana.tauro@intel.com>
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

--===============8802135705024640805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Handle Firmware reported Hardware Errors
URL   : https://patchwork.freedesktop.org/series/149756/
State : success

== Summary ==

CI Bug Log - changes from xe-3181-354657e88d7ab7195b5f0525bc14273fb020f2f2_BAT -> xe-pw-149756v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 7)
------------------------------

  Missing    (2): bat-pvc-2 bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8390 -> IGT_8391
  * Linux: xe-3181-354657e88d7ab7195b5f0525bc14273fb020f2f2 -> xe-pw-149756v1

  IGT_8390: 8390
  IGT_8391: 2de2b6fc758c48199aed7e0aca8213b62f2d0ea0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3181-354657e88d7ab7195b5f0525bc14273fb020f2f2: 354657e88d7ab7195b5f0525bc14273fb020f2f2
  xe-pw-149756v1: 149756v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v1/index.html

--===============8802135705024640805==
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
<tr><td><b>Series:</b></td><td>Handle Firmware reported Hardware Errors</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149756/">https://patchwork.freedesktop.org/series/149756/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3181-354657e88d7ab7195b5f0525bc14273fb020f2f2_BAT -&gt; xe-pw-149756v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 7)</h2>
<p>Missing    (2): bat-pvc-2 bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8390 -&gt; IGT_8391</li>
<li>Linux: xe-3181-354657e88d7ab7195b5f0525bc14273fb020f2f2 -&gt; xe-pw-149756v1</li>
</ul>
<p>IGT_8390: 8390<br />
  IGT_8391: 2de2b6fc758c48199aed7e0aca8213b62f2d0ea0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3181-354657e88d7ab7195b5f0525bc14273fb020f2f2: 354657e88d7ab7195b5f0525bc14273fb020f2f2<br />
  xe-pw-149756v1: 149756v1</p>

</body>
</html>

--===============8802135705024640805==--
