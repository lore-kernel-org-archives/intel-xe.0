Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0DDC54798
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 10:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D212D1129CC;
	Tue,  5 Mar 2024 10:15:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489051129CA;
 Tue,  5 Mar 2024 10:15:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6022963442626765384=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm=3A_enable_W=3D1_warnings_by_?=
 =?utf-8?q?default_across_the_subsystem_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Mar 2024 10:15:51 -0000
Message-ID: <170963375129.524258.5441163374455898704@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1709629403.git.jani.nikula@intel.com>
In-Reply-To: <cover.1709629403.git.jani.nikula@intel.com>
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

--===============6022963442626765384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm: enable W=1 warnings by default across the subsystem (rev2)
URL   : https://patchwork.freedesktop.org/series/129421/
State : success

== Summary ==

CI Bug Log - changes from xe-894-584470e30ce51c5e1481bffe998f81e251113709_BAT -> xe-pw-129421v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-dg2-oem2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-894-584470e30ce51c5e1481bffe998f81e251113709 -> xe-pw-129421v2

  IGT_7745: 838ad56bf511c1caf56851c661fb5828c0440e3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-894-584470e30ce51c5e1481bffe998f81e251113709: 584470e30ce51c5e1481bffe998f81e251113709
  xe-pw-129421v2: 129421v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129421v2/index.html

--===============6022963442626765384==
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
<tr><td><b>Series:</b></td><td>drm: enable W=1 warnings by default across the subsystem (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129421/">https://patchwork.freedesktop.org/series/129421/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129421v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129421v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-894-584470e30ce51c5e1481bffe998f81e251113709_BAT -&gt; xe-pw-129421v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-894-584470e30ce51c5e1481bffe998f81e251113709 -&gt; xe-pw-129421v2</li>
</ul>
<p>IGT_7745: 838ad56bf511c1caf56851c661fb5828c0440e3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-894-584470e30ce51c5e1481bffe998f81e251113709: 584470e30ce51c5e1481bffe998f81e251113709<br />
  xe-pw-129421v2: 129421v2</p>

</body>
</html>

--===============6022963442626765384==--
