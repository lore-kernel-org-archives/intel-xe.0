Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8831AD3B9AB
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 21:19:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EF610E27E;
	Wed, 10 Dec 2025 21:19:55 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E1410E27E;
 Wed, 10 Dec 2025 21:19:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3212196911781664593=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe=5Fguc=5Fct=3A_Pre?=
 =?utf-8?q?vent_compiler_read/write_optimization_breaks_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Dec 2025 21:19:54 -0000
Message-ID: <176540159468.74580.10545808008533869553@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251210174412.71084-2-jonathan.cavitt@intel.com>
In-Reply-To: <20251210174412.71084-2-jonathan.cavitt@intel.com>
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

--===============3212196911781664593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_guc_ct: Prevent compiler read/write optimization breaks (rev2)
URL   : https://patchwork.freedesktop.org/series/158723/
State : success

== Summary ==

CI Bug Log - changes from xe-4218-474dafdcaf4e88df55d19684ff32a654ad0e8fd3_BAT -> xe-pw-158723v2_BAT
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

  Here are the changes found in xe-pw-158723v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#6520])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4218-474dafdcaf4e88df55d19684ff32a654ad0e8fd3/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v2/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8662 -> IGT_8663
  * Linux: xe-4218-474dafdcaf4e88df55d19684ff32a654ad0e8fd3 -> xe-pw-158723v2

  IGT_8662: 9410b6926f317e8bf824502394e09ee8753ff65e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8663: aca02d1cc9804e5f1868b0ebfba6426e2d1244fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4218-474dafdcaf4e88df55d19684ff32a654ad0e8fd3: 474dafdcaf4e88df55d19684ff32a654ad0e8fd3
  xe-pw-158723v2: 158723v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v2/index.html

--===============3212196911781664593==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_guc_ct: Prevent compiler read/write optimization breaks (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158723/">https://patchwork.freedesktop.org/series/158723/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4218-474dafdcaf4e88df55d19684ff32a654ad0e8fd3_BAT -&gt; xe-pw-158723v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158723v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4218-474dafdcaf4e88df55d19684ff32a654ad0e8fd3/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158723v2/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8662 -&gt; IGT_8663</li>
<li>Linux: xe-4218-474dafdcaf4e88df55d19684ff32a654ad0e8fd3 -&gt; xe-pw-158723v2</li>
</ul>
<p>IGT_8662: 9410b6926f317e8bf824502394e09ee8753ff65e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8663: aca02d1cc9804e5f1868b0ebfba6426e2d1244fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4218-474dafdcaf4e88df55d19684ff32a654ad0e8fd3: 474dafdcaf4e88df55d19684ff32a654ad0e8fd3<br />
  xe-pw-158723v2: 158723v2</p>

</body>
</html>

--===============3212196911781664593==--
