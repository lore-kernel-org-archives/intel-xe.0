Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF58CC5478C
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 16:40:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1BE10E7B0;
	Mon, 26 Feb 2024 16:40:47 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0C610E7B0;
 Mon, 26 Feb 2024 16:40:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0542462144751385437=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Use_vmalloc_for_array_?=
 =?utf-8?q?of_bind_allocation_in_bind_IOCTL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Feb 2024 16:40:46 -0000
Message-ID: <170896564691.299440.17850267592500784280@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240226155554.103384-1-matthew.brost@intel.com>
In-Reply-To: <20240226155554.103384-1-matthew.brost@intel.com>
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

--===============0542462144751385437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use vmalloc for array of bind allocation in bind IOCTL (rev2)
URL   : https://patchwork.freedesktop.org/series/130325/
State : success

== Summary ==

CI Bug Log - changes from xe-850-38fda817eef183ba1148050499ab1a275f45f934_BAT -> xe-pw-130325v2_BAT
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

  Here are the changes found in xe-pw-130325v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-dg2-oem2:       [PASS][1] -> [INCOMPLETE][2] ([Intel XE#1169])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-850-38fda817eef183ba1148050499ab1a275f45f934/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130325v2/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169


Build changes
-------------

  * IGT: IGT_7729 -> IGT_7730
  * Linux: xe-850-38fda817eef183ba1148050499ab1a275f45f934 -> xe-pw-130325v2

  IGT_7729: 7729
  IGT_7730: f1d5ac403fd54723de838b7184bcee4170c31059 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-850-38fda817eef183ba1148050499ab1a275f45f934: 38fda817eef183ba1148050499ab1a275f45f934
  xe-pw-130325v2: 130325v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130325v2/index.html

--===============0542462144751385437==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use vmalloc for array of bind allocation in bind IOCTL (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130325/">https://patchwork.freedesktop.org/series/130325/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130325v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130325v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-850-38fda817eef183ba1148050499ab1a275f45f934_BAT -&gt; xe-pw-130325v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-130325v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-basic:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-850-38fda817eef183ba1148050499ab1a275f45f934/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130325v2/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7729 -&gt; IGT_7730</li>
<li>Linux: xe-850-38fda817eef183ba1148050499ab1a275f45f934 -&gt; xe-pw-130325v2</li>
</ul>
<p>IGT_7729: 7729<br />
  IGT_7730: f1d5ac403fd54723de838b7184bcee4170c31059 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-850-38fda817eef183ba1148050499ab1a275f45f934: 38fda817eef183ba1148050499ab1a275f45f934<br />
  xe-pw-130325v2: 130325v2</p>

</body>
</html>

--===============0542462144751385437==--
