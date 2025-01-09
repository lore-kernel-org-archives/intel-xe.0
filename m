Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE36E77197
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 19:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA57E10EF09;
	Thu,  9 Jan 2025 19:00:30 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF9F10EF09;
 Thu,  9 Jan 2025 19:00:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2958519399011355913=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/ptl=3A_Apply_Wa=5F14?=
 =?utf-8?q?023061436_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Jan 2025 19:00:30 -0000
Message-ID: <173644923024.1708354.8279812336675333306@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250108141323.311601-1-nirmoy.das@intel.com>
In-Reply-To: <20250108141323.311601-1-nirmoy.das@intel.com>
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

--===============2958519399011355913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/ptl: Apply Wa_14023061436 (rev3)
URL   : https://patchwork.freedesktop.org/series/142359/
State : success

== Summary ==

CI Bug Log - changes from xe-2463-424f495e9572bf87a42e3be0aa02ac4777541033_BAT -> xe-pw-142359v3_BAT
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

  * Linux: xe-2463-424f495e9572bf87a42e3be0aa02ac4777541033 -> xe-pw-142359v3

  IGT_8184: ee7a3ac616f55f6ed1b959ff951237099bda86d8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2463-424f495e9572bf87a42e3be0aa02ac4777541033: 424f495e9572bf87a42e3be0aa02ac4777541033
  xe-pw-142359v3: 142359v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142359v3/index.html

--===============2958519399011355913==
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
<tr><td><b>Series:</b></td><td>drm/xe/ptl: Apply Wa_14023061436 (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142359/">https://patchwork.freedesktop.org/series/142359/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142359v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142359v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2463-424f495e9572bf87a42e3be0aa02ac4777541033_BAT -&gt; xe-pw-142359v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2463-424f495e9572bf87a42e3be0aa02ac4777541033 -&gt; xe-pw-142359v3</li>
</ul>
<p>IGT_8184: ee7a3ac616f55f6ed1b959ff951237099bda86d8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2463-424f495e9572bf87a42e3be0aa02ac4777541033: 424f495e9572bf87a42e3be0aa02ac4777541033<br />
  xe-pw-142359v3: 142359v3</p>

</body>
</html>

--===============2958519399011355913==--
