Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15CFCD342F
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 08:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF9010E303;
	Fri,  8 May 2026 08:25:13 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BDF10E2FC;
 Fri,  8 May 2026 08:25:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6288927071375782500=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/buddy=3A_Integrate_lock?=
 =?utf-8?q?dep_annotations_for_gpu_buddy_manager_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 May 2026 08:25:12 -0000
Message-ID: <177822871232.50385.11045086736760494687@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260508065544.4049240-2-tejas.upadhyay@intel.com>
In-Reply-To: <20260508065544.4049240-2-tejas.upadhyay@intel.com>
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

--===============6288927071375782500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/buddy: Integrate lockdep annotations for gpu buddy manager (rev2)
URL   : https://patchwork.freedesktop.org/series/165720/
State : success

== Summary ==

CI Bug Log - changes from xe-5022-be2e727379336fdc179be827a0041602be58a984_BAT -> xe-pw-165720v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5022-be2e727379336fdc179be827a0041602be58a984 -> xe-pw-165720v2

  IGT_8899: 3e5747e536f148bf232049e49a00e2b683f91a83 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5022-be2e727379336fdc179be827a0041602be58a984: be2e727379336fdc179be827a0041602be58a984
  xe-pw-165720v2: 165720v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165720v2/index.html

--===============6288927071375782500==
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
<tr><td><b>Series:</b></td><td>drm/buddy: Integrate lockdep annotations for gpu buddy manager (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165720/">https://patchwork.freedesktop.org/series/165720/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165720v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165720v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5022-be2e727379336fdc179be827a0041602be58a984_BAT -&gt; xe-pw-165720v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5022-be2e727379336fdc179be827a0041602be58a984 -&gt; xe-pw-165720v2</li>
</ul>
<p>IGT_8899: 3e5747e536f148bf232049e49a00e2b683f91a83 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5022-be2e727379336fdc179be827a0041602be58a984: be2e727379336fdc179be827a0041602be58a984<br />
  xe-pw-165720v2: 165720v2</p>

</body>
</html>

--===============6288927071375782500==--
