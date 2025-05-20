Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DA2C3DA6D
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 15:53:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C489210E52C;
	Tue, 20 May 2025 15:53:36 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FC210E5A2;
 Tue, 20 May 2025 15:53:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1739692941597409467=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/mocs=3A_Initialize_M?=
 =?utf-8?q?OCS_index_early?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 May 2025 15:53:35 -0000
Message-ID: <174775641538.5114.3444350217513256919@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250520142445.2792824-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20250520142445.2792824-1-balasubramani.vivekanandan@intel.com>
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

--===============1739692941597409467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/mocs: Initialize MOCS index early
URL   : https://patchwork.freedesktop.org/series/149256/
State : success

== Summary ==

CI Bug Log - changes from xe-3114-943adcb1bc226246125ec1d18a387b4295e73703_BAT -> xe-pw-149256v1_BAT
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

  * IGT: IGT_8369 -> IGT_8370
  * Linux: xe-3114-943adcb1bc226246125ec1d18a387b4295e73703 -> xe-pw-149256v1

  IGT_8369: 8369
  IGT_8370: 8370
  xe-3114-943adcb1bc226246125ec1d18a387b4295e73703: 943adcb1bc226246125ec1d18a387b4295e73703
  xe-pw-149256v1: 149256v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v1/index.html

--===============1739692941597409467==
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
<tr><td><b>Series:</b></td><td>drm/xe/mocs: Initialize MOCS index early</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149256/">https://patchwork.freedesktop.org/series/149256/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149256v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3114-943adcb1bc226246125ec1d18a387b4295e73703_BAT -&gt; xe-pw-149256v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8369 -&gt; IGT_8370</li>
<li>Linux: xe-3114-943adcb1bc226246125ec1d18a387b4295e73703 -&gt; xe-pw-149256v1</li>
</ul>
<p>IGT_8369: 8369<br />
  IGT_8370: 8370<br />
  xe-3114-943adcb1bc226246125ec1d18a387b4295e73703: 943adcb1bc226246125ec1d18a387b4295e73703<br />
  xe-pw-149256v1: 149256v1</p>

</body>
</html>

--===============1739692941597409467==--
