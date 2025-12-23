Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CE7E6F061
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 07:22:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0496A10E0A5;
	Tue, 23 Dec 2025 07:22:59 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4EC10E0A5;
 Tue, 23 Dec 2025 07:22:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9151167003578580166=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/vdsc=3A_Account_fo?=
 =?utf-8?q?r_DSC_slice_overhead_in_intel=5Fvdsc=5Fmin=5Fcdclk=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Dec 2025 07:22:57 -0000
Message-ID: <176647457763.113517.9518430407596809313@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251222044443.2443411-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20251222044443.2443411-1-ankit.k.nautiyal@intel.com>
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

--===============9151167003578580166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/vdsc: Account for DSC slice overhead in intel_vdsc_min_cdclk()
URL   : https://patchwork.freedesktop.org/series/159356/
State : success

== Summary ==

CI Bug Log - changes from xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9_BAT -> xe-pw-159356v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-ptl-1 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9 -> xe-pw-159356v1

  IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9: f101d56dc32350daa45c130ff7a6d46512f614a9
  xe-pw-159356v1: 159356v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159356v1/index.html

--===============9151167003578580166==
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
<tr><td><b>Series:</b></td><td>drm/i915/vdsc: Account for DSC slice overhead in intel_vdsc_min_cdclk()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159356/">https://patchwork.freedesktop.org/series/159356/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159356v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159356v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9_BAT -&gt; xe-pw-159356v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-ptl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9 -&gt; xe-pw-159356v1</li>
</ul>
<p>IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4295-f101d56dc32350daa45c130ff7a6d46512f614a9: f101d56dc32350daa45c130ff7a6d46512f614a9<br />
  xe-pw-159356v1: 159356v1</p>

</body>
</html>

--===============9151167003578580166==--
