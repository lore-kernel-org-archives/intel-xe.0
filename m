Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00971C8303C
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 17:43:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC41410E505;
	Mon,  7 Jul 2025 17:43:20 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A8F10E505;
 Mon,  7 Jul 2025 17:43:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8258871625258450284=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_Allow_a?=
 =?utf-8?q?sync_flips_on_planes_with_no_framebuffer_changes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naveen Kumar" <naveen1.kumar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Jul 2025 17:43:19 -0000
Message-ID: <175191019959.140955.4221217010209563333@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250707154121.74969-1-naveen1.kumar@intel.com>
In-Reply-To: <20250707154121.74969-1-naveen1.kumar@intel.com>
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

--===============8258871625258450284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Allow async flips on planes with no framebuffer changes
URL   : https://patchwork.freedesktop.org/series/151279/
State : success

== Summary ==

CI Bug Log - changes from xe-3365-17e70ec7d93c01d943dba448b407ec3dc74e3ea7_BAT -> xe-pw-151279v1_BAT
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

  * Linux: xe-3365-17e70ec7d93c01d943dba448b407ec3dc74e3ea7 -> xe-pw-151279v1

  IGT_8445: 8445
  xe-3365-17e70ec7d93c01d943dba448b407ec3dc74e3ea7: 17e70ec7d93c01d943dba448b407ec3dc74e3ea7
  xe-pw-151279v1: 151279v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151279v1/index.html

--===============8258871625258450284==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Allow async flips on planes with no framebuffer changes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151279/">https://patchwork.freedesktop.org/series/151279/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151279v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151279v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3365-17e70ec7d93c01d943dba448b407ec3dc74e3ea7_BAT -&gt; xe-pw-151279v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3365-17e70ec7d93c01d943dba448b407ec3dc74e3ea7 -&gt; xe-pw-151279v1</li>
</ul>
<p>IGT_8445: 8445<br />
  xe-3365-17e70ec7d93c01d943dba448b407ec3dc74e3ea7: 17e70ec7d93c01d943dba448b407ec3dc74e3ea7<br />
  xe-pw-151279v1: 151279v1</p>

</body>
</html>

--===============8258871625258450284==--
