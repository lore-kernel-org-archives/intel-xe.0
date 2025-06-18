Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE59C71157
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 16:45:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7573E10E8EC;
	Wed, 18 Jun 2025 16:45:47 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3262710E8EA;
 Wed, 18 Jun 2025 16:45:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6413322414061847162=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/vrr=3A_fix_registe?=
 =?utf-8?q?r_file_style?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Jun 2025 16:45:46 -0000
Message-ID: <175026514619.92702.17317227748800729368@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250618155137.1651865-1-jani.nikula@intel.com>
In-Reply-To: <20250618155137.1651865-1-jani.nikula@intel.com>
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

--===============6413322414061847162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/vrr: fix register file style
URL   : https://patchwork.freedesktop.org/series/150474/
State : success

== Summary ==

CI Bug Log - changes from xe-3272-55cbd02fa784e94b4f658c1e547371ac804c62a9_BAT -> xe-pw-150474v1_BAT
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

  * IGT: IGT_8415 -> IGT_8417
  * Linux: xe-3272-55cbd02fa784e94b4f658c1e547371ac804c62a9 -> xe-pw-150474v1

  IGT_8415: bd8a24cf051c1efb81c76cf58a56151990a4a8ea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8417: 8417
  xe-3272-55cbd02fa784e94b4f658c1e547371ac804c62a9: 55cbd02fa784e94b4f658c1e547371ac804c62a9
  xe-pw-150474v1: 150474v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150474v1/index.html

--===============6413322414061847162==
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
<tr><td><b>Series:</b></td><td>drm/i915/vrr: fix register file style</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150474/">https://patchwork.freedesktop.org/series/150474/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150474v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150474v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3272-55cbd02fa784e94b4f658c1e547371ac804c62a9_BAT -&gt; xe-pw-150474v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8415 -&gt; IGT_8417</li>
<li>Linux: xe-3272-55cbd02fa784e94b4f658c1e547371ac804c62a9 -&gt; xe-pw-150474v1</li>
</ul>
<p>IGT_8415: bd8a24cf051c1efb81c76cf58a56151990a4a8ea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8417: 8417<br />
  xe-3272-55cbd02fa784e94b4f658c1e547371ac804c62a9: 55cbd02fa784e94b4f658c1e547371ac804c62a9<br />
  xe-pw-150474v1: 150474v1</p>

</body>
</html>

--===============6413322414061847162==--
