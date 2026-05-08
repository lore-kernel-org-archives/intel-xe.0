Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF75CD342F
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 05:44:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A7110E4CA;
	Fri,  8 May 2026 05:44:32 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9B010E2EF;
 Fri,  8 May 2026 05:44:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8485979815335366099=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/madvise=3A_Track_pur?=
 =?utf-8?q?geability_with_BO-local_counters_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 May 2026 05:44:31 -0000
Message-ID: <177821907149.50385.15043813813343186485@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260506132027.2556046-1-arvind.yadav@intel.com>
In-Reply-To: <20260506132027.2556046-1-arvind.yadav@intel.com>
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

--===============8485979815335366099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/madvise: Track purgeability with BO-local counters (rev4)
URL   : https://patchwork.freedesktop.org/series/165688/
State : success

== Summary ==

CI Bug Log - changes from xe-5022-be2e727379336fdc179be827a0041602be58a984_BAT -> xe-pw-165688v4_BAT
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

  * Linux: xe-5022-be2e727379336fdc179be827a0041602be58a984 -> xe-pw-165688v4

  IGT_8899: 3e5747e536f148bf232049e49a00e2b683f91a83 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5022-be2e727379336fdc179be827a0041602be58a984: be2e727379336fdc179be827a0041602be58a984
  xe-pw-165688v4: 165688v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165688v4/index.html

--===============8485979815335366099==
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
<tr><td><b>Series:</b></td><td>drm/xe/madvise: Track purgeability with BO-local counters (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165688/">https://patchwork.freedesktop.org/series/165688/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165688v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165688v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5022-be2e727379336fdc179be827a0041602be58a984_BAT -&gt; xe-pw-165688v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5022-be2e727379336fdc179be827a0041602be58a984 -&gt; xe-pw-165688v4</li>
</ul>
<p>IGT_8899: 3e5747e536f148bf232049e49a00e2b683f91a83 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5022-be2e727379336fdc179be827a0041602be58a984: be2e727379336fdc179be827a0041602be58a984<br />
  xe-pw-165688v4: 165688v4</p>

</body>
</html>

--===============8485979815335366099==--
