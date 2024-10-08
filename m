Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3CFCEF16B
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 12:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A2510E521;
	Tue,  8 Oct 2024 12:58:35 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD3910E520;
 Tue,  8 Oct 2024 12:58:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0030342285047410543=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm=3A_Introduce_DRM_client_libr?=
 =?utf-8?q?ary_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Oct 2024 12:58:34 -0000
Message-ID: <172839231443.1203913.13107314757476749058@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241008120652.159190-1-tzimmermann@suse.de>
In-Reply-To: <20241008120652.159190-1-tzimmermann@suse.de>
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

--===============0030342285047410543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm: Introduce DRM client library (rev3)
URL   : https://patchwork.freedesktop.org/series/139220/
State : success

== Summary ==

CI Bug Log - changes from xe-2022-131a5dd267541faa13894b97d44af39b257fc887_BAT -> xe-pw-139220v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-7 

Known issues
------------

  Here are the changes found in xe-pw-139220v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#2754])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2022-131a5dd267541faa13894b97d44af39b257fc887/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139220v3/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754


Build changes
-------------

  * IGT: IGT_8056 -> IGT_8058
  * Linux: xe-2022-131a5dd267541faa13894b97d44af39b257fc887 -> xe-pw-139220v3

  IGT_8056: a327720fd57ba9f17ed8f15c6453cd2234f9398d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8058: f5b25de73fc0216d2cac08bd58c72de355f75d7c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2022-131a5dd267541faa13894b97d44af39b257fc887: 131a5dd267541faa13894b97d44af39b257fc887
  xe-pw-139220v3: 139220v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139220v3/index.html

--===============0030342285047410543==
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
<tr><td><b>Series:</b></td><td>drm: Introduce DRM client library (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139220/">https://patchwork.freedesktop.org/series/139220/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139220v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139220v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2022-131a5dd267541faa13894b97d44af39b257fc887_BAT -&gt; xe-pw-139220v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139220v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-userptr-invalidate:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2022-131a5dd267541faa13894b97d44af39b257fc887/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139220v3/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8056 -&gt; IGT_8058</li>
<li>Linux: xe-2022-131a5dd267541faa13894b97d44af39b257fc887 -&gt; xe-pw-139220v3</li>
</ul>
<p>IGT_8056: a327720fd57ba9f17ed8f15c6453cd2234f9398d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8058: f5b25de73fc0216d2cac08bd58c72de355f75d7c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2022-131a5dd267541faa13894b97d44af39b257fc887: 131a5dd267541faa13894b97d44af39b257fc887<br />
  xe-pw-139220v3: 139220v3</p>

</body>
</html>

--===============0030342285047410543==--
