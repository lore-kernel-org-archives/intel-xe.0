Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1335DCA1005
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 00:22:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E78D10E08E;
	Wed,  3 Sep 2025 00:22:24 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB2910E08E;
 Wed,  3 Sep 2025 00:22:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2746990270229199947=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv5?=
 =?utf-8?q?=2C1/2=5D_drm/xe/mcr=3A_Make_xe=5Fgt=5Fmcr=5Fget=5Fdss=5Fsteering?=
 =?utf-8?q?=28=29_input_gt_a_const?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Sep 2025 00:22:23 -0000
Message-ID: <175685894351.296400.4308342239273713091@1538d3639d33>
X-Patchwork-Hint: ignore
References: <9dc621a90880f62ac8e2951afea7952277f7eb0e.1756855529.git.harish.chegondi@intel.com>
In-Reply-To: <9dc621a90880f62ac8e2951afea7952277f7eb0e.1756855529.git.harish.chegondi@intel.com>
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

--===============2746990270229199947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v5,1/2] drm/xe/mcr: Make xe_gt_mcr_get_dss_steering() input gt a const
URL   : https://patchwork.freedesktop.org/series/153911/
State : success

== Summary ==

CI Bug Log - changes from xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375_BAT -> xe-pw-153911v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-153911v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pat@pat-index-xe2@render:
    - bat-bmg-2:          [PASS][1] -> [FAIL][2] ([Intel XE#5507]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153911v1/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html

  
#### Possible fixes ####

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-1}:        [FAIL][3] ([Intel XE#5783]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153911v1/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html
    - {bat-ptl-2}:        [FAIL][5] ([Intel XE#5783]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153911v1/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8519 -> IGT_8520
  * Linux: xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375 -> xe-pw-153911v1

  IGT_8519: 8519
  IGT_8520: 8520
  xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375: 97a9560f0f1dd0a4472e669ff2188d0a8293b375
  xe-pw-153911v1: 153911v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153911v1/index.html

--===============2746990270229199947==
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
<tr><td><b>Series:</b></td><td>series starting with [v5,1/2] drm/xe/mcr: Make xe_gt_mcr_get_dss_steering() input gt a const</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153911/">https://patchwork.freedesktop.org/series/153911/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153911v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153911v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375_BAT -&gt; xe-pw-153911v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153911v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_pat@pat-index-xe2@render:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153911v1/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507">Intel XE#5507</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_vm@bind-execqueues-independent:<ul>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153911v1/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153911v1/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8519 -&gt; IGT_8520</li>
<li>Linux: xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375 -&gt; xe-pw-153911v1</li>
</ul>
<p>IGT_8519: 8519<br />
  IGT_8520: 8520<br />
  xe-3668-97a9560f0f1dd0a4472e669ff2188d0a8293b375: 97a9560f0f1dd0a4472e669ff2188d0a8293b375<br />
  xe-pw-153911v1: 153911v1</p>

</body>
</html>

--===============2746990270229199947==--
