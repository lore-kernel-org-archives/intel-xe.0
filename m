Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBECC48291
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 17:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEB510EF92;
	Fri,  2 Feb 2024 17:01:20 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03AC10EF92;
 Fri,  2 Feb 2024 17:01:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2235175158289170924=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5BCI=2C1/3?=
 =?utf-8?q?=5D_drm=3A_Add_drm=5Fvblank=5Fwork=5Fflush=5Fall=28=29=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 Feb 2024 17:01:19 -0000
Message-ID: <170689327965.952433.1503149500278204628@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240202154423.834991-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240202154423.834991-1-maarten.lankhorst@linux.intel.com>
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

--===============2235175158289170924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/3] drm: Add drm_vblank_work_flush_all().
URL   : https://patchwork.freedesktop.org/series/129477/
State : success

== Summary ==

CI Bug Log - changes from xe-718-1dd92467500a5ead3e44bbdfe15e064dd79b65ef_BAT -> xe-pw-129477v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-129477v1_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-atsm-2:         [SKIP][1] ([Intel XE#288]) -> [SKIP][2] ([Intel XE#1130])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-718-1dd92467500a5ead3e44bbdfe15e064dd79b65ef/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129477v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html

  
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288


Build changes
-------------

  * Linux: xe-718-1dd92467500a5ead3e44bbdfe15e064dd79b65ef -> xe-pw-129477v1

  IGT_7702: bf075a74ece1956fc0e554291591b9da3eab54cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-718-1dd92467500a5ead3e44bbdfe15e064dd79b65ef: 1dd92467500a5ead3e44bbdfe15e064dd79b65ef
  xe-pw-129477v1: 129477v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129477v1/index.html

--===============2235175158289170924==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/3] drm: Add drm_vblank_work_flush_all().</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129477/">https://patchwork.freedesktop.org/series/129477/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129477v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129477v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-718-1dd92467500a5ead3e44bbdfe15e064dd79b65ef_BAT -&gt; xe-pw-129477v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-129477v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-basic:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-718-1dd92467500a5ead3e44bbdfe15e064dd79b65ef/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129477v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-718-1dd92467500a5ead3e44bbdfe15e064dd79b65ef -&gt; xe-pw-129477v1</li>
</ul>
<p>IGT_7702: bf075a74ece1956fc0e554291591b9da3eab54cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-718-1dd92467500a5ead3e44bbdfe15e064dd79b65ef: 1dd92467500a5ead3e44bbdfe15e064dd79b65ef<br />
  xe-pw-129477v1: 129477v1</p>

</body>
</html>

--===============2235175158289170924==--
