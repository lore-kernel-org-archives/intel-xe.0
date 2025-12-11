Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52FCD3E78B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 03:34:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F10F10E29A;
	Thu, 11 Dec 2025 03:34:14 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D180610E29A;
 Thu, 11 Dec 2025 03:34:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8814943234480084161=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Introduce_SRIOV_scheduler_g?=
 =?utf-8?q?roups_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Dec 2025 03:34:12 -0000
Message-ID: <176542405282.75954.7810050350534728267@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
In-Reply-To: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
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

--===============8814943234480084161==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce SRIOV scheduler groups (rev3)
URL   : https://patchwork.freedesktop.org/series/158142/
State : success

== Summary ==

CI Bug Log - changes from xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b_BAT -> xe-pw-158142v3_BAT
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

  Here are the changes found in xe-pw-158142v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#6519])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v3/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * Linux: xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b -> xe-pw-158142v3

  IGT_8663: aca02d1cc9804e5f1868b0ebfba6426e2d1244fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b: 3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b
  xe-pw-158142v3: 158142v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v3/index.html

--===============8814943234480084161==
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
<tr><td><b>Series:</b></td><td>Introduce SRIOV scheduler groups (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158142/">https://patchwork.freedesktop.org/series/158142/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b_BAT -&gt; xe-pw-158142v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158142v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v3/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b -&gt; xe-pw-158142v3</li>
</ul>
<p>IGT_8663: aca02d1cc9804e5f1868b0ebfba6426e2d1244fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b: 3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b<br />
  xe-pw-158142v3: 158142v3</p>

</body>
</html>

--===============8814943234480084161==--
