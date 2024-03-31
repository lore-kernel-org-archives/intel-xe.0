Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB96CD1284
	for <intel-xe@archiver.kernel.org>; Sun, 31 Mar 2024 15:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22AD10ED31;
	Sun, 31 Mar 2024 15:39:57 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE3110EB73;
 Sun, 31 Mar 2024 15:39:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4796586714731554795=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/hwmon=3A_Update_xe_hwmon_?=
 =?utf-8?q?with_couple_of_fixes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 31 Mar 2024 15:39:56 -0000
Message-ID: <171189959669.1097566.7436650722660446759@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240331145340.4065125-1-karthik.poosa@intel.com>
In-Reply-To: <20240331145340.4065125-1-karthik.poosa@intel.com>
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

--===============4796586714731554795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Update xe hwmon with couple of fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/131765/
State : failure

== Summary ==

CI Bug Log - changes from xe-1018-b334e21cd00347d48ee5e8e8ab0a69c91f97b036_BAT -> xe-pw-131765v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-131765v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-131765v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-131765v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@twice-cm-virtual-basic:
    - bat-pvc-2:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1018-b334e21cd00347d48ee5e8e8ab0a69c91f97b036/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131765v2/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-basic.html

  


Build changes
-------------

  * Linux: xe-1018-b334e21cd00347d48ee5e8e8ab0a69c91f97b036 -> xe-pw-131765v2

  IGT_7791: 7d7be3a56e299d9ad14ac2c6535a7e14b4cfd4df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1018-b334e21cd00347d48ee5e8e8ab0a69c91f97b036: b334e21cd00347d48ee5e8e8ab0a69c91f97b036
  xe-pw-131765v2: 131765v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131765v2/index.html

--===============4796586714731554795==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: Update xe hwmon with couple of fixes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131765/">https://patchwork.freedesktop.org/series/131765/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131765v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131765v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1018-b334e21cd00347d48ee5e8e8ab0a69c91f97b036_BAT -&gt; xe-pw-131765v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-131765v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-131765v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-131765v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_balancer@twice-cm-virtual-basic:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1018-b334e21cd00347d48ee5e8e8ab0a69c91f97b036/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131765v2/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-basic.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1018-b334e21cd00347d48ee5e8e8ab0a69c91f97b036 -&gt; xe-pw-131765v2</li>
</ul>
<p>IGT_7791: 7d7be3a56e299d9ad14ac2c6535a7e14b4cfd4df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1018-b334e21cd00347d48ee5e8e8ab0a69c91f97b036: b334e21cd00347d48ee5e8e8ab0a69c91f97b036<br />
  xe-pw-131765v2: 131765v2</p>

</body>
</html>

--===============4796586714731554795==--
