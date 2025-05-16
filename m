Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AC3C3ABDD
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 07:19:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BB910E030;
	Fri, 16 May 2025 07:19:24 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D156B10E030;
 Fri, 16 May 2025 07:19:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8631740712958082076=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/psr=3A_Do_not_read?=
 =?utf-8?q?_PSR2=5FSU=5FSTATUS_on_AlderLake_and_onwards_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 May 2025 07:19:23 -0000
Message-ID: <174737996384.86767.7663948108095873002@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250516063019.2126702-1-jouni.hogander@intel.com>
In-Reply-To: <20250516063019.2126702-1-jouni.hogander@intel.com>
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

--===============8631740712958082076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/psr: Do not read PSR2_SU_STATUS on AlderLake and onwards (rev2)
URL   : https://patchwork.freedesktop.org/series/147814/
State : success

== Summary ==

CI Bug Log - changes from xe-3098-bf8c2c7bea6b5a38b6a3c24fdfc72b1ab5c03c28_BAT -> xe-pw-147814v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3098-bf8c2c7bea6b5a38b6a3c24fdfc72b1ab5c03c28 -> xe-pw-147814v2

  IGT_8365: 8365
  xe-3098-bf8c2c7bea6b5a38b6a3c24fdfc72b1ab5c03c28: bf8c2c7bea6b5a38b6a3c24fdfc72b1ab5c03c28
  xe-pw-147814v2: 147814v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147814v2/index.html

--===============8631740712958082076==
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
<tr><td><b>Series:</b></td><td>drm/i915/psr: Do not read PSR2_SU_STATUS on AlderLake and onwards (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147814/">https://patchwork.freedesktop.org/series/147814/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147814v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147814v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3098-bf8c2c7bea6b5a38b6a3c24fdfc72b1ab5c03c28_BAT -&gt; xe-pw-147814v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3098-bf8c2c7bea6b5a38b6a3c24fdfc72b1ab5c03c28 -&gt; xe-pw-147814v2</li>
</ul>
<p>IGT_8365: 8365<br />
  xe-3098-bf8c2c7bea6b5a38b6a3c24fdfc72b1ab5c03c28: bf8c2c7bea6b5a38b6a3c24fdfc72b1ab5c03c28<br />
  xe-pw-147814v2: 147814v2</p>

</body>
</html>

--===============8631740712958082076==--
