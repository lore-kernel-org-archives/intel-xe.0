Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFCBD3B996
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 21:07:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0A910E4E1;
	Tue,  9 Dec 2025 21:07:49 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5597D10E20F;
 Tue,  9 Dec 2025 21:07:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4543177853261048525=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_drm/xe=3A_Use_generic=5Fhandle=5Firq=5Fsafe_inside_heci_gsc_i?=
 =?utf-8?q?rq_handler?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Dec 2025 21:07:48 -0000
Message-ID: <176531446819.71614.2294193177241447926@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251209151319.494640-3-dev@lankhorst.se>
In-Reply-To: <20251209151319.494640-3-dev@lankhorst.se>
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

--===============4543177853261048525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe: Use generic_handle_irq_safe inside heci gsc irq handler
URL   : https://patchwork.freedesktop.org/series/158703/
State : success

== Summary ==

CI Bug Log - changes from xe-4210-55b19373186bc09befbc0068ee82a67ed9cfbc66_BAT -> xe-pw-158703v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-158703v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#6520])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4210-55b19373186bc09befbc0068ee82a67ed9cfbc66/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158703v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8659 -> IGT_8660
  * Linux: xe-4210-55b19373186bc09befbc0068ee82a67ed9cfbc66 -> xe-pw-158703v1

  IGT_8659: 8659
  IGT_8660: f4c6160d6eb6dfbb5ee03a33d5167c38f95b16c1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4210-55b19373186bc09befbc0068ee82a67ed9cfbc66: 55b19373186bc09befbc0068ee82a67ed9cfbc66
  xe-pw-158703v1: 158703v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158703v1/index.html

--===============4543177853261048525==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe: Use generic_handle_irq_safe inside heci gsc irq handler</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158703/">https://patchwork.freedesktop.org/series/158703/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158703v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158703v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4210-55b19373186bc09befbc0068ee82a67ed9cfbc66_BAT -&gt; xe-pw-158703v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158703v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4210-55b19373186bc09befbc0068ee82a67ed9cfbc66/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158703v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8659 -&gt; IGT_8660</li>
<li>Linux: xe-4210-55b19373186bc09befbc0068ee82a67ed9cfbc66 -&gt; xe-pw-158703v1</li>
</ul>
<p>IGT_8659: 8659<br />
  IGT_8660: f4c6160d6eb6dfbb5ee03a33d5167c38f95b16c1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4210-55b19373186bc09befbc0068ee82a67ed9cfbc66: 55b19373186bc09befbc0068ee82a67ed9cfbc66<br />
  xe-pw-158703v1: 158703v1</p>

</body>
</html>

--===============4543177853261048525==--
