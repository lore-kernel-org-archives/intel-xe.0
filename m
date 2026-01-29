Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F3FD358D2
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 08:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CD210E7FC;
	Thu, 29 Jan 2026 08:05:57 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF1D10E7FC;
 Thu, 29 Jan 2026 08:05:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6079500248027098520=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_Wait_fo?=
 =?utf-8?q?r_pipe_start_to_avoid_vblank_and_scanline_jumps_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Jan 2026 08:05:56 -0000
Message-ID: <176967395616.203577.7522553351800770071@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260119043025.589754-1-suraj.kandpal@intel.com>
In-Reply-To: <20260119043025.589754-1-suraj.kandpal@intel.com>
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

--===============6079500248027098520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Wait for pipe start to avoid vblank and scanline jumps (rev2)
URL   : https://patchwork.freedesktop.org/series/160261/
State : success

== Summary ==

CI Bug Log - changes from xe-4467-6a3c9a03d943eb112c916c7419a837bc7de3a296_BAT -> xe-pw-160261v2_BAT
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

  Here are the changes found in xe-pw-160261v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [TIMEOUT][1] ([Intel XE#6506]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4467-6a3c9a03d943eb112c916c7419a837bc7de3a296/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v2/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506


Build changes
-------------

  * IGT: IGT_8723 -> IGT_8724
  * Linux: xe-4467-6a3c9a03d943eb112c916c7419a837bc7de3a296 -> xe-pw-160261v2

  IGT_8723: 8723
  IGT_8724: 6a10d1136a4e856cc4ceb5b899c32b03ed8ddc5e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4467-6a3c9a03d943eb112c916c7419a837bc7de3a296: 6a3c9a03d943eb112c916c7419a837bc7de3a296
  xe-pw-160261v2: 160261v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v2/index.html

--===============6079500248027098520==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Wait for pipe start to avoid vblank and scanline jumps (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160261/">https://patchwork.freedesktop.org/series/160261/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4467-6a3c9a03d943eb112c916c7419a837bc7de3a296_BAT -&gt; xe-pw-160261v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160261v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4467-6a3c9a03d943eb112c916c7419a837bc7de3a296/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160261v2/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8723 -&gt; IGT_8724</li>
<li>Linux: xe-4467-6a3c9a03d943eb112c916c7419a837bc7de3a296 -&gt; xe-pw-160261v2</li>
</ul>
<p>IGT_8723: 8723<br />
  IGT_8724: 6a10d1136a4e856cc4ceb5b899c32b03ed8ddc5e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4467-6a3c9a03d943eb112c916c7419a837bc7de3a296: 6a3c9a03d943eb112c916c7419a837bc7de3a296<br />
  xe-pw-160261v2: 160261v2</p>

</body>
</html>

--===============6079500248027098520==--
