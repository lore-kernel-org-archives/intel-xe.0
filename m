Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13423C83F17
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 22:15:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C346010E013;
	Fri, 18 Jul 2025 22:15:22 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9A710E013;
 Fri, 18 Jul 2025 22:15:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0055714961826619408=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_an_IS=5FERR?=
 =?utf-8?q?=28=29_vs_NULL_bug_in_xe=5Ftile=5Falloc=5Fvram=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Jul 2025 22:15:21 -0000
Message-ID: <175287692123.174289.4616096875105401326@1538d3639d33>
X-Patchwork-Hint: ignore
References: <5449065e-9758-4711-b706-78771c0753c4@sabinyo.mountain>
In-Reply-To: <5449065e-9758-4711-b706-78771c0753c4@sabinyo.mountain>
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

--===============0055714961826619408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix an IS_ERR() vs NULL bug in xe_tile_alloc_vram()
URL   : https://patchwork.freedesktop.org/series/151840/
State : success

== Summary ==

CI Bug Log - changes from xe-3441-a8e61e615995f6bc93361cf1752563140349517a_BAT -> xe-pw-151840v1_BAT
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

  * Linux: xe-3441-a8e61e615995f6bc93361cf1752563140349517a -> xe-pw-151840v1

  IGT_8468: 8468
  xe-3441-a8e61e615995f6bc93361cf1752563140349517a: a8e61e615995f6bc93361cf1752563140349517a
  xe-pw-151840v1: 151840v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151840v1/index.html

--===============0055714961826619408==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix an IS_ERR() vs NULL bug in xe_tile_alloc_vram()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151840/">https://patchwork.freedesktop.org/series/151840/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151840v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151840v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3441-a8e61e615995f6bc93361cf1752563140349517a_BAT -&gt; xe-pw-151840v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3441-a8e61e615995f6bc93361cf1752563140349517a -&gt; xe-pw-151840v1</li>
</ul>
<p>IGT_8468: 8468<br />
  xe-3441-a8e61e615995f6bc93361cf1752563140349517a: a8e61e615995f6bc93361cf1752563140349517a<br />
  xe-pw-151840v1: 151840v1</p>

</body>
</html>

--===============0055714961826619408==--
