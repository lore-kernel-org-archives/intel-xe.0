Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F33C87FD3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 18:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D16D10E307;
	Wed,  6 Aug 2025 18:09:31 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7B110E307;
 Wed,  6 Aug 2025 18:09:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4667679499252329396=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915=3A_drop_=5F=5Fto?=
 =?utf-8?q?=5Fintel=5Fdisplay=28=29_transitional_macro?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Aug 2025 18:09:29 -0000
Message-ID: <175450376963.217482.15686455936328117989@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1754499174.git.jani.nikula@intel.com>
In-Reply-To: <cover.1754499174.git.jani.nikula@intel.com>
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

--===============4667679499252329396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: drop __to_intel_display() transitional macro
URL   : https://patchwork.freedesktop.org/series/152595/
State : success

== Summary ==

CI Bug Log - changes from xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802_BAT -> xe-pw-152595v1_BAT
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

  * Linux: xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802 -> xe-pw-152595v1

  IGT_8487: 8487
  xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802: 886b8d8ef3839f604e3e7f6187ac6c46eb21b802
  xe-pw-152595v1: 152595v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152595v1/index.html

--===============4667679499252329396==
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
<tr><td><b>Series:</b></td><td>drm/i915: drop __to_intel_display() transitional macro</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152595/">https://patchwork.freedesktop.org/series/152595/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152595v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152595v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802_BAT -&gt; xe-pw-152595v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802 -&gt; xe-pw-152595v1</li>
</ul>
<p>IGT_8487: 8487<br />
  xe-3510-886b8d8ef3839f604e3e7f6187ac6c46eb21b802: 886b8d8ef3839f604e3e7f6187ac6c46eb21b802<br />
  xe-pw-152595v1: 152595v1</p>

</body>
</html>

--===============4667679499252329396==--
