Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E79C5B552
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 12:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D0110E51B;
	Tue, 10 Jun 2025 12:15:29 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAF510E51B;
 Tue, 10 Jun 2025 12:15:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7548948372912475476=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_kernel_param_to_limit_t?=
 =?utf-8?q?he_eDP_rate_to_HBR2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Jun 2025 12:15:29 -0000
Message-ID: <174955772903.63316.12440126538716169932@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250610100449.185927-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250610100449.185927-1-ankit.k.nautiyal@intel.com>
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

--===============7548948372912475476==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add kernel param to limit the eDP rate to HBR2
URL   : https://patchwork.freedesktop.org/series/150031/
State : success

== Summary ==

CI Bug Log - changes from xe-3225-52ecbb6a68785860c776b29f58792d9807243979_BAT -> xe-pw-150031v1_BAT
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

  * IGT: IGT_8401 -> IGT_8402
  * Linux: xe-3225-52ecbb6a68785860c776b29f58792d9807243979 -> xe-pw-150031v1

  IGT_8401: 8401
  IGT_8402: ad7a9182bc87a1fe9875de9956b620f9d25485df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3225-52ecbb6a68785860c776b29f58792d9807243979: 52ecbb6a68785860c776b29f58792d9807243979
  xe-pw-150031v1: 150031v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150031v1/index.html

--===============7548948372912475476==
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
<tr><td><b>Series:</b></td><td>Add kernel param to limit the eDP rate to HBR2</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150031/">https://patchwork.freedesktop.org/series/150031/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150031v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150031v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3225-52ecbb6a68785860c776b29f58792d9807243979_BAT -&gt; xe-pw-150031v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8401 -&gt; IGT_8402</li>
<li>Linux: xe-3225-52ecbb6a68785860c776b29f58792d9807243979 -&gt; xe-pw-150031v1</li>
</ul>
<p>IGT_8401: 8401<br />
  IGT_8402: ad7a9182bc87a1fe9875de9956b620f9d25485df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3225-52ecbb6a68785860c776b29f58792d9807243979: 52ecbb6a68785860c776b29f58792d9807243979<br />
  xe-pw-150031v1: 150031v1</p>

</body>
</html>

--===============7548948372912475476==--
