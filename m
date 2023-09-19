Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4EACE79A8
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 17:04:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9F110E13B;
	Tue, 19 Sep 2023 17:04:04 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3ADDB10E13B;
 Tue, 19 Sep 2023 17:04:03 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2EF33AADE1;
 Tue, 19 Sep 2023 17:04:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3451747621957507569=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Tue, 19 Sep 2023 17:04:03 -0000
Message-ID: <169514304318.3669.14038026712282075046@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
In-Reply-To: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Add_OA_fu?=
 =?utf-8?q?nctionality_to_Xe_=28rev6=29?=
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

--===============3451747621957507569==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add OA functionality to Xe (rev6)
URL   : https://patchwork.freedesktop.org/series/121084/
State : failure

== Summary ==

CI Bug Log - changes from xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082_BAT -> xe-pw-121084v6_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-121084v6_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-121084v6_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-121084v6_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@twice-cm-virtual-rebind:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] +42 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-adlp-7/igt@xe_exec_balancer@twice-cm-virtual-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-adlp-7/igt@xe_exec_balancer@twice-cm-virtual-rebind.html

  * igt@xe_exec_balancer@twice-virtual-userptr-invalidate:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] +38 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-dg2-oem2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-dg2-oem2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][5] -> [FAIL][6] +38 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-pvc-2:          NOTRUN -> [FAIL][7] +72 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-dg2-oem2:       [PASS][8] -> [TIMEOUT][9] +4 other tests timeout
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html
    - bat-atsm-2:         [PASS][10] -> [TIMEOUT][11] +2 other tests timeout
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - bat-adlp-7:         [PASS][12] -> [TIMEOUT][13] +5 other tests timeout
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
    - bat-pvc-2:          NOTRUN -> [INCOMPLETE][14]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-pvc-2:          NOTRUN -> [TIMEOUT][15] +4 other tests timeout
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-pvc-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  
#### Warnings ####

  * igt@xe_module_load@load:
    - bat-pvc-2:          [INCOMPLETE][16] ([Intel XE#597]) -> [DMESG-WARN][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-pvc-2/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-pvc-2/igt@xe_module_load@load.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [PASS][18] -> [WARN][19] +1 other test warn
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
    - bat-pvc-2:          NOTRUN -> [WARN][20] +1 other test warn
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-pvc-2/igt@xe_create@create-execqueues-leak.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [PASS][21] -> [WARN][22] +1 other test warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
    - bat-dg2-oem2:       [PASS][23] -> [WARN][24] +1 other test warn
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html

  * {igt@xe_exec_basic@no-exec-bindexecqueue}:
    - bat-dg2-oem2:       [PASS][25] -> [FAIL][26] +10 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind}:
    - bat-atsm-2:         [PASS][27] -> [FAIL][28] +10 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:
    - bat-pvc-2:          NOTRUN -> [FAIL][29] +25 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * {igt@xe_vm@bind-execqueues-independent}:
    - bat-adlp-7:         [PASS][30] -> [FAIL][31] +11 other tests fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html

  
Known issues
------------

  Here are the changes found in xe-pw-121084v6_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_compute_mode@twice-basic:
    - bat-adlp-7:         [PASS][32] -> [FAIL][33] ([Intel XE#715])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-dg2-oem2:       [PASS][34] -> [TIMEOUT][35] ([Intel XE#280] / [Intel XE#474])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html
    - bat-atsm-2:         [PASS][36] -> [INCOMPLETE][37] ([Intel XE#280])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-atsm-2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-atsm-2/igt@xe_exec_threads@threads-mixed-fd-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/280
  [Intel XE#474]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/474
  [Intel XE#597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/597
  [Intel XE#715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/715


Build changes
-------------

  * Linux: xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082 -> xe-pw-121084v6

  IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082: fac2e20c785bd790c250e4f4799dfa28e44e7082
  xe-pw-121084v6: 121084v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/index.html

--===============3451747621957507569==
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
<tr><td><b>Series:</b></td><td>Add OA functionality to Xe (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/121084/">https://patchwork.freedesktop.org/series/121084/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082_BAT -&gt; xe-pw-121084v6_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-121084v6_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-121084v6_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-121084v6_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-adlp-7/igt@xe_exec_balancer@twice-cm-virtual-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-adlp-7/igt@xe_exec_balancer@twice-cm-virtual-rebind.html">FAIL</a> +42 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-dg2-oem2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-dg2-oem2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">FAIL</a> +38 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> +38 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">FAIL</a> +72 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">TIMEOUT</a> +4 other tests timeout</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html">TIMEOUT</a> +2 other tests timeout</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">TIMEOUT</a> +5 other tests timeout</p>
</li>
<li>
<p>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-pvc-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">TIMEOUT</a> +4 other tests timeout</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-pvc-2/igt@xe_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/597">Intel XE#597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-pvc-2/igt@xe_module_load@load.html">DMESG-WARN</a></li>
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
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">WARN</a> +1 other test warn</p>
</li>
<li>
<p>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-pvc-2/igt@xe_create@create-execqueues-leak.html">WARN</a> +1 other test warn</p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">WARN</a> +1 other test warn</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html">WARN</a> +1 other test warn</p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@no-exec-bindexecqueue}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +25 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_vm@bind-execqueues-independent}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-121084v6_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/715">Intel XE#715</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/280">Intel XE#280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/474">Intel XE#474</a>)</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082/bat-atsm-2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-121084v6/bat-atsm-2/igt@xe_exec_threads@threads-mixed-fd-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/280">Intel XE#280</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082 -&gt; xe-pw-121084v6</li>
</ul>
<p>IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-383-fac2e20c785bd790c250e4f4799dfa28e44e7082: fac2e20c785bd790c250e4f4799dfa28e44e7082<br />
  xe-pw-121084v6: 121084v6</p>

</body>
</html>

--===============3451747621957507569==--
