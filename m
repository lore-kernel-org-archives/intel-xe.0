Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC40FCD4F3C
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 04:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4F310EA39;
	Tue, 19 May 2026 04:21:49 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E073D10E16E;
 Tue, 19 May 2026 04:21:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0389677492900334343=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Check_for_dead_co?=
 =?utf-8?q?nfig_space_on_reading_all_1s_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 May 2026 04:21:48 -0000
Message-ID: <177916450891.83627.18203448435538921727@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512060128.209698-1-arun.r.murthy@intel.com>
In-Reply-To: <20260512060128.209698-1-arun.r.murthy@intel.com>
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

--===============0389677492900334343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Check for dead config space on reading all 1s (rev2)
URL   : https://patchwork.freedesktop.org/series/166378/
State : success

== Summary ==

CI Bug Log - changes from xe-5088-ac60a9dd73e01e3f22825241c2f0498968cb2356_BAT -> xe-pw-166378v2_BAT
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

  * IGT: IGT_8918 -> IGT_8919
  * Linux: xe-5088-ac60a9dd73e01e3f22825241c2f0498968cb2356 -> xe-pw-166378v2

  IGT_8918: 8918
  IGT_8919: bc2525b8779d97f138a33d791696a04b56798b24 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5088-ac60a9dd73e01e3f22825241c2f0498968cb2356: ac60a9dd73e01e3f22825241c2f0498968cb2356
  xe-pw-166378v2: 166378v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166378v2/index.html

--===============0389677492900334343==
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
<tr><td><b>Series:</b></td><td>drm/xe: Check for dead config space on reading all 1s (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166378/">https://patchwork.freedesktop.org/series/166378/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166378v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166378v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5088-ac60a9dd73e01e3f22825241c2f0498968cb2356_BAT -&gt; xe-pw-166378v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8918 -&gt; IGT_8919</li>
<li>Linux: xe-5088-ac60a9dd73e01e3f22825241c2f0498968cb2356 -&gt; xe-pw-166378v2</li>
</ul>
<p>IGT_8918: 8918<br />
  IGT_8919: bc2525b8779d97f138a33d791696a04b56798b24 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5088-ac60a9dd73e01e3f22825241c2f0498968cb2356: ac60a9dd73e01e3f22825241c2f0498968cb2356<br />
  xe-pw-166378v2: 166378v2</p>

</body>
</html>

--===============0389677492900334343==--
