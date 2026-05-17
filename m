Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD80CD4F47
	for <intel-xe@archiver.kernel.org>; Sun, 17 May 2026 18:09:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790FF10E295;
	Sun, 17 May 2026 18:09:46 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813B810E295;
 Sun, 17 May 2026 18:09:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8538509122725807146=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Revoke_drm=5Fvma?=
 =?utf-8?q?=5Fnode_on_xe=5Fmmio=5Fgem_destroy?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 17 May 2026 18:09:44 -0000
Message-ID: <177904138452.77796.17219699112334748267@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260517172408.1083275-1-shuicheng.lin@intel.com>
In-Reply-To: <20260517172408.1083275-1-shuicheng.lin@intel.com>
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

--===============8538509122725807146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Revoke drm_vma_node on xe_mmio_gem destroy
URL   : https://patchwork.freedesktop.org/series/166706/
State : success

== Summary ==

CI Bug Log - changes from xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40_BAT -> xe-pw-166706v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40 -> xe-pw-166706v1

  IGT_8917: 65d691069f26fc2a42c79e2364241320b85d48bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40: d47455904378e2bd24294dae67bfc7e442f58c40
  xe-pw-166706v1: 166706v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166706v1/index.html

--===============8538509122725807146==
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
<tr><td><b>Series:</b></td><td>drm/xe: Revoke drm_vma_node on xe_mmio_gem destroy</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166706/">https://patchwork.freedesktop.org/series/166706/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166706v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166706v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40_BAT -&gt; xe-pw-166706v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40 -&gt; xe-pw-166706v1</li>
</ul>
<p>IGT_8917: 65d691069f26fc2a42c79e2364241320b85d48bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5073-d47455904378e2bd24294dae67bfc7e442f58c40: d47455904378e2bd24294dae67bfc7e442f58c40<br />
  xe-pw-166706v1: 166706v1</p>

</body>
</html>

--===============8538509122725807146==--
