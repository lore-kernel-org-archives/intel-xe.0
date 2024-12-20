Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63467E77184
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 01:10:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE4710E4C9;
	Fri, 20 Dec 2024 01:10:06 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A082910E4BC;
 Fri, 20 Dec 2024 01:10:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8887973121332515376=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dmc=5Fwl=3A_Suppor?=
 =?utf-8?q?t_extra_values_for_dmc=5Fwl=5Fenable_for_debugging?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Dec 2024 01:10:05 -0000
Message-ID: <173465700565.605245.15416565332245700306@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241219221429.109668-1-gustavo.sousa@intel.com>
In-Reply-To: <20241219221429.109668-1-gustavo.sousa@intel.com>
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

--===============8887973121332515376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dmc_wl: Support extra values for dmc_wl_enable for debugging
URL   : https://patchwork.freedesktop.org/series/142854/
State : success

== Summary ==

CI Bug Log - changes from xe-2406-08a1cca88fef345cd29ee5f00fac2963b3647e99_BAT -> xe-pw-142854v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 7)
------------------------------

  Missing    (2): bat-lnl-2 bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2406-08a1cca88fef345cd29ee5f00fac2963b3647e99 -> xe-pw-142854v1

  IGT_8167: 6e93c2e807b398f24673d010f3f71986a09fef8f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2406-08a1cca88fef345cd29ee5f00fac2963b3647e99: 08a1cca88fef345cd29ee5f00fac2963b3647e99
  xe-pw-142854v1: 142854v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142854v1/index.html

--===============8887973121332515376==
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
<tr><td><b>Series:</b></td><td>drm/i915/dmc_wl: Support extra values for dmc_wl_enable for debugging</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142854/">https://patchwork.freedesktop.org/series/142854/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142854v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142854v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2406-08a1cca88fef345cd29ee5f00fac2963b3647e99_BAT -&gt; xe-pw-142854v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 7)</h2>
<p>Missing    (2): bat-lnl-2 bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2406-08a1cca88fef345cd29ee5f00fac2963b3647e99 -&gt; xe-pw-142854v1</li>
</ul>
<p>IGT_8167: 6e93c2e807b398f24673d010f3f71986a09fef8f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2406-08a1cca88fef345cd29ee5f00fac2963b3647e99: 08a1cca88fef345cd29ee5f00fac2963b3647e99<br />
  xe-pw-142854v1: 142854v1</p>

</body>
</html>

--===============8887973121332515376==--
