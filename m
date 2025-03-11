Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3848C28B2F
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 05:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4253710E121;
	Tue, 11 Mar 2025 05:58:56 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003E710E011;
 Tue, 11 Mar 2025 05:58:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6638770155355433841=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_GT_initialization?=
 =?utf-8?q?_rework=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Mar 2025 05:58:54 -0000
Message-ID: <174167273499.16838.12392275580489287879@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250310200653.89731-1-dev@lankhorst.se>
In-Reply-To: <20250310200653.89731-1-dev@lankhorst.se>
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

--===============6638770155355433841==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: GT initialization rework.
URL   : https://patchwork.freedesktop.org/series/146106/
State : success

== Summary ==

CI Bug Log - changes from xe-2790-335577160971c946611913d1a8e88ee7b00ae804_BAT -> xe-pw-146106v1_BAT
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

  * Linux: xe-2790-335577160971c946611913d1a8e88ee7b00ae804 -> xe-pw-146106v1

  IGT_8270: 49751c5c11723262ec66e564c76503f74a9fa831 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2790-335577160971c946611913d1a8e88ee7b00ae804: 335577160971c946611913d1a8e88ee7b00ae804
  xe-pw-146106v1: 146106v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146106v1/index.html

--===============6638770155355433841==
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
<tr><td><b>Series:</b></td><td>drm/xe: GT initialization rework.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146106/">https://patchwork.freedesktop.org/series/146106/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146106v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146106v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2790-335577160971c946611913d1a8e88ee7b00ae804_BAT -&gt; xe-pw-146106v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2790-335577160971c946611913d1a8e88ee7b00ae804 -&gt; xe-pw-146106v1</li>
</ul>
<p>IGT_8270: 49751c5c11723262ec66e564c76503f74a9fa831 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2790-335577160971c946611913d1a8e88ee7b00ae804: 335577160971c946611913d1a8e88ee7b00ae804<br />
  xe-pw-146106v1: 146106v1</p>

</body>
</html>

--===============6638770155355433841==--
