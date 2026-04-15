Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB132F9D0CE
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 02:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A901710E158;
	Wed, 15 Apr 2026 02:10:25 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAAA10E158;
 Wed, 15 Apr 2026 02:10:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1198739021003788599=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_=3A_drm/i915/display=3A_Use?=
 =?utf-8?q?_ceiling_division_for_NV12_UV_surface_offset_calculation_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Apr 2026 02:10:24 -0000
Message-ID: <177621902468.462761.5336390505479853246@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260411171521.162189-1-vidya.srinivas@intel.com>
In-Reply-To: <20260411171521.162189-1-vidya.srinivas@intel.com>
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

--===============1198739021003788599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: : drm/i915/display: Use ceiling division for NV12 UV surface offset calculation (rev2)
URL   : https://patchwork.freedesktop.org/series/164739/
State : success

== Summary ==

CI Bug Log - changes from xe-4902-19fc8405447f8b93c3fb0a341c00c2ffc6b05c4a_BAT -> xe-pw-164739v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-164739v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-ptl-2:          [SKIP][1] -> [PASS][2] +3 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4902-19fc8405447f8b93c3fb0a341c00c2ffc6b05c4a/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164739v2/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html

  


Build changes
-------------

  * IGT: IGT_8857 -> IGT_8858
  * Linux: xe-4902-19fc8405447f8b93c3fb0a341c00c2ffc6b05c4a -> xe-pw-164739v2

  IGT_8857: 7ed262f8dd72a12c8fbbb3d6a18c0753a2a2d57a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8858: f2486f2ab02d1163d864529f54a92066a3b9fe4b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4902-19fc8405447f8b93c3fb0a341c00c2ffc6b05c4a: 19fc8405447f8b93c3fb0a341c00c2ffc6b05c4a
  xe-pw-164739v2: 164739v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164739v2/index.html

--===============1198739021003788599==
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
<tr><td><b>Series:</b></td><td>: drm/i915/display: Use ceiling division for NV12 UV surface offset calculation (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164739/">https://patchwork.freedesktop.org/series/164739/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164739v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164739v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4902-19fc8405447f8b93c3fb0a341c00c2ffc6b05c4a_BAT -&gt; xe-pw-164739v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-164739v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_force_connector_basic@prune-stale-modes:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4902-19fc8405447f8b93c3fb0a341c00c2ffc6b05c4a/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164739v2/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8857 -&gt; IGT_8858</li>
<li>Linux: xe-4902-19fc8405447f8b93c3fb0a341c00c2ffc6b05c4a -&gt; xe-pw-164739v2</li>
</ul>
<p>IGT_8857: 7ed262f8dd72a12c8fbbb3d6a18c0753a2a2d57a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8858: f2486f2ab02d1163d864529f54a92066a3b9fe4b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4902-19fc8405447f8b93c3fb0a341c00c2ffc6b05c4a: 19fc8405447f8b93c3fb0a341c00c2ffc6b05c4a<br />
  xe-pw-164739v2: 164739v2</p>

</body>
</html>

--===============1198739021003788599==--
