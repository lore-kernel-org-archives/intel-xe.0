Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B9FC54E60
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 04:53:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A9510E142;
	Tue, 19 Mar 2024 04:53:22 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C495210E476;
 Tue, 19 Mar 2024 04:53:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0005635837677959924=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Modify_minimum_of_vari?=
 =?utf-8?q?ous_scheduler_timeout_to_0=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Mar 2024 04:53:20 -0000
Message-ID: <171082400080.900715.15707701971866993320@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240308110058.2479126-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240308110058.2479126-1-himal.prasad.ghimiray@intel.com>
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

--===============0005635837677959924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Modify minimum of various scheduler timeout to 0. (rev2)
URL   : https://patchwork.freedesktop.org/series/130913/
State : failure

== Summary ==

CI Bug Log - changes from xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9_BAT -> xe-pw-130913v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-130913v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-130913v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-130913v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_sysfs_defaults@engine-defaults:
    - bat-pvc-2:          [PASS][1] -> [FAIL][2] +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9/bat-pvc-2/igt@xe_sysfs_defaults@engine-defaults.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v2/bat-pvc-2/igt@xe_sysfs_defaults@engine-defaults.html
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] +5 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9/bat-dg2-oem2/igt@xe_sysfs_defaults@engine-defaults.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v2/bat-dg2-oem2/igt@xe_sysfs_defaults@engine-defaults.html
    - bat-atsm-2:         [PASS][5] -> [FAIL][6] +5 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9/bat-atsm-2/igt@xe_sysfs_defaults@engine-defaults.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v2/bat-atsm-2/igt@xe_sysfs_defaults@engine-defaults.html

  * igt@xe_sysfs_defaults@engine-defaults@bcs:
    - bat-adlp-7:         [PASS][7] -> [FAIL][8] +4 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9/bat-adlp-7/igt@xe_sysfs_defaults@engine-defaults@bcs.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v2/bat-adlp-7/igt@xe_sysfs_defaults@engine-defaults@bcs.html

  
Known issues
------------

  Here are the changes found in xe-pw-130913v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-dg2-oem2:       [PASS][9] -> [FAIL][10] ([Intel XE#1259])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v2/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259


Build changes
-------------

  * Linux: xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9 -> xe-pw-130913v2

  IGT_7769: 7769
  xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9: e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9
  xe-pw-130913v2: 130913v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v2/index.html

--===============0005635837677959924==
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
<tr><td><b>Series:</b></td><td>drm/xe: Modify minimum of various scheduler timeout to 0. (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130913/">https://patchwork.freedesktop.org/series/130913/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9_BAT -&gt; xe-pw-130913v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-130913v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-130913v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-130913v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_sysfs_defaults@engine-defaults:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9/bat-pvc-2/igt@xe_sysfs_defaults@engine-defaults.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v2/bat-pvc-2/igt@xe_sysfs_defaults@engine-defaults.html">FAIL</a> +2 other tests fail</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9/bat-dg2-oem2/igt@xe_sysfs_defaults@engine-defaults.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v2/bat-dg2-oem2/igt@xe_sysfs_defaults@engine-defaults.html">FAIL</a> +5 other tests fail</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9/bat-atsm-2/igt@xe_sysfs_defaults@engine-defaults.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v2/bat-atsm-2/igt@xe_sysfs_defaults@engine-defaults.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_defaults@engine-defaults@bcs:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9/bat-adlp-7/igt@xe_sysfs_defaults@engine-defaults@bcs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v2/bat-adlp-7/igt@xe_sysfs_defaults@engine-defaults@bcs.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-130913v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v2/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9 -&gt; xe-pw-130913v2</li>
</ul>
<p>IGT_7769: 7769<br />
  xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9: e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9<br />
  xe-pw-130913v2: 130913v2</p>

</body>
</html>

--===============0005635837677959924==--
