Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4E9C3ABB2
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 05:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75B710E7C0;
	Fri, 30 May 2025 05:25:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87EF710E79E;
 Fri, 30 May 2025 05:25:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5174999603573198944=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Cleaning_up_code_related_to?=
 =?utf-8?q?_VRAM_regions_and_its_initialization_-_part_2_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 May 2025 05:25:41 -0000
Message-ID: <174858274154.34058.13890021594166468862@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250528074743.2027563-1-piotr.piorkowski@intel.com>
In-Reply-To: <20250528074743.2027563-1-piotr.piorkowski@intel.com>
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

--===============5174999603573198944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Cleaning up code related to VRAM regions and its initialization - part 2 (rev5)
URL   : https://patchwork.freedesktop.org/series/149503/
State : success

== Summary ==

CI Bug Log - changes from xe-3163-39820349458f14e376f4d49e1d77ab0805c9dfa7_BAT -> xe-pw-149503v5_BAT
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

  * Linux: xe-3163-39820349458f14e376f4d49e1d77ab0805c9dfa7 -> xe-pw-149503v5

  IGT_8384: 8384
  xe-3163-39820349458f14e376f4d49e1d77ab0805c9dfa7: 39820349458f14e376f4d49e1d77ab0805c9dfa7
  xe-pw-149503v5: 149503v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v5/index.html

--===============5174999603573198944==
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
<tr><td><b>Series:</b></td><td>Cleaning up code related to VRAM regions and its initialization - part 2 (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149503/">https://patchwork.freedesktop.org/series/149503/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3163-39820349458f14e376f4d49e1d77ab0805c9dfa7_BAT -&gt; xe-pw-149503v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3163-39820349458f14e376f4d49e1d77ab0805c9dfa7 -&gt; xe-pw-149503v5</li>
</ul>
<p>IGT_8384: 8384<br />
  xe-3163-39820349458f14e376f4d49e1d77ab0805c9dfa7: 39820349458f14e376f4d49e1d77ab0805c9dfa7<br />
  xe-pw-149503v5: 149503v5</p>

</body>
</html>

--===============5174999603573198944==--
