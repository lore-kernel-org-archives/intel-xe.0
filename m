Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787FDCFD36B
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 00:22:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1F610E32E;
	Tue, 25 Nov 2025 00:22:57 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AC910E32E;
 Tue, 25 Nov 2025 00:22:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4891968992620823082=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dp=3A_Restrict_max?=
 =?utf-8?q?_source_rate_for_WCL_to_HBR3_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Nov 2025 00:22:56 -0000
Message-ID: <176403017620.22750.9161578400586001236@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251114072712.161982-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20251114072712.161982-1-ankit.k.nautiyal@intel.com>
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

--===============4891968992620823082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Restrict max source rate for WCL to HBR3 (rev2)
URL   : https://patchwork.freedesktop.org/series/157560/
State : success

== Summary ==

CI Bug Log - changes from xe-4140-ed157ca0caebebe3af6d38ca0fb64a403c84ce77_BAT -> xe-pw-157560v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 10)
------------------------------

  Missing    (2): bat-atsm-2 bat-bmg-3 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4140-ed157ca0caebebe3af6d38ca0fb64a403c84ce77 -> xe-pw-157560v2

  IGT_8636: 254cd102396ff95d61f2ebe49fc09128878bf483 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4140-ed157ca0caebebe3af6d38ca0fb64a403c84ce77: ed157ca0caebebe3af6d38ca0fb64a403c84ce77
  xe-pw-157560v2: 157560v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157560v2/index.html

--===============4891968992620823082==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Restrict max source rate for WCL to HBR3 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157560/">https://patchwork.freedesktop.org/series/157560/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157560v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157560v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4140-ed157ca0caebebe3af6d38ca0fb64a403c84ce77_BAT -&gt; xe-pw-157560v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 10)</h2>
<p>Missing    (2): bat-atsm-2 bat-bmg-3 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4140-ed157ca0caebebe3af6d38ca0fb64a403c84ce77 -&gt; xe-pw-157560v2</li>
</ul>
<p>IGT_8636: 254cd102396ff95d61f2ebe49fc09128878bf483 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4140-ed157ca0caebebe3af6d38ca0fb64a403c84ce77: ed157ca0caebebe3af6d38ca0fb64a403c84ce77<br />
  xe-pw-157560v2: 157560v2</p>

</body>
</html>

--===============4891968992620823082==--
