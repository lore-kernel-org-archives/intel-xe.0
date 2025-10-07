Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA30CCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 22:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930CB10E716;
	Tue,  7 Oct 2025 22:51:11 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C910410E716;
 Tue,  7 Oct 2025 22:51:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1653074295074071782=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/fbc=3A_update_the_?=
 =?utf-8?q?impacted_platforms_in_wa=5F22014263786_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Oct 2025 22:51:10 -0000
Message-ID: <175987747077.15077.18324039142691369692@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251007214317.875781-1-vinod.govindapillai@intel.com>
In-Reply-To: <20251007214317.875781-1-vinod.govindapillai@intel.com>
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

--===============1653074295074071782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/fbc: update the impacted platforms in wa_22014263786 (rev3)
URL   : https://patchwork.freedesktop.org/series/154950/
State : success

== Summary ==

CI Bug Log - changes from xe-3883-679a7939422e7585cce7bf5d3350fc522e765343_BAT -> xe-pw-154950v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3883-679a7939422e7585cce7bf5d3350fc522e765343 -> xe-pw-154950v3

  IGT_8575: 7efc313da1339df43a1b11bba57fef6c1257e65f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3883-679a7939422e7585cce7bf5d3350fc522e765343: 679a7939422e7585cce7bf5d3350fc522e765343
  xe-pw-154950v3: 154950v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154950v3/index.html

--===============1653074295074071782==
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
<tr><td><b>Series:</b></td><td>drm/i915/fbc: update the impacted platforms in wa_22014263786 (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154950/">https://patchwork.freedesktop.org/series/154950/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154950v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154950v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3883-679a7939422e7585cce7bf5d3350fc522e765343_BAT -&gt; xe-pw-154950v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3883-679a7939422e7585cce7bf5d3350fc522e765343 -&gt; xe-pw-154950v3</li>
</ul>
<p>IGT_8575: 7efc313da1339df43a1b11bba57fef6c1257e65f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3883-679a7939422e7585cce7bf5d3350fc522e765343: 679a7939422e7585cce7bf5d3350fc522e765343<br />
  xe-pw-154950v3: 154950v3</p>

</body>
</html>

--===============1653074295074071782==--
