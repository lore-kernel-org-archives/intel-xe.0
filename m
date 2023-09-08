Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32101EE57C4
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 05:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0D210E85F;
	Fri,  8 Sep 2023 05:10:20 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id D86BC10E0A9;
 Fri,  8 Sep 2023 05:10:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CEA60AADF2;
 Fri,  8 Sep 2023 05:10:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1757626719262585826=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Fri, 08 Sep 2023 05:10:17 -0000
Message-ID: <169414981780.14895.12026633836111579449@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
In-Reply-To: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Add_OA_fu?=
 =?utf-8?q?nctionality_to_Xe_=28rev5=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============1757626719262585826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add OA functionality to Xe (rev5)
URL   : https://patchwork.freedesktop.org/series/121084/
State : failure

== Summary ==

CI Bug Log - changes from xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf_BAT -> xe-pw-121084v5_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-121084v5_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-121084v5_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-121084v5_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@invalid-set-prop:
    - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html

  * igt@xe_exec_balancer@twice-cm-virtual-rebind:
    - bat-adlp-7:         [PASS][3] -> [FAIL][4] +43 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-adlp-7/igt@xe_exec_balancer@twice-cm-virtual-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-adlp-7/igt@xe_exec_balancer@twice-cm-virtual-rebind.html

  * igt@xe_exec_balancer@twice-virtual-userptr-invalidate:
    - bat-dg2-oem2:       [PASS][5] -> [FAIL][6] +38 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-dg2-oem2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-dg2-oem2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][7] -> [FAIL][8] +38 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-dg2-oem2:       [PASS][9] -> [TIMEOUT][10] +3 other tests timeout
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html
    - bat-atsm-2:         [PASS][11] -> [TIMEOUT][12] +2 other tests timeout
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - bat-adlp-7:         [PASS][13] -> [TIMEOUT][14] +5 other tests timeout
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
    - bat-dg2-oem2:       [PASS][15] -> [INCOMPLETE][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-atsm-2:         [PASS][17] -> [INCOMPLETE][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-atsm-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-atsm-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [PASS][19] -> [WARN][20] +1 other test warn
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
    - {bat-pvc-2}:        [PASS][21] -> [WARN][22] +1 other test warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-pvc-2/igt@xe_create@create-execqueues-leak.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-pvc-2/igt@xe_create@create-execqueues-leak.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [PASS][23] -> [WARN][24] +1 other test warn
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
    - bat-dg2-oem2:       [PASS][25] -> [WARN][26] +1 other test warn
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html

  * igt@xe_evict@evict-beng-small-external:
    - {bat-pvc-2}:        [FAIL][27] ([Intel XE#389]) -> [FAIL][28] +3 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-cm:
    - {bat-pvc-2}:        [DMESG-FAIL][29] ([Intel XE#482]) -> [FAIL][30] +3 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-pvc-2/igt@xe_evict@evict-small-cm.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  * {igt@xe_exec_basic@no-exec-bindexecqueue}:
    - bat-dg2-oem2:       [PASS][31] -> [FAIL][32] +10 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind}:
    - bat-atsm-2:         [PASS][33] -> [FAIL][34] +10 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - {bat-pvc-2}:        [PASS][35] -> [FAIL][36] +90 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-basic:
    - {bat-pvc-2}:        [PASS][37] -> [INCOMPLETE][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-pvc-2/igt@xe_exec_threads@threads-basic.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-pvc-2/igt@xe_exec_threads@threads-basic.html

  * igt@xe_module_load@load:
    - {bat-pvc-2}:        [PASS][39] -> [DMESG-WARN][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-pvc-2/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-pvc-2/igt@xe_module_load@load.html

  * {igt@xe_vm@bind-execqueues-independent}:
    - bat-adlp-7:         [PASS][41] -> [FAIL][42] +11 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html

  
Known issues
------------

  Here are the changes found in xe-pw-121084v5_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-dg2-oem2:       [PASS][43] -> [TIMEOUT][44] ([Intel XE#280] / [Intel XE#474])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html
    - bat-atsm-2:         [PASS][45] -> [TIMEOUT][46] ([Intel XE#280])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-atsm-2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-atsm-2/igt@xe_exec_threads@threads-mixed-fd-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/280
  [Intel XE#389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/389
  [Intel XE#474]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/474
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482


Build changes
-------------

  * Linux: xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf -> xe-pw-121084v5

  IGT_7474: 9d91cf2c6e7bb64d60c2030d1535e40ca0ad53ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf: 758f01ec2a6774fda1e8f8075d31f42b81783caf
  xe-pw-121084v5: 121084v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/index.html

--===============1757626719262585826==
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
<tr><td><b>Series:</b></td><td>Add OA functionality to Xe (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/121084/">https://patchwork.freedesktop.org/series/121084/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf_BAT -&gt; xe-pw-121084v5_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-121084v5_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-121084v5_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-121084v5_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-adlp-7/igt@xe_exec_balancer@twice-cm-virtual-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-adlp-7/igt@xe_exec_balancer@twice-cm-virtual-rebind.html">FAIL</a> +43 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-dg2-oem2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-dg2-oem2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">FAIL</a> +38 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> +38 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">TIMEOUT</a> +3 other tests timeout</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html">TIMEOUT</a> +2 other tests timeout</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">TIMEOUT</a> +5 other tests timeout</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-atsm-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-atsm-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_create@create-execqueues-leak}:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">WARN</a> +1 other test warn</p>
</li>
<li>
<p>{bat-pvc-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-pvc-2/igt@xe_create@create-execqueues-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-pvc-2/igt@xe_create@create-execqueues-leak.html">WARN</a> +1 other test warn</p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">WARN</a> +1 other test warn</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html">WARN</a> +1 other test warn</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>{bat-pvc-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/389">Intel XE#389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>{bat-pvc-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-pvc-2/igt@xe_evict@evict-small-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@no-exec-bindexecqueue}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>{bat-pvc-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">FAIL</a> +90 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-basic:</p>
<ul>
<li>{bat-pvc-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-pvc-2/igt@xe_exec_threads@threads-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-pvc-2/igt@xe_exec_threads@threads-basic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>{bat-pvc-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-pvc-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-pvc-2/igt@xe_module_load@load.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>{igt@xe_vm@bind-execqueues-independent}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-121084v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/280">Intel XE#280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/474">Intel XE#474</a>)</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-atsm-2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v5/bat-atsm-2/igt@xe_exec_threads@threads-mixed-fd-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/280">Intel XE#280</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf -&gt; xe-pw-121084v5</li>
</ul>
<p>IGT_7474: 9d91cf2c6e7bb64d60c2030d1535e40ca0ad53ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf: 758f01ec2a6774fda1e8f8075d31f42b81783caf<br />
  xe-pw-121084v5: 121084v5</p>

</body>
</html>

--===============1757626719262585826==--
