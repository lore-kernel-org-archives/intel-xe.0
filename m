Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDBEC5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 13:57:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C31710E117;
	Thu,  5 Jun 2025 13:57:30 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FF010E117;
 Thu,  5 Jun 2025 13:57:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6838917810677988302=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe3=3A_Disable_null_?=
 =?utf-8?q?query_for_anyhit_shader_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Jun 2025 13:57:28 -0000
Message-ID: <174913184879.52229.3081027189708998419@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605100812.2547808-1-nitin.r.gote@intel.com>
In-Reply-To: <20250605100812.2547808-1-nitin.r.gote@intel.com>
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

--===============6838917810677988302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe3: Disable null query for anyhit shader (rev2)
URL   : https://patchwork.freedesktop.org/series/148878/
State : success

== Summary ==

CI Bug Log - changes from xe-3198-cbceb1c61ee3a50472a3155eb8166b36929541d8_BAT -> xe-pw-148878v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3198-cbceb1c61ee3a50472a3155eb8166b36929541d8 -> xe-pw-148878v2

  IGT_8396: 8396
  xe-3198-cbceb1c61ee3a50472a3155eb8166b36929541d8: cbceb1c61ee3a50472a3155eb8166b36929541d8
  xe-pw-148878v2: 148878v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148878v2/index.html

--===============6838917810677988302==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe3: Disable null query for anyhit shader (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148878/">https://patchwork.freedesktop.org/series/148878/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148878v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148878v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3198-cbceb1c61ee3a50472a3155eb8166b36929541d8_BAT -&gt; xe-pw-148878v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3198-cbceb1c61ee3a50472a3155eb8166b36929541d8 -&gt; xe-pw-148878v2</li>
</ul>
<p>IGT_8396: 8396<br />
  xe-3198-cbceb1c61ee3a50472a3155eb8166b36929541d8: cbceb1c61ee3a50472a3155eb8166b36929541d8<br />
  xe-pw-148878v2: 148878v2</p>

</body>
</html>

--===============6838917810677988302==--
