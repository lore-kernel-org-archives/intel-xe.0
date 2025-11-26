Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7645CD1119B
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 21:40:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B92110E6DC;
	Wed, 26 Nov 2025 21:40:28 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B2610E6ED;
 Wed, 26 Nov 2025 21:40:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8953702275369033858=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Fix_DRM_scheduler_layering_?=
 =?utf-8?q?violations_in_Xe_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Nov 2025 21:40:26 -0000
Message-ID: <176419322654.30433.358283181012636312@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251126201916.618996-1-matthew.brost@intel.com>
In-Reply-To: <20251126201916.618996-1-matthew.brost@intel.com>
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

--===============8953702275369033858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix DRM scheduler layering violations in Xe (rev5)
URL   : https://patchwork.freedesktop.org/series/155314/
State : success

== Summary ==

CI Bug Log - changes from xe-4155-e41f42483c6f784fce3deb5eca0931bcbffb01df_BAT -> xe-pw-155314v5_BAT
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

  Here are the changes found in xe-pw-155314v5_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [TIMEOUT][1] ([Intel XE#6506]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4155-e41f42483c6f784fce3deb5eca0931bcbffb01df/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v5/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#6519]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4155-e41f42483c6f784fce3deb5eca0931bcbffb01df/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v5/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * Linux: xe-4155-e41f42483c6f784fce3deb5eca0931bcbffb01df -> xe-pw-155314v5

  IGT_8639: 2ce563031e6b2ec91479f6af8c326d25c15bdb26 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4155-e41f42483c6f784fce3deb5eca0931bcbffb01df: e41f42483c6f784fce3deb5eca0931bcbffb01df
  xe-pw-155314v5: 155314v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v5/index.html

--===============8953702275369033858==
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
<tr><td><b>Series:</b></td><td>Fix DRM scheduler layering violations in Xe (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155314/">https://patchwork.freedesktop.org/series/155314/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4155-e41f42483c6f784fce3deb5eca0931bcbffb01df_BAT -&gt; xe-pw-155314v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155314v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4155-e41f42483c6f784fce3deb5eca0931bcbffb01df/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v5/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4155-e41f42483c6f784fce3deb5eca0931bcbffb01df/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v5/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4155-e41f42483c6f784fce3deb5eca0931bcbffb01df -&gt; xe-pw-155314v5</li>
</ul>
<p>IGT_8639: 2ce563031e6b2ec91479f6af8c326d25c15bdb26 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4155-e41f42483c6f784fce3deb5eca0931bcbffb01df: e41f42483c6f784fce3deb5eca0931bcbffb01df<br />
  xe-pw-155314v5: 155314v5</p>

</body>
</html>

--===============8953702275369033858==--
