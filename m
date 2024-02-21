Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0BEC48BEB
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 16:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F27E10E002;
	Wed, 21 Feb 2024 16:40:48 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D35810E187;
 Wed, 21 Feb 2024 16:40:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0974109807698512235=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/uapi=3A_Remove_unused_fla?=
 =?utf-8?q?gs_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Feb 2024 16:40:47 -0000
Message-ID: <170853364751.196549.12513467426006513402@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240221155930.7-1-francois.dugast@intel.com>
In-Reply-To: <20240221155930.7-1-francois.dugast@intel.com>
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

--===============0974109807698512235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uapi: Remove unused flags (rev3)
URL   : https://patchwork.freedesktop.org/series/129781/
State : failure

== Summary ==

CI Bug Log - changes from xe-817-d528e13ba6b7bd7ed6ea2f973a70341ee93063af_BAT -> xe-pw-129781v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-129781v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-129781v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-129781v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - bat-pvc-2:          [PASS][1] -> [FAIL][2] +9 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-817-d528e13ba6b7bd7ed6ea2f973a70341ee93063af/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129781v3/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  


Build changes
-------------

  * Linux: xe-817-d528e13ba6b7bd7ed6ea2f973a70341ee93063af -> xe-pw-129781v3

  IGT_7719: 7719
  xe-817-d528e13ba6b7bd7ed6ea2f973a70341ee93063af: d528e13ba6b7bd7ed6ea2f973a70341ee93063af
  xe-pw-129781v3: 129781v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129781v3/index.html

--===============0974109807698512235==
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
<tr><td><b>Series:</b></td><td>drm/xe/uapi: Remove unused flags (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129781/">https://patchwork.freedesktop.org/series/129781/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129781v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129781v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-817-d528e13ba6b7bd7ed6ea2f973a70341ee93063af_BAT -&gt; xe-pw-129781v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-129781v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-129781v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-129781v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-817-d528e13ba6b7bd7ed6ea2f973a70341ee93063af/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129781v3/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-817-d528e13ba6b7bd7ed6ea2f973a70341ee93063af -&gt; xe-pw-129781v3</li>
</ul>
<p>IGT_7719: 7719<br />
  xe-817-d528e13ba6b7bd7ed6ea2f973a70341ee93063af: d528e13ba6b7bd7ed6ea2f973a70341ee93063af<br />
  xe-pw-129781v3: 129781v3</p>

</body>
</html>

--===============0974109807698512235==--
