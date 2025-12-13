Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85986D59F60
	for <intel-xe@archiver.kernel.org>; Sat, 13 Dec 2025 01:35:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2446D10E9A6;
	Sat, 13 Dec 2025 01:35:56 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A798D10E977;
 Sat, 13 Dec 2025 01:35:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0527790494600876799=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Attempt_to_fixup_reset=2C_w?=
 =?utf-8?q?edge=2C_unload_corner_cases?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 13 Dec 2025 01:35:54 -0000
Message-ID: <176558975466.82897.7809460654189857623@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251212233444.1717326-1-matthew.brost@intel.com>
In-Reply-To: <20251212233444.1717326-1-matthew.brost@intel.com>
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

--===============0527790494600876799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Attempt to fixup reset, wedge, unload corner cases
URL   : https://patchwork.freedesktop.org/series/158884/
State : failure

== Summary ==

CI Bug Log - changes from xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f_BAT -> xe-pw-158884v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-158884v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-158884v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-158884v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-ptl-vm:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f/bat-ptl-vm/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158884v1/bat-ptl-vm/igt@core_hotunplug@unbind-rebind.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-ptl-1:          [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158884v1/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-bmg-2:          [PASS][5] -> [ABORT][6] +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158884v1/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - bat-bmg-1:          [PASS][7] -> [ABORT][8] +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158884v1/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
    - bat-ptl-2:          [PASS][9] -> [ABORT][10] +1 other test abort
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158884v1/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
    - bat-atsm-2:         [PASS][11] -> [ABORT][12] +1 other test abort
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158884v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  
Known issues
------------

  Here are the changes found in xe-pw-158884v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][13] -> [TIMEOUT][14] ([Intel XE#6506])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158884v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][15] -> [FAIL][16] ([Intel XE#6519])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158884v1/bat-dg2-oem2/igt@xe_waitfence@engine.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][17] -> [FAIL][18] ([Intel XE#6520])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158884v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * Linux: xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f -> xe-pw-158884v1

  IGT_8665: 1806ab9c982ccaaa9d60cdde16bc1dc3bb250654 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f: 54801dbae9da83dcad253f7fbe0e09864bfc028f
  xe-pw-158884v1: 158884v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158884v1/index.html

--===============0527790494600876799==
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
<tr><td><b>Series:</b></td><td>Attempt to fixup reset, wedge, unload corner cases</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158884/">https://patchwork.freedesktop.org/series/158884/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158884v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158884v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f_BAT -&gt; xe-pw-158884v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-158884v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-158884v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-158884v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f/bat-ptl-vm/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158884v1/bat-ptl-vm/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158884v1/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158884v1/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158884v1/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">ABORT</a> +1 other test abort</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158884v1/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">ABORT</a> +1 other test abort</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158884v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158884v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158884v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158884v1/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158884v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f -&gt; xe-pw-158884v1</li>
</ul>
<p>IGT_8665: 1806ab9c982ccaaa9d60cdde16bc1dc3bb250654 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4235-54801dbae9da83dcad253f7fbe0e09864bfc028f: 54801dbae9da83dcad253f7fbe0e09864bfc028f<br />
  xe-pw-158884v1: 158884v1</p>

</body>
</html>

--===============0527790494600876799==--
